pragma solidity 0.8.0;


contract Test{
    function func1(address _contract, uint256 _num) external{
        //ruleid: delegatecall-to-arbitrary-address
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
    
    function func1_gaz(address _contract, uint256 _num) external{
        //ruleid: delegatecall-to-arbitrary-address
        (bool success, bytes memory data) = _contract.delegatecall{gas:10000}(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
    
    function func2(address payable _contract, uint256 _num) public{
        //ruleid: delegatecall-to-arbitrary-address
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

    function func3(uint256 useless, address  _contract, uint256 _num) external{
        //ruleid: delegatecall-to-arbitrary-address
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

    function test_taint(uint256 useless, address  _contract, uint256 _num) external {
        sink( _contract, _num);
    }

    function sink(address  _contract, uint256 _num) internal {
        // this requires intraprocedural tainting (--pro-intrafile)
        // proruleid: deeptodoruleid: delegatecall-to-arbitrary-address
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

    function upgradeToAndCall(address newImplementation, bytes calldata data)
        external
        payable
        ifAdmin
    {
        _upgradeTo(newImplementation);
        // ok: delegatecall-to-arbitrary-address
        (bool success, ) = newImplementation.delegatecall(data);
        require(success);
    }

    function diamondCut(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata
    ) external {
        require(msg.sender == owner, "not owner");
        bool changesMade = false;
        for (uint i = 0; i < _diamondCut.length; i++) {
            FacetCut memory facetCut = _diamondCut[i];
            address facetAddress_ = _diamondCut[i].facetAddress;
            if (!facetAddressExists(facetAddress_)) {
                addressIndex[facetAddress_] = addresses.length;
                addresses.push(facetCut.facetAddress);
            }
            for (uint j = 0; j < facetCut.functionSelectors.length; j++) {
                bytes4 selector = facetCut.functionSelectors[j];
                if (facetCut.action == FacetCutAction.Add) {
                    addSelector(selector, facetAddress_);
                    if (!changesMade) changesMade = true;
                }
                if (facetCut.action == FacetCutAction.Replace) {
                    replaceSelector(selector, facetAddress_);
                    if (!changesMade) changesMade = true;
                }
                if (facetCut.action == FacetCutAction.Remove) {
                    removeSelector(selector, facetAddress_);
                    if (!changesMade) changesMade = true;
                }
            }
        }
        if (_init != address(0)) {
            require(_calldata.length > 0, "empty calldata");
            // ok: delegatecall-to-arbitrary-address
            (bool success,) = _init.delegatecall(_calldata);
            require(success, "call unsuccessful");
        }
        if (changesMade) emit DiamondCut(_diamondCut, _init, _calldata);
    }

    function init(
        address implementationAddress,
        address newOwner,
        bytes memory params
    ) external {
        address owner;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            owner := sload(_OWNER_SLOT)
        }
        if (msg.sender != owner) revert NotOwner();
        if (implementation() != address(0)) revert AlreadyInitialized();
        if (IUpgradable(implementationAddress).contractId() != contractId()) revert InvalidImplementation();

        // solhint-disable-next-line no-inline-assembly
        assembly {
            sstore(_IMPLEMENTATION_SLOT, implementationAddress)
            sstore(_OWNER_SLOT, newOwner)
        }
        // ok: delegatecall-to-arbitrary-address
        (bool success, ) = implementationAddress.delegatecall(
            //0x9ded06df is the setup selector.
            abi.encodeWithSelector(0x9ded06df, params)
        );
        if (!success) revert SetupFailed();
    }
}