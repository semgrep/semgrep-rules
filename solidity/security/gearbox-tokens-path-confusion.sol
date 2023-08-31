// SPDX-License-Identifier: GPL-2.0-or-later
// Gearbox Protocol. Generalized leverage for DeFi protocols
// (c) Gearbox Holdings, 2021
pragma solidity ^0.7.4;
pragma abicoder v2;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {SafeMath} from "@openzeppelin/contracts/math/SafeMath.sol";
import {ISwapRouter} from "../integrations/uniswap/IUniswapV3.sol";
import {BytesLib} from "../integrations/uniswap/BytesLib.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ICreditFilter} from "../interfaces/ICreditFilter.sol";
import {ICreditManager} from "../interfaces/ICreditManager.sol";
import {CreditManager} from "../credit/CreditManager.sol";
import {Errors} from "../libraries/helpers/Errors.sol";


/// @title UniswapV3 Router adapter
contract UniswapV3Adapter is ISwapRouter, ReentrancyGuard {
    using BytesLib for bytes;
    using SafeMath for uint256;

    ICreditManager public creditManager;
    ICreditFilter public creditFilter;
    address public router;

    /// @dev The length of the bytes encoded address
    uint256 private constant ADDR_SIZE = 20;

    /// @dev Constructor
    /// @param _creditManager Address Credit manager
    /// @param _router Address of ISwapRouter
    constructor(address _creditManager, address _router) {
        require(
            _creditManager != address(0) && _router != address(0),
            Errors.ZERO_ADDRESS_IS_NOT_ALLOWED
        );
        creditManager = ICreditManager(_creditManager);
        creditFilter = ICreditFilter(creditManager.creditFilter());
        router = _router;
    }

    /// @notice Swaps `amountIn` of one token for as much as possible of another token
    /// @param params The parameters necessary for the swap, encoded as `ExactInputSingleParams` in calldata
    /// @return amountOut The amount of the received token
    function exactInputSingle(ExactInputSingleParams calldata params)
        external
        payable
        override
        nonReentrant
        returns (uint256 amountOut)
    {
        address creditAccount = creditManager.getCreditAccountOrRevert(
            msg.sender
        );

        creditManager.provideCreditAccountAllowance(
            creditAccount,
            router,
            params.tokenIn
        );

        ExactInputSingleParams memory paramsUpdate = params;
        paramsUpdate.recipient = creditAccount;

        // 0x414bf389 = exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))
        bytes memory data = abi.encodeWithSelector(
            bytes4(0x414bf389), // +
            paramsUpdate
        );

        uint256 balanceInBefore = IERC20(paramsUpdate.tokenIn).balanceOf(
            creditAccount
        );

        uint256 balanceOutBefore = IERC20(paramsUpdate.tokenOut).balanceOf(
            creditAccount
        );

        (amountOut) = abi.decode(
            creditManager.executeOrder(msg.sender, router, data),
            (uint256)
        );

        creditFilter.checkCollateralChange(
            creditAccount,
            params.tokenIn,
            params.tokenOut,
            balanceInBefore.sub(
                IERC20(paramsUpdate.tokenIn).balanceOf(creditAccount)
            ),
            IERC20(paramsUpdate.tokenOut).balanceOf(creditAccount).sub(
                balanceOutBefore
            )
        );
    }

    /// @notice Swaps `amountIn` of one token for as much as possible of another along the specified path
    /// @param params The parameters necessary for the multi-hop swap, encoded as `ExactInputParams` in calldata
    /// @return amountOut The amount of the received token
    function exactInput(ExactInputParams calldata params)
        external
        payable
        override
        nonReentrant
        returns (uint256 amountOut)
    {
        address creditAccount = creditManager.getCreditAccountOrRevert(
            msg.sender
        );

        (address tokenIn, address tokenOut) = _extractTokens(params.path);

        creditManager.provideCreditAccountAllowance(
            creditAccount,
            router,
            tokenIn
        );

        ExactInputParams memory paramsUpdate = params;
        paramsUpdate.recipient = creditAccount;

        uint256 balanceInBefore = IERC20(tokenIn).balanceOf(creditAccount);
        uint256 balanceOutBefore = IERC20(tokenOut).balanceOf(creditAccount);

        {
            // 0xc04b8d59 = exactInput((bytes,address,uint256,uint256,uint256))
            bytes memory data = abi.encodeWithSelector(
                bytes4(0xc04b8d59), // +
                paramsUpdate
            );

            (amountOut) = abi.decode(
                creditManager.executeOrder(msg.sender, router, data),
                (uint256)
            );
        }

        creditFilter.checkCollateralChange(
            creditAccount,
            tokenIn,
            tokenOut,
            balanceInBefore.sub(IERC20(tokenIn).balanceOf(creditAccount)),
            IERC20(tokenOut).balanceOf(creditAccount).sub(balanceOutBefore)
        );
    }

    /// @notice Swaps as little as possible of one token for `amountOut` of another token
    /// @param params The parameters necessary for the swap, encoded as `ExactOutputSingleParams` in calldata
    /// @return amountIn The amount of the input token
    function exactOutputSingle(ExactOutputSingleParams calldata params)
        external
        payable
        override
        nonReentrant
        returns (uint256 amountIn)
    {
        address creditAccount = creditManager.getCreditAccountOrRevert(
            msg.sender
        );

        creditManager.provideCreditAccountAllowance(
            creditAccount,
            router,
            params.tokenIn
        );

        ExactOutputSingleParams memory paramsUpdate = params;
        paramsUpdate.recipient = creditAccount;

        //
        bytes memory data = abi.encodeWithSelector(
            bytes4(0xdb3e2198), //+
            paramsUpdate
        );

        uint256 balanceInBefore = IERC20(paramsUpdate.tokenIn).balanceOf(
            creditAccount
        );

        uint256 balanceOutBefore = IERC20(paramsUpdate.tokenOut).balanceOf(
            creditAccount
        );

        (amountIn) = abi.decode(
            creditManager.executeOrder(msg.sender, router, data),
            (uint256)
        );

        creditFilter.checkCollateralChange(
            creditAccount,
            params.tokenIn,
            params.tokenOut,
            balanceInBefore.sub(
                IERC20(paramsUpdate.tokenIn).balanceOf(creditAccount)
            ),
            IERC20(paramsUpdate.tokenOut).balanceOf(creditAccount).sub(
                balanceOutBefore
            )
        );
    }

    /// @notice Swaps as little as possible of one token for `amountOut` of another along the specified path (reversed)
    /// @param params The parameters necessary for the multi-hop swap, encoded as `ExactOutputParams` in calldata
    /// @return amountIn The amount of the input token
    function exactOutput(ExactOutputParams calldata params)
        external
        payable
        override
        nonReentrant
        returns (uint256 amountIn)
    {
        address creditAccount = creditManager.getCreditAccountOrRevert(
            msg.sender
        );

        (address tokenOut, address tokenIn) = _extractTokens(params.path);

        creditManager.provideCreditAccountAllowance(
            creditAccount,
            router,
            tokenIn
        );

        ExactOutputParams memory paramsUpdate = params;
        paramsUpdate.recipient = creditAccount;

        uint256 balanceInBefore = IERC20(tokenIn).balanceOf(creditAccount);
        uint256 balanceOutBefore = IERC20(tokenOut).balanceOf(creditAccount);

        {
            bytes memory data = abi.encodeWithSelector(
                bytes4(0xf28c0498), // exactOutput((bytes,address,uint256,uint256,uint256))
                paramsUpdate
            );

            (amountIn) = abi.decode(
                creditManager.executeOrder(msg.sender, router, data),
                (uint256)
            );
        }

        creditFilter.checkCollateralChange(
            creditAccount,
            tokenIn,
            tokenOut,
            balanceInBefore.sub(IERC20(tokenIn).balanceOf(creditAccount)),
            IERC20(tokenOut).balanceOf(creditAccount).sub(balanceOutBefore)
        );
    }

    function _extractTokens(bytes memory path)
        internal
        pure
        returns (address tokenA, address tokenB)
    {
        tokenA = path.toAddress(0);
        // ruleid: gearbox-tokens-path-confusion
        tokenB = path.toAddress(path.length - ADDR_SIZE);
    }
}
