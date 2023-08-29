contract Test {
    // ok: uniswap-callback-not-protected
    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external {

        require(msg.sender == factory.getPair(IUniswapV2Pair(msg.sender).token0(), IUniswapV2Pair(msg.sender).token1()));

        (address borrower, 
        address collateralMarket, 
        address borrowMarket,
        uint amount,
        address collateralToken, 
        address borrowToken,
        bool isEthCollateralMarket,
        bool isEthBorrowMarket) = abi.decode(data, (address, address, address, uint, address, address, bool, bool));

        if (isEthBorrowMarket) {
            IWETH(WETH).withdraw(amount);
        }


        IERC20(borrowToken).safeApprove(liquidateLends,amount);
        bytes memory callData = abi.encodeWithSignature("doLiquidate(address,address,address,uint256,address,address)", 
            borrower, 
            collateralMarket, 
            borrowMarket, 
            amount, 
            isEthCollateralMarket ? ETH : collateralToken, 
            isEthBorrowMarket ? ETH : borrowToken
        );
        liquidateLends.call(callData);
        
        
        if (isEthCollateralMarket) {
            IWETH(WETH).deposit{value : address(this).balance}();
        }

        _payBackPair(msg.sender, amount0, amount1, borrowToken, collateralToken);
    }

    // ruleid: uniswap-callback-not-protected
    function uniswapV2Call(address payable _sender, uint _amount0, uint _amount1, bytes calldata _data) external {
        // access control
        emit Log("uniswapV2Call");
        // decode data
        (
            SwapType _swapType,
            address _tokenBorrow,
            address _pairAddress,
            address _tokenPay,
            uint _amount,
            bool _isBorrowingEth,
            bool _isPayingEth,
            bytes memory _triangleData,
            bytes memory _userData
        ) = abi.decode(_data, (SwapType, address, address, address, uint, bool, bool, bytes, bytes));

        permissionedPairAddress = _pairAddress;
        console.log("SENDER", msg.sender);
        console.log("permissionedPairAddress", permissionedPairAddress);
        // require(msg.sender == permissionedPairAddress, "only permissioned UniswapV2 pair can call");
        require(_sender == address(this), "only this contract may initiate");

        address[] memory _tokenPath = new address[](2);

        address token0 = IUniswapV2Pair(_pairAddress).token0();
        address token1 = IUniswapV2Pair(_pairAddress).token1();
        
        _tokenPath[0] = (token0 == WETH) ? token0 : token1;
        _tokenPath[1] = (token1 == WETH) ? token1 : token0;
        
        if (_swapType == SwapType.SimpleLoan) {
            simpleFlashLoanExecute(
                _tokenBorrow, 
                msg.sender, 
                _amount, 
                _isBorrowingEth, 
                _isPayingEth, 
                _userData);
            return;
        } else if (_swapType == SwapType.SimpleSwap) {
            simpleFlashSwapExecute(_tokenBorrow, _amount, _tokenPay, msg.sender, _isBorrowingEth, _isPayingEth, _userData);
            return;
        } else {
            traingularFlashSwapExecute(_tokenBorrow, _pairAddress, _tokenPay, _amount, _triangleData, _userData);
        }

        // NOOP to silence compiler "unused parameter" warning
        if (false) {
            _amount0;
            _amount1;
        }
    }

    // ok: uniswap-callback-not-protected
    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes calldata _data
    ) external override {
        require(amount0Delta > 0 || amount1Delta > 0); // swaps entirely within 0-liquidity regions are not supported
        SwapCallbackData memory data = abi.decode(_data, (SwapCallbackData));
        (address tokenIn, address tokenOut, uint24 fee) = data.path.decodeFirstPool();
        CallbackValidation.verifyCallback(factory, tokenIn, tokenOut, fee);

        (bool isExactInput, uint256 amountToPay) =
            amount0Delta > 0
                ? (tokenIn < tokenOut, uint256(amount0Delta))
                : (tokenOut < tokenIn, uint256(amount1Delta));
        if (isExactInput) {
            pay(tokenIn, data.payer, msg.sender, amountToPay);
        } else {
            // either initiate the next swap or pay
            if (data.path.hasMultiplePools()) {
                data.path = data.path.skipToken();
                exactOutputInternal(amountToPay, msg.sender, 0, data);
            } else {
                amountInCached = amountToPay;
                tokenIn = tokenOut; // swap in/out because exact output swaps are reversed
                pay(tokenIn, data.payer, msg.sender, amountToPay);
            }
        }
    }
    
    // ok: uniswap-callback-not-protected
    function uniswapV3SwapCallback(int256 _amount0Delta, int256 _amount1Delta, bytes calldata _data)
        external
        override(IUniswapV3SwapCallback)
    {
        // Swaps entirely within 0-liquidity regions are not supported
        if (_amount0Delta <= 0 && _amount1Delta <= 0) revert InvalidDeltaAmounts();
        // Uniswap pools always call callback on msg.sender so this check is enough to prevent malicious behavior
        if (msg.sender == LUSD_USDC_POOL) {
            SwapCallbackData memory data = abi.decode(_data, (SwapCallbackData));
            // Repay debt in full
            (address upperHint, address lowerHint) = _getHints();
            BORROWER_OPERATIONS.adjustTrove(0, data.collToWithdraw, data.debtToRepay, false, upperHint, lowerHint);

            // Pay LUSD_USDC_POOL for the swap by passing it as a recipient to the next swap (WETH -> USDC)
            IUniswapV3PoolActions(USDC_ETH_POOL).swap(
                LUSD_USDC_POOL, // recipient
                false, // zeroForOne
                -_amount1Delta, // amount of USDC to pay to LUSD_USDC_POOL for the swap
                SQRT_PRICE_LIMIT_X96,
                ""
            );
        } else if (msg.sender == USDC_ETH_POOL) {
            // Pay USDC_ETH_POOL for the USDC
            uint256 amountToPay = uint256(_amount1Delta);
            IWETH(WETH).deposit{value: amountToPay}(); // wrap only what is needed to pay
            IWETH(WETH).transfer(address(USDC_ETH_POOL), amountToPay);
        } else {
            revert ErrorLib.InvalidCaller();
        }
    }

    // ok: uniswap-callback-not-protected
    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external override {
        address[] memory path = new address[](2);
        uint amountToken;
        uint amountETH;
        { // scope for token{0,1}, avoids stack too deep errors
        address token0 = IUniswapV2Pair(msg.sender).token0();
        address token1 = IUniswapV2Pair(msg.sender).token1();
        assert(msg.sender == UniswapV2Library.pairFor(factory, token0, token1)); // ensure that msg.sender is actually a V2 pair
        assert(amount0 == 0 || amount1 == 0); // this strategy is unidirectional
        path[0] = amount0 == 0 ? token0 : token1;
        path[1] = amount0 == 0 ? token1 : token0;
        amountToken = token0 == address(WETH) ? amount1 : amount0;
        amountETH = token0 == address(WETH) ? amount0 : amount1;
        }

        assert(path[0] == address(WETH) || path[1] == address(WETH)); // this strategy only works with a V2 WETH pair
        IERC20 token = IERC20(path[0] == address(WETH) ? path[1] : path[0]);
        IUniswapV1Exchange exchangeV1 = IUniswapV1Exchange(factoryV1.getExchange(address(token))); // get V1 exchange

        if (amountToken > 0) {
            (uint minETH) = abi.decode(data, (uint)); // slippage parameter for V1, passed in by caller
            token.approve(address(exchangeV1), amountToken);
            uint amountReceived = exchangeV1.tokenToEthSwapInput(amountToken, minETH, uint(-1));
            uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountToken, path)[0];
            assert(amountReceived > amountRequired); // fail if we didn't get enough ETH back to repay our flash loan
            WETH.deposit{value: amountRequired}();
            assert(WETH.transfer(msg.sender, amountRequired)); // return WETH to V2 pair
            (bool success,) = sender.call{value: amountReceived - amountRequired}(new bytes(0)); // keep the rest! (ETH)
            assert(success);
        } else {
            (uint minTokens) = abi.decode(data, (uint)); // slippage parameter for V1, passed in by caller
            WETH.withdraw(amountETH);
            uint amountReceived = exchangeV1.ethToTokenSwapInput{value: amountETH}(minTokens, uint(-1));
            uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountETH, path)[0];
            assert(amountReceived > amountRequired); // fail if we didn't get enough tokens back to repay our flash loan
            assert(token.transfer(msg.sender, amountRequired)); // return tokens to V2 pair
            assert(token.transfer(sender, amountReceived - amountRequired)); // keep the rest! (tokens)
        }
    }

    // ok: uniswap-callback-not-protected
    function uniswapV3MintCallback(
        uint256 amount0Owed,
        uint256 amount1Owed,
        bytes calldata data
    ) external {
        IUniswapV3Pool _pool = IUniswapV3Pool(pool);
        // Only the pool can use this function
        require(msg.sender == address(_pool)); // dev: callback only called by pool
        // Send the required funds to the pool
        IERC20(_pool.token0()).safeTransfer(address(_pool), amount0Owed);
        IERC20(_pool.token1()).safeTransfer(address(_pool), amount1Owed);
    }

    // ok: uniswap-callback-not-protected
    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes calldata data
    ) external override swapCallBack nonReentrant {
        (address pool, address payer) = abi.decode(data, (address, address));
        require(_msgSender() == pool, "callback caller");
        if (amount0Delta > 0) {
            IERC20(IUniswapV3Pool(pool).token0()).safeTransferFrom(
                payer,
                pool,
                uint256(amount0Delta)
            );
        } else {
            IERC20(IUniswapV3Pool(pool).token1()).safeTransferFrom(
                payer,
                pool,
                uint256(amount1Delta)
            );
        }
    }

    // ruleid: uniswap-callback-not-protected
    function uniswapV3SwapCallback(
        int256 amount0Delta,
        int256 amount1Delta,
        bytes calldata _data
    ) external override {
        require(amount0Delta > 0 || amount1Delta > 0); // swaps entirely within 0-liquidity regions are not supported
        SwapCallbackData memory data = abi.decode(_data, (SwapCallbackData));
        (address tokenIn, address tokenOut, uint24 fee) = data.path.decodeFirstPool();
        //CallbackValidation.verifyCallback(factory, tokenIn, tokenOut, fee);

        (bool isExactInput, uint256 amountToPay) =
            amount0Delta > 0
                ? (tokenIn < tokenOut, uint256(amount0Delta))
                : (tokenOut < tokenIn, uint256(amount1Delta));
        if (isExactInput) {
            pay(tokenIn, data.payer, msg.sender, amountToPay);
        } else {
            // either initiate the next swap or pay
            if (data.path.hasMultiplePools()) {
                data.path = data.path.skipToken();
                exactOutputInternal(amountToPay, msg.sender, 0, data);
            } else {
                amountInCached = amountToPay;
                tokenIn = tokenOut; // swap in/out because exact output swaps are reversed
                pay(tokenIn, data.payer, msg.sender, amountToPay);
            }
        }
    }

    // ruleid: uniswap-callback-not-protected
    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external override {
        address[] memory path = new address[](2);
        uint amountToken;
        uint amountETH;
        { // scope for token{0,1}, avoids stack too deep errors
        address token0 = IUniswapV2Pair(msg.sender).token0();
        address token1 = IUniswapV2Pair(msg.sender).token1();
        //assert(msg.sender == UniswapV2Library.pairFor(factory, token0, token1)); // ensure that msg.sender is actually a V2 pair
        assert(amount0 == 0 || amount1 == 0); // this strategy is unidirectional
        path[0] = amount0 == 0 ? token0 : token1;
        path[1] = amount0 == 0 ? token1 : token0;
        amountToken = token0 == address(WETH) ? amount1 : amount0;
        amountETH = token0 == address(WETH) ? amount0 : amount1;
        }

        assert(path[0] == address(WETH) || path[1] == address(WETH)); // this strategy only works with a V2 WETH pair
        IERC20 token = IERC20(path[0] == address(WETH) ? path[1] : path[0]);
        IUniswapV1Exchange exchangeV1 = IUniswapV1Exchange(factoryV1.getExchange(address(token))); // get V1 exchange

        if (amountToken > 0) {
            (uint minETH) = abi.decode(data, (uint)); // slippage parameter for V1, passed in by caller
            token.approve(address(exchangeV1), amountToken);
            uint amountReceived = exchangeV1.tokenToEthSwapInput(amountToken, minETH, uint(-1));
            uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountToken, path)[0];
            assert(amountReceived > amountRequired); // fail if we didn't get enough ETH back to repay our flash loan
            WETH.deposit{value: amountRequired}();
            assert(WETH.transfer(msg.sender, amountRequired)); // return WETH to V2 pair
            (bool success,) = sender.call{value: amountReceived - amountRequired}(new bytes(0)); // keep the rest! (ETH)
            assert(success);
        } else {
            (uint minTokens) = abi.decode(data, (uint)); // slippage parameter for V1, passed in by caller
            WETH.withdraw(amountETH);
            uint amountReceived = exchangeV1.ethToTokenSwapInput{value: amountETH}(minTokens, uint(-1));
            uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountETH, path)[0];
            assert(amountReceived > amountRequired); // fail if we didn't get enough tokens back to repay our flash loan
            assert(token.transfer(msg.sender, amountRequired)); // return tokens to V2 pair
            assert(token.transfer(sender, amountReceived - amountRequired)); // keep the rest! (tokens)
        }
    }

    // ruleid: uniswap-callback-not-protected
    function uniswapV3MintCallback(
        uint256 amount0Owed,
        uint256 amount1Owed,
        bytes calldata data
    ) external {
        IUniswapV3Pool _pool = IUniswapV3Pool(pool);
        // Only the pool can use this function
        //require(msg.sender == address(_pool)); // dev: callback only called by pool
        // Send the required funds to the pool
        IERC20(_pool.token0()).safeTransfer(address(_pool), amount0Owed);
        IERC20(_pool.token1()).safeTransfer(address(_pool), amount1Owed);
    }
}