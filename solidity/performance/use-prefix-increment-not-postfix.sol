// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.2;

contract TestRequiere {
    function test(uint256 a) public {
        // ruleid: use-prefix-increment-not-postfix
        for (uint i; i < len; i++) {
            if (i % 2 == 0) {
                // ruleid: use-prefix-increment-not-postfix
                counter++;
            }
            // ok: use-prefix-increment-not-postfix
            uint256 k = 5 + i++; 
        }
    }

    function test2() public {
        // ok: use-prefix-increment-not-postfix
        for (uint i; i < len; ++i) {
            if (i % 2 == 0) {
                // ok: use-prefix-increment-not-postfix
                ++counter;
            }
            // ...
        }
    }

    function test3() public {
        for (uint i; i < len;) {
            // ok: use-prefix-increment-not-postfix
            if (i++ == 5) {
            }
            // ...
        }
    }

    function test4() public {
        // ruleid: use-prefix-increment-not-postfix
        proposalCount++;
        proposal = Proposal({
            // ok: use-prefix-increment-not-postfix
            id: proposalCount++,
            targets: targets,
            values: values,
            signatures: signatures,
            calldatas: calldatas,
            eta: eta,
            executed: false
        });
    }

    function test5() public returns (uint) {
        // ok: use-prefix-increment-not-postfix
        return (count++);
    }
}


