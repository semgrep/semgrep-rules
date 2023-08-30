// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Test {
    function doit1(uint256 a) public pure returns (uint256 x) {
        // ruleid: use-nested-if
        if (1 == 1 && 2==2) {
            return 1;
        }
    }

    function doit2(uint256 a) public pure returns (uint256 x) {
        // ok: use-nested-if
        if (true) {
            return a;
        }
    }
}