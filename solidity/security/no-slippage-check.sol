// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract UniswapSwaps {
    function uniswapV2Swap(
        uint amountIn,
        uint amountOutMin,
        uint amountOutMax
    ) external returns (uint amountOut) {
        weth.transferFrom(msg.sender, address(this), amountIn);
        weth.approve(address(router), amountIn);

        address[] memory path;
        path = new address[](2);
        path[0] = WETH;
        path[1] = DAI;
        uint deadline = block.timestamp;

        // ok: no-slippage-check
        uint[] memory amounts = router.swapExactTokensForTokens(
            amountIn,
            amountOutMin,
            path,
            msg.sender,
            block.timestamp
        );

        // ruleid: no-slippage-check
        uint[] memory amounts1 = router.swapExactTokensForTokens(
            amountIn,
            0,
            path,
            msg.sender,
            block.timestamp
        );

        // ok: no-slippage-check
        router.swapExactETHForTokens{value: msg.value}(
            amountOut,
            path,
            msg.sender,
            deadline
        );

        // ruleid: no-slippage-check
        router.swapExactETHForTokens{value: msg.value}(
            0,
            path,
            msg.sender,
            deadline
        );

        // ok: no-slippage-check
        router.swapTokensForExactTokens(
            amountOutDesired,
            amountOutMax,
            path,
            msg.sender,
            block.timestamp
        );

        // ok: no-slippage-check
        router.swapTokensForExactTokens(
             amounts[i],
             (inputAmount[0] * (BASE_UNIT + slippage)) / BASE_UNIT,
             elkPaths[address(tokens[i])],
             msg.sender,
             block.timestamp + 1000
         );

         // ruleid: no-slippage-check
         router.swapTokensForExactTokens(
             amounts[i],
             2 ** 256 - 1,
             elkPaths[address(tokens[i])],
             msg.sender,
             block.timestamp + 1000
         );

        // ruleid: no-slippage-check
        router.swapTokensForExactTokens(
            amountOutDesired,
            uint256(-1),
            path,
            msg.sender,
            block.timestamp
        );

        // ok: no-slippage-check
        router.swapTokensForExactETH(
            amountOut, 
            amountInMax, 
            path,
            msg.sender,
            deadline
        );

        // ruleid: no-slippage-check
        router.swapTokensForExactETH(
            amountOut, 
            type(uint256).max, 
            path,
            msg.sender,
            deadline
        );

        // ok: no-slippage-check
        router.swapExactTokensForETH(amountIn, amountOutMin, path, msg.sender, deadline);

        // ruleid: no-slippage-check
        router.swapExactTokensForETH(amountIn, 0, path, msg.sender, deadline);

        // ok: no-slippage-check
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(amountIn, amountOutMin, path, msg.sender, deadline);

        // ruleid: no-slippage-check
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(amountIn, 0, path, msg.sender, deadline);

        // ok: no-slippage-check
        router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: 123}(amountOutMin, path, msg.sender, deadline);

        // ruleid: no-slippage-check
        router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: msg.value}(0, path, msg.sender, deadline);

        // ok: no-slippage-check
        router.swapExactTokensForETHSupportingFeeOnTransferTokens(amountIn, amountOutMin, path, msg.sender, deadline);

        // ruleid: no-slippage-check
        router.swapExactTokensForETHSupportingFeeOnTransferTokens(amountIn, 0, path, msg.sender, deadline);

        // ok: no-slippage-check
        pool.swap(
            address(this),
            swapQuantity > 0,
            swapQuantity > 0 ? swapQuantity : -swapQuantity,
            sqrtPriceLimitX96,
            abi.encode(amountMin)
        );

        // ok: no-slippage-check
        pair.swap(amount0Out, amount1Out, to, new bytes(0));
        // ok: no-slippage-check
        pair.swap(0, amountOut, to, new bytes(0));
        // ok: no-slippage-check
        pair.swap(amountOut, 0, to, new bytes(0));

        return amounts[1];
    }

    // ruleid: no-slippage-check
    function uniswapV3Swap1(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external override {
        FlashCallbackData memory decoded = abi.decode(data, (FlashCallbackData));
        CallbackValidation.verifyCallback(factory, decoded.poolKey);

        address token0 = decoded.poolKey.token0;
        address token1 = decoded.poolKey.token1;

        uint256 amount0Min = LowGasSafeMath.add(decoded.amount0, fee0);
        uint256 amount1Min = LowGasSafeMath.add(decoded.amount1, fee1);

        TransferHelper.safeApprove(token1, address(swapRouter), decoded.amount1);
        ISwapRouter.ExactInputSingleParams params = ISwapRouter.ExactInputSingleParams({
                    tokenIn: token1,
                    tokenOut: token0,
                    fee: decoded.poolFee2,
                    recipient: address(this),
                    deadline: block.timestamp,
                    amountIn: decoded.amount1,
                    amountOutMinimum: 0,
                    sqrtPriceLimitX96: 0
                })
        uint256 amountOut0 =
            swapRouter.exactInputSingle(
                params
            );
    }

    // ok: no-slippage-check
    function uniswapV3Swap1Ok(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external override {
        FlashCallbackData memory decoded = abi.decode(data, (FlashCallbackData));
        CallbackValidation.verifyCallback(factory, decoded.poolKey);

        address token0 = decoded.poolKey.token0;
        address token1 = decoded.poolKey.token1;

        uint256 amount0Min = LowGasSafeMath.add(decoded.amount0, fee0);
        uint256 amount1Min = LowGasSafeMath.add(decoded.amount1, fee1);

        TransferHelper.safeApprove(token1, address(swapRouter), decoded.amount1);
        ISwapRouter.ExactInputSingleParams params = ISwapRouter.ExactInputSingleParams({
                    tokenIn: token1,
                    tokenOut: token0,
                    fee: decoded.poolFee2,
                    recipient: address(this),
                    deadline: block.timestamp,
                    amountIn: decoded.amount1,
                    amountOutMinimum: amount0Min,
                    sqrtPriceLimitX96: 0
                })
        uint256 amountOut0 =
            swapRouter.exactInputSingle(
                params
            );
    }

    function uniswapV3Swap2(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external override {
        FlashCallbackData memory decoded = abi.decode(data, (FlashCallbackData));
        CallbackValidation.verifyCallback(factory, decoded.poolKey);

        address token0 = decoded.poolKey.token0;
        address token1 = decoded.poolKey.token1;

        uint256 amount0Min = LowGasSafeMath.add(decoded.amount0, fee0);
        uint256 amount1Min = LowGasSafeMath.add(decoded.amount1, fee1);

        TransferHelper.safeApprove(token1, address(swapRouter), decoded.amount1);
        // ruleid: no-slippage-check
        uint256 amountOut0 =
            swapRouter.exactInputSingle(
                ISwapRouter.ExactInputSingleParams({
                    tokenIn: token1,
                    tokenOut: token0,
                    fee: decoded.poolFee2,
                    recipient: address(this),
                    deadline: block.timestamp,
                    amountIn: decoded.amount1,
                    amountOutMinimum: 0,
                    sqrtPriceLimitX96: 0
                })
            );
    }

    // ok: no-slippage-check
    function uniswapV3Swap2Ok(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external override {
        FlashCallbackData memory decoded = abi.decode(data, (FlashCallbackData));
        CallbackValidation.verifyCallback(factory, decoded.poolKey);

        address token0 = decoded.poolKey.token0;
        address token1 = decoded.poolKey.token1;

        uint256 amount0Min = LowGasSafeMath.add(decoded.amount0, fee0);
        uint256 amount1Min = LowGasSafeMath.add(decoded.amount1, fee1);

        TransferHelper.safeApprove(token1, address(swapRouter), decoded.amount1);
        uint256 amountOut0 =
            swapRouter.exactInputSingle(
                ISwapRouter.ExactInputSingleParams({
                    tokenIn: token1,
                    tokenOut: token0,
                    fee: decoded.poolFee2,
                    recipient: address(this),
                    deadline: block.timestamp,
                    amountIn: decoded.amount1,
                    amountOutMinimum: amount0Min,
                    sqrtPriceLimitX96: 0
                })
            );
    }

    // ok: no-slippage-check
    function uniswapV3Swap3Ok(uint256 amountOut, uint256 amountInMaximum) external returns (uint256 amountIn) {
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountInMaximum);
        TransferHelper.safeApprove(DAI, address(swapRouter), amountInMaximum);

        ISwapRouter.ExactOutputSingleParams memory params =
            ISwapRouter.ExactOutputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: amountInMaximum,
                sqrtPriceLimitX96: 0
            });

        amountIn = swapRouter.exactOutputSingle(params);

        if (amountIn < amountInMaximum) {
            TransferHelper.safeApprove(DAI, address(swapRouter), 0);
            TransferHelper.safeTransfer(DAI, msg.sender, amountInMaximum - amountIn);
        }
    }

    // ruleid: no-slippage-check
    function uniswapV3Swap3Ok(uint256 amountOut, uint256 amountInMaximum) external returns (uint256 amountIn) {
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountInMaximum);
        TransferHelper.safeApprove(DAI, address(swapRouter), amountInMaximum);

        ISwapRouter.ExactOutputSingleParams memory params =
            ISwapRouter.ExactOutputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: uint(-1),
                sqrtPriceLimitX96: 0
            });

        amountIn = swapRouter.exactOutputSingle(params);

        if (amountIn < amountInMaximum) {
            TransferHelper.safeApprove(DAI, address(swapRouter), 0);
            TransferHelper.safeTransfer(DAI, msg.sender, amountInMaximum - amountIn);
        }
    }

    
    function uniswapV3Swap3Ok(uint256 amountOut, uint256 amountInMaximum) external returns (uint256 amountIn) {
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountInMaximum);
        TransferHelper.safeApprove(DAI, address(swapRouter), amountInMaximum);
        // ok: no-slippage-check
        amountIn = swapRouter.exactOutputSingle(ISwapRouter.ExactOutputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: amountInMaximum,
                sqrtPriceLimitX96: 0
            }));

        if (amountIn < amountInMaximum) {
            TransferHelper.safeApprove(DAI, address(swapRouter), 0);
            TransferHelper.safeTransfer(DAI, msg.sender, amountInMaximum - amountIn);
        }
    }

    
    function uniswapV3Swap3Ok(uint256 amountOut, uint256 amountInMaximum) external returns (uint256 amountIn) {
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountInMaximum);
        TransferHelper.safeApprove(DAI, address(swapRouter), amountInMaximum);
        // ruleid: no-slippage-check
        amountIn = swapRouter.exactOutputSingle(ISwapRouter.ExactOutputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH9,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: uint256(-1),
                sqrtPriceLimitX96: 0
            }));

        if (amountIn < amountInMaximum) {
            TransferHelper.safeApprove(DAI, address(swapRouter), 0);
            TransferHelper.safeTransfer(DAI, msg.sender, amountInMaximum - amountIn);
        }
    }

    function exactInputInternalOk(
        uint256 amountIn,
        address recipient,
        uint160 sqrtPriceLimitX96,
        SwapCallbackData memory data
    ) external returns (uint256 amountOut) {
        // allow swapping to the router address with address 0
        if (recipient == address(0)) recipient = address(this);

        (address tokenIn, address tokenOut, uint24 fee) = data.path.decodeFirstPool();

        bool zeroForOne = tokenIn < tokenOut;

        (int256 amount0, int256 amount1) =
            // ok: no-slippage-check
            getPool(tokenIn, tokenOut, fee).swap(
                recipient,
                zeroForOne,
                amountIn.toInt256(),
                sqrtPriceLimitX96,
                abi.encode(data)
            );

        return uint256(-(zeroForOne ? amount1 : amount0));
    }

    function exactInputInternalOk(
        uint256 amountIn,
        address recipient,
        uint160 sqrtPriceLimitX96,
        SwapCallbackData memory data
    ) external returns (uint256 amountOut) {
        // allow swapping to the router address with address 0
        if (recipient == address(0)) recipient = address(this);

        (address tokenIn, address tokenOut, uint24 fee) = data.path.decodeFirstPool();

        bool zeroForOne = tokenIn < tokenOut;

        (int256 amount0, int256 amount1) =
            // ruleid: no-slippage-check
            getPool(tokenIn, tokenOut, fee).swap(
                recipient,
                zeroForOne,
                amountIn.toInt256(),
                0,
                abi.encode(data)
            );

        return uint256(-(zeroForOne ? amount1 : amount0));
    }
}
