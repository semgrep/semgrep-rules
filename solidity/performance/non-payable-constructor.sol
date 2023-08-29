pragma solidity 0.8.15;


contract Test1{
    //ruleid: non-payable-constructor
    constructor(){}
}

contract Test2{
    //ok: non-payable-constructor
    constructor() payable{}
}

abstract contract Test3{
    //ok: non-payable-constructor
    constructor(){}
}