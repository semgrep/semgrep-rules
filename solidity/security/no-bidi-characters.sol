contract GuessTheNumber
{
    uint _secretNumber;
    address payable _owner;
    event success(string);
    event wrongNumber(string);

    constructor(uint secretNumber) payable public
    {
        require(secretNumber <= 10);
        _secretNumber = secretNumber;
        _owner = msg.sender;    
    }

    function getValue() view public returns (uint)
    {
        return address(this).balance;
    }

    function guess(uint n) payable public
    {
        require(msg.value == 1 ether);

        uint p = address(this).balance;
        // ruleid: no-bidi-characters
        checkAndTransferPrize(/*The prize‮/*rebmun desseug*/n , p/*‭
                /*The user who should benefit */,msg.sender);
    }

// ruleid: no-bidi-characters
// ‪             # left-to-right embedding (LRE)
// ruleid: no-bidi-characters
// ‫             # right-to-left embedding (RLE)
// ruleid: no-bidi-characters
// ‭             # left-to-right override (LRO)
// ruleid: no-bidi-characters
// ‮             # right-to-left override (RLO)
// ruleid: no-bidi-characters
//⁦             # left-to-right isolate (LRI)
// ruleid: no-bidi-characters
//⁧             # right-to-left isolate (RLI)
// ruleid: no-bidi-characters
//⁨             # first strong isolate (FSI)
// ruleid: no-bidi-characters
// ‬             # pop directional formatting (PDF)
// ruleid: no-bidi-characters
//⁩             # pop directional isolate (PDI)

    function checkAndTransferPrize(uint p, uint n, address payable guesser) internal returns(bool)
    {
        if(n == _secretNumber)
        {
            guesser.transfer(p);
            emit success("You guessed the correct number!");
        }
        else
        {
            emit wrongNumber("You've made an incorrect guess!");
        }
    }

    function kill() public
    {
        require(msg.sender == _owner);
        selfdestruct(_owner);
    }
}
