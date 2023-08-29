// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BALBBA3USDOracle is IOracle, IOracleValidate {

    function check() internal view {
        // ok: balancer-readonly-reentrancy-getpooltokens  
        (address[] memory poolTokens, , ) = getVault().getPoolTokens(getPoolId());
    }
    function test() view {
        // ruleid: balancer-readonly-reentrancy-getpooltokens  
        (, uint256[] memory balances, ) = IVault(VAULT_ADDRESS).getPoolTokens(poolId);
    }

    function getPrice(address token) external view returns (uint) {
        (
            address[] memory poolTokens,
            uint256[] memory balances,
        // ruleid: balancer-readonly-reentrancy-getpooltokens  
        ) = vault.getPoolTokens(IPool(token).getPoolId());

        uint256[] memory weights = IPool(token).getNormalizedWeights();

        uint length = weights.length;
        uint temp = 1e18;
        uint invariant = 1e18;
        for(uint i; i < length; i++) {
            temp = temp.mulDown(
                (oracleFacade.getPrice(poolTokens[i]).divDown(weights[i]))
                .powDown(weights[i])
            );
            invariant = invariant.mulDown(
                (balances[i] * 10 ** (18 - IERC20(poolTokens[i]).decimals()))
                .powDown(weights[i])
            );
        }
        return invariant
            .mulDown(temp)
            .divDown(IPool(token).totalSupply());
    }  
}

abstract contract LinearPool {
    function check() internal view {
        // ok: balancer-readonly-reentrancy-getpooltokens  
        (, uint256[] memory registeredBalances, ) = getVault().getPoolTokens(getPoolId());
    }
}

contract Sentiment {

    function checkReentrancy() internal {
        vault.manageUserBalance(new IVault.UserBalanceOp[](0));
    }

    function getPrice(address token) external returns (uint) {
        checkReentrancy();
        (
            address[] memory poolTokens,
            uint256[] memory balances,
        // ok: balancer-readonly-reentrancy-getpooltokens
        ) = vault.getPoolTokens(IPool(token).getPoolId());
        
        //...
    }  
}

contract Testing {

    function getPrice(address token) external returns (uint) {
        
        (
            address[] memory poolTokens,
            uint256[] memory balances,
        // ok: balancer-readonly-reentrancy-getpooltokens
        ) = vault.getPoolTokens(IPool(token).getPoolId());
        
        vault.manageUserBalance(new IVault.UserBalanceOp[](0));

        //...
    }
}

contract TestingSecondCase {

    function checkReentrancy() internal {
        VaultReentrancyLib.ensureNotInVaultContext(getVault());
    }

    function getPrice(address token) external returns (uint) {
        checkReentrancy();
        
        (
            address[] memory poolTokens,
            uint256[] memory balances,
        // ok: balancer-readonly-reentrancy-getpooltokens
        ) = vault.getPoolTokens(IPool(token).getPoolId());
        
        //...
    }  

    function getPrice2(address token) external returns (uint) {
        
        (
            address[] memory poolTokens,
            uint256[] memory balances,
        // ruleid: balancer-readonly-reentrancy-getpooltokens
        ) = vault.getPoolTokens(IPool(token).getPoolId());
        
        //...
    }  

    function getPrice3(address token) external returns (uint) {
        VaultReentrancyLib.ensureNotInVaultContext(getVault());
        (
            address[] memory poolTokens,
            uint256[] memory balances,
        // ok: balancer-readonly-reentrancy-getpooltokens
        ) = vault.getPoolTokens(IPool(token).getPoolId());
        
        //...
    }  
}