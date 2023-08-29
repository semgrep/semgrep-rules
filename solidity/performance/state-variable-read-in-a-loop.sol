// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Test {
    uint256 z;
    function doit1(uint256 a) public pure returns (uint256 x) {
        // ruleid: state-variable-read-in-a-loop
        for (uint256 i; i<z;i++) {
            // do smth
        }
    }

    function doit2(uint256 a) public pure returns (uint256 x) {
        // ruleid: state-variable-read-in-a-loop
        for (uint256 i; i<z;i++) {
            // ruleid: state-variable-read-in-a-loop
            uint256 k = z;
        }
    }

    function doit3(uint256 a) public pure returns (uint256 x) {
        // ruleid: state-variable-read-in-a-loop
        while (i<z) {
            // ruleid: state-variable-read-in-a-loop
            uint256 k = z;
        }
    }

    function doit4(uint256 a) public pure returns (uint256 x) {
        // ok: state-variable-read-in-a-loop
        while (i<10) {
            //...
        }
    }
}

contract Test2 {
    uint256 another_var;

    function doit5(uint256 a) public pure returns (uint256 x) {
        // ok: state-variable-read-in-a-loop
        for (uint256 i; i<z;i++) {
            // do smth
        }
    }
}

contract Test3 {
    uint256 immutable another_var = 100;

    function doit5(uint256 a) public pure returns (uint256 x) {
        uint256 var = 10;
        // ok: state-variable-read-in-a-loop
        for (uint256 i; i<z;i++) {
            var += another_var;
        }
    }
}

contract Test4 {
    uint256 immutable another_var;

    constructor() {
        another_var = 101;
    }
    function doit5(uint256 a) public pure returns (uint256 x) {
        uint256 var = 10;
        // ok: state-variable-read-in-a-loop
        for (uint256 i; i<z;i++) {
            var += another_var;
        }
    }
}

contract Test5 {
    uint256 constant another_var = 100;

    function doit5(uint256 a) public pure returns (uint256 x) {
        uint256 var = 10;
        // ok: state-variable-read-in-a-loop
        for (uint256 i; i<z;i++) {
            var += another_var;
        }
    }
}