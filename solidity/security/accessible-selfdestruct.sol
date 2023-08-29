pragma solidity 0.8.19;

contract Test{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    function func1(address to) external{
        //ruleid: accessible-selfdestruct
        selfdestruct(to);
    }

    function func2(address tmp, address to) public{
        //ruleid: accessible-selfdestruct
        selfdestruct(to);
    }

    function func3(address tmp, address tmp1, address to) public{
        //ruleid: accessible-selfdestruct
        selfdestruct(to);
    }

    function func4(address tmp, address tmp1, address tmp3, address to) external{
        //ruleid: accessible-selfdestruct
        selfdestruct(to);
    }

    function func5(address to) public{
        address payable addr = payable(to);
        //ruleid: accessible-selfdestruct
        selfdestruct(addr);
    }

    function func6(address to) public onlyOwner {
        address payable addr = payable(to);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func7(address to) external onlyOwner {
        address payable addr = payable(to);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func8(address to) external checkAddress(to){
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func9(address to) external{
        require(msg.sender == owner);
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func10(address to) external{
        require(msg.sender == owner, "Not an owner");
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func11(address to) external{
        require(_msgSender() == owner);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func12(address to) public{
        if (msg.sender == owner){
            //ok: accessible-selfdestruct
            selfdestruct(to);
        }
    }

    function func13(address to) external{
        onlyOwner(msg.sender);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func14(address to) external{
        onlyOwner(msg.sender);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func15(address to) external{
        requireOwner(msg.sender);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func16(address to) external{
        _requireOwnership(msg.sender);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func17(address to) external{
        _requireOwnership(msg.sender);
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func18(address to) external{
        Test1._enforceIsContractOwner(_msgSender);        
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func19(address to) external{
        Test1._enforceOwner(msg.sender);    

        //ok: accessible-selfdestruct
        selfdestruct(to);
    }

    function func20(address to) external{
        Test1.enforceIsContractOwner(_msgSender);        
        
        //ok: accessible-selfdestruct
        selfdestruct(to);
    }
}