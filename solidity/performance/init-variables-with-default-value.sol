// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Example_1 {
    // ok: init-variables-with-default-value
    bool constant var5 = false;
    function setUint() public returns(uint256) {
        // ok: init-variables-with-default-value
        uint256 x = 0;
        return x;
    }
}

contract Example_2 {
    // ruleid: init-variables-with-default-value
    uint256 y = 0;
}

contract Example_3 {
    // ruleid: init-variables-with-default-value
    bytes variable = "";
    function setBool() public returns(bool) {
        // ok: init-variables-with-default-value
        bool z = false;
        return z;
    }
}


contract Example_4 {
    // ok: init-variables-with-default-value
    uint256 immutable variable = 0;
    constructor(){}
    function setBool() public returns(bool) {
        // ok: init-variables-with-default-value
        bool z = false;
        return z;
    }
}

contract Example_5 {
    // ok: init-variables-with-default-value
    uint256 immutable variable;
    constructor(){
        variable = 0;
    }
    function setBool() public returns(bool) {
        // ok: init-variables-with-default-value
        bool z = false;
        return z;
    }
}