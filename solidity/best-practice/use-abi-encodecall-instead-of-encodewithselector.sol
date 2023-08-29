// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestCall {
    function make_call(address collection, uint256 a, uint256 b) external returns(bool success, bytes memory data) {
        // ok: use-abi-encodecall-instead-of-encodewithselector
        (success, data) = collection.staticcall(abi.encodeCall(Test.divide, (a, b)));
    }

    function make_call2(address collection, uint256 a, uint256 b) external returns(bool success, bytes memory data) {
        // ruleid: use-abi-encodecall-instead-of-encodewithselector
        (success, data) = collection.call(abi.encodeWithSelector(ITest.divide.selector, (a, b)));
    }

    function _transferNFT(
        address collection,
        uint256 assetType,
        address sender,
        address recipient,
        uint256[] memory itemIds,
        uint256[] memory amounts
    ) internal {
        address transferManager = managerSelectorOfAssetType[assetType].transferManager;

        if (transferManager == address(0)) {
            revert NoTransferManagerForAssetType(assetType);
        }

        // ruleid: use-abi-encodecall-instead-of-encodewithselector
        (bool status, ) = transferManager.call(
            abi.encodeWithSelector(
                managerSelectorOfAssetType[assetType].selector,
                collection,
                sender,
                recipient,
                itemIds,
                amounts
            )
        );

        if (!status) {
            revert NFTTransferFail(collection, assetType);
        }
    }
}