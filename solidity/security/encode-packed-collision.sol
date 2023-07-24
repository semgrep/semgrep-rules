contract Test {
  
  function f(string memory a, bytes memory b) public pure returns (bytes32) {
    // ruleid: encode-packed-collision
    return keccak256(abi.encodePacked(a, b));
  }

  function f2(bytes memory a, bytes memory b) public pure returns (bytes32) {
    // ruleid: encode-packed-collision
    bytes memory x = abi.encodePacked(a, b);
    return keccak256(x);
  }

  function query(
        address from,
        uint timeout,
        string calldata dataSource,
        string calldata selector
    )
        external
        returns (uint)
    {
        if (getCodeSize(from) > 0) {
            bytes memory bs = bytes(selector);
            // '': Return whole raw response;
            // Starts with '$': response format is parsed as json.
            // Starts with '/': response format is parsed as xml/html.
            if (bs.length == 0 || bs[0] == '$' || bs[0] == '/') {
                // ruleid: encode-packed-collision
                uint queryId = uint(keccak256(abi.encodePacked(
                    ++requestIdSeed, from, timeout, dataSource, selector)));
                uint idx = dispatchJob(TrafficType.UserQuery, queryId);
                // TODO: keep id receipt and handle later in v2.0.
                if (idx == UINTMAX) {
                    emit LogMessage("No live working group, skipped query");
                    return 0;
                }
                Group storage grp = workingGroups[workingGroupIds[idx]];
                PendingRequests[queryId] = PendingRequest(queryId, grp.groupId,grp.groupPubKey, from);
                emit LogUrl(
                    queryId,
                    timeout,
                    dataSource,
                    selector,
                    lastRandomness,
                    grp.groupId
                );
                DOSPaymentInterface(addressBridge.getPaymentAddress()).chargeServiceFee(from,queryId,uint(TrafficType.UserQuery));
                return queryId;
            } else {
                emit LogNonSupportedType(selector);
                return 0;
            }
        } else {
            // Skip if @from is not contract address.
            emit LogNonContractCall(from);
            return 0;
        }
    }
}

import "./ECDSA.sol";

contract AccessControl {
    using ECDSA for bytes32;
    mapping(address => bool) isAdmin;
    mapping(address => bool) isRegularUser;
    // Add admins and regular users.
    function addUsers(
        address[] calldata admins,
        address[] calldata regularUsers,
        bytes calldata signature
    )
        external
    {
        if (!isAdmin[msg.sender]) {
            // Allow calls to be relayed with an admin's signature.
            // ruleid: encode-packed-collision
            bytes32 hash = keccak256(abi.encodePacked(admins, regularUsers));
            address signer = hash.toEthSignedMessageHash().recover(signature);
            require(isAdmin[signer], "Only admins can add users.");
        }
        for (uint256 i = 0; i < admins.length; i++) {
            isAdmin[admins[i]] = true;
        }
        for (uint256 i = 0; i < regularUsers.length; i++) {
            isRegularUser[regularUsers[i]] = true;
        }
    }
}
