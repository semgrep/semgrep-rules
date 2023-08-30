// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.2;

contract TestRequiere {
    function test(uint256 a) public {
        uint len = supportedTokens.length;
        // ruleid: unnecessary-checked-arithmetic-in-loop
        for (uint i; i < len; i++) {
            uint256 variable;
            // ok: unnecessary-checked-arithmetic-in-loop
            count++;
        }
    }

    function test2(uint256 a) public {
        uint len = supportedTokens.length;
        // ruleid: unnecessary-checked-arithmetic-in-loop
        for (uint i = 0; i < len; i++) {
            // ...
            uint256 variable;
        }
    }

    function test3(uint256 a) public {
        uint len = supportedTokens.length;
        for (uint i; i < len;) {
            // ruleid: unnecessary-checked-arithmetic-in-loop
            i++;
            uint256 pp = 10;
        }
    }

    function test4(uint256 a) public {
        uint len = supportedTokens.length;
        for (uint i = 0; i < len;) {
            // ruleid: unnecessary-checked-arithmetic-in-loop
            ++i;
            uint256 pp = 10;
        }
    }

    function test5(uint256 a) public {
        uint len = supportedTokens.length;
        for (uint i = 0; i < len;) {
            // ok: unnecessary-checked-arithmetic-in-loop
            unchecked {
                ++i;
            }
            uint256 pp = 10;
        }
    }
}