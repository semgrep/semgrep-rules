// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Test {
    
    function doSmthng() public returns(uint256) {
        // ruleid: array-length-outside-loop
        for (uint256 i = 0; i < array.length;) {
            // invariant: array's length is not changed
        }
    }
}

contract Test2 {
    address[2] all_data = [address(0), address(0)];
    address[] all_data_2;
    function doSmthng() public returns(uint256) {
        uint256 len = array.length;
        // ok: array-length-outside-loop
        for (uint256 i = 0; i < len;) {
            // invariant: array's length is not changed
        }
    }

    function doSmthng2(address[] calldata arr) public returns(uint256) {
        // ok: array-length-outside-loop
        for (uint256 i = 0; i < arr.length;) {
            // invariant: array's length is not changed
        }
    }

    function doSmthng3() public returns(uint256) {
        address[2] storage arr = all_data;
        // ok: array-length-outside-loop
        for (uint256 i = 0; i < arr.length;) {
            // invariant: array's length is not changed
        }
    }

    function doSmthng4() public returns(uint256) {
        address[] storage arr = all_data_2;
        // ruleid: array-length-outside-loop
        for (uint256 i = 0; i < arr.length;) {
            // invariant: array's length is not changed
        }
    }

}

contract Test3 {
    
    function doSmthng() public returns(uint256) {
        uint256 i = 0;
        while (i != 200) {
            i++;
            // ruleid: array-length-outside-loop
            uint256 len = array.length;
            // invariant: array's length is not changed
        }
    }
}