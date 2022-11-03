    function a(address from, address to, uint256 amount) public {
        // ruleid: arbitrary-send-erc20
        erc20.transferFrom(address, to, am);
    }

        function b(address from, address to, uint256 amount) public {
        // ok: arbitrary-send-erc20
        erc20.transferFrom(msg.sender, to, am);
    }