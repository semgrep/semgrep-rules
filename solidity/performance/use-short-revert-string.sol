// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.2;

contract TestRequiere {
    function test(uint256 a) public {
        // ruleid: use-short-revert-string
        require(a>10, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"); // "a"*33
    }

    function testRevert(uint256 a) public {
        if (a > 10) {
        // ruleid: use-short-revert-string
            revert("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"); // "a"*33
        }
    }

    function test2(uint256 a) public {
        // ok: use-short-revert-string
        require(a>10, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"); // "a"*32
    }

    function test3(uint256 a) public {
        // ok: use-short-revert-string
        require(a>10, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'); // "a"*32
    }
}