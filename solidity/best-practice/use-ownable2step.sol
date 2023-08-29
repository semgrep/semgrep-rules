pragma solidity >=0.7.4;

//ruleid: use-ownable2step
contract Test is ITest, Ownable {
    function payment() public {
        // ...
    }
}

//ok: use-ownable2step
contract Test is ITest, Ownable2Step {
    function payment() public {
        // ...
    }
}