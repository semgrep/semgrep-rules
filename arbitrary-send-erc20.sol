    // ruleid: arbitrary-send-erc20
    function a(address from, address to, uint256 amount) public {
        erc20.transferFrom(address, to, am);
    }

    // ok: arbitrary-send-erc20
        function b(address from, address to, uint256 amount) public {
        erc20.transferFrom(msg.sender, to, am);
    }