pragma solidity 0.8.0;


contract Test{
    function func1() external{
        //ruleid: incorrect-use-of-blockhash
        bytes32 result1 = blockhash(block.number);

        //ruleid: incorrect-use-of-blockhash
        bytes32 result2 = blockhash(block.number + 1);
    
        //ruleid: incorrect-use-of-blockhash
        bytes32 result3 = blockhash(block.number * 2);

        //ruleid: incorrect-use-of-blockhash
        bytes32 result4 = block.blockhash(block.number);

        //ok: incorrect-use-of-blockhash
        bytes32 result5 = blockhash(block.number - 1);

        uint256 n = 123;
        //ok: incorrect-use-of-blockhash
        bytes32 result6 = blockhash(block.number - n);
    }
}