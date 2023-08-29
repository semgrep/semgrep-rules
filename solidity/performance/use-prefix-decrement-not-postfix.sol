// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.2;

contract TestRequiere {
    function test(uint256 a) public {
        // ruleid: use-prefix-decrement-not-postfix
        for (uint i=len; i > 0; i--) {
            if (i % 2 == 0) {
                // ruleid: use-prefix-decrement-not-postfix
                counter--;
            }
            // ok: use-prefix-decrement-not-postfix
            uint256 k = 5 + i--; 
        }
    }

    function test2() public {
        // ok: use-prefix-decrement-not-postfix
        for (uint i=len; i > 0; --i) {
            if (i % 2 == 0) {
                // ok: use-prefix-decrement-not-postfix
                --counter;
            }
            // ...
        }
    }

    function test3() public {
        for (uint i; i < len;) {
            // ok: use-prefix-decrement-not-postfix
            if (i-- == 5) {
            }
            // ...
        }
    }

    function test4() public {
        // ruleid: use-prefix-decrement-not-postfix
        proposalCount--;
        proposal = Proposal({
            // ok: use-prefix-decrement-not-postfix
            id: proposalCount--,
            targets: targets,
            values: values,
            signatures: signatures,
            calldatas: calldatas,
            eta: eta,
            executed: false
        });
    }

    function test5() public returns (uint) {
        // ok: use-prefix-decrement-not-postfix
        return (count--);
    }
}


