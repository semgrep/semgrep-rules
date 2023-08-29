pragma solidity 0.8.0;


contract Test1{
    uint256 a;
    uint256 b;
    uint256 c;
    
    function f1() {
        // ruleid: non-optimal-variables-swap
        c = a;
        a = b;
        b = c;
    }
}

contract Tes2{
    uint256 a;
    uint256 b;
    
    function f1() {
        // ruleid: non-optimal-variables-swap
        uint256 c = a;
        a = b;
        b = c;
    }

    function f1() {
        // ruleid: non-optimal-variables-swap
        uint256 c = a;
        a = b;
        f1();
        b = c;
    }
}

contract Test3{
    uint256 a;
    uint256 b;
    uint256 c;
    
    function f1() {
        // ok: non-optimal-variables-swap
        (b, a) = (a, b); 
    }
}