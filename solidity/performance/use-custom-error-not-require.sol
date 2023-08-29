// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.5;

contract TestRequiere {
    function test(uint256 a) public {
        // ruleid: use-custom-error-not-require
        require(a>10, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"); // "a"*33
    }
}