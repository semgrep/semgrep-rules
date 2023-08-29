// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Test {
    function doit1(uint256 a) public pure returns (uint256 x) {
        // ok: use-multiple-require
        require (1 == 1 || 2==2, "...");
    }

    function doit2(uint256 a) public pure returns (uint256 x) {
        // ruleid: use-multiple-require
        require(1==1 && 2==2, "smth went wrong");
    }

    function doit2(uint256 a) public pure returns (uint256 x) {
        // ok: use-multiple-require
        require(msg.sender == admin, "Timelock::cancelTransaction: Call must come from admin.");
    }
}