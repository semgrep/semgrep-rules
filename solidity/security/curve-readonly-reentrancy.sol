// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CurveBuggyContract {
    function _getPrice(IPriceOracle _priceOracle, ILPCurve _lpCurve)
        internal
        virtual
        returns (uint256)
    {
        ICurvePool _pool = ICurvePool(_lpCurve.minter());
        IiToken _coin = IiToken(_pool.coins(0));
        if (_coin == ETH) _coin = iETH;
        
        ICurvePoolOwner(getCurvePoolOwner()).withdraw_admin_fees(_pool);
        return
            _priceOracle.getUnderlyingPrice(_coin).mul(
                // ok: curve-readonly-reentrancy
                _pool.get_virtual_price()
            ) / 10**uint256(doubleDecimals).sub(uint256(_coin.decimals()));
    }

    function __setPoolInfo2(address _pool, address _invariantProxyAsset, bool _reentrantVirtualPrice) private {
        uint256 lastValidatedVirtualPrice;
        if (_reentrantVirtualPrice) {
            // Validate the virtual price by calling a non-reentrant pool function
            // ruleid: curve-readonly-reentrancy
            lastValidatedVirtualPrice = ICurveLiquidityPool(_pool).get_virtual_price();

            emit ValidatedVirtualPriceForPoolUpdated(_pool, lastValidatedVirtualPrice);
        }

        poolToPoolInfo[_pool] = PoolInfo({
            invariantProxyAsset: _invariantProxyAsset,
            invariantProxyAssetDecimals: ERC20(_invariantProxyAsset).decimals(),
            lastValidatedVirtualPrice: uint88(lastValidatedVirtualPrice)
        });

        emit InvariantProxyAssetForPoolSet(_pool, _invariantProxyAsset);
    }

    function __setPoolInfo(address _pool, address _invariantProxyAsset, bool _reentrantVirtualPrice) private {
        uint256 lastValidatedVirtualPrice;
        if (_reentrantVirtualPrice) {
            // Validate the virtual price by calling a non-reentrant pool function
            __makeNonReentrantPoolCall(_pool);
            // ok: curve-readonly-reentrancy
            lastValidatedVirtualPrice = ICurveLiquidityPool(_pool).get_virtual_price();

            emit ValidatedVirtualPriceForPoolUpdated(_pool, lastValidatedVirtualPrice);
        }

        poolToPoolInfo[_pool] = PoolInfo({
            invariantProxyAsset: _invariantProxyAsset,
            invariantProxyAssetDecimals: ERC20(_invariantProxyAsset).decimals(),
            lastValidatedVirtualPrice: uint88(lastValidatedVirtualPrice)
        });

        emit InvariantProxyAssetForPoolSet(_pool, _invariantProxyAsset);
    }

    /// @dev Helper to call a known non-reenterable pool function
    function __makeNonReentrantPoolCall(address _pool) private {
        ICurvePoolOwner(getCurvePoolOwner()).withdraw_admin_fees(_pool);
    }
}