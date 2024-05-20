function _update(address from, address to, uint256 value, bool mint) internal virtual {
    uint256 fromBalance = _balances[from];
    uint256 toBalance = _balances[to];
    if (fromBalance < value) {
        revert ERC20InsufficientBalance(from, fromBalance, value);
    }

    //No need to adjust balances when transfer is to self, prevent self NFT-grind

    unchecked {
        // Overflow not possible: value <= fromBalance <= totalSupply.
        // ruleid: missing-self-transfer-check-ercx
        _balances[from] = fromBalance - value;
        // ruleid: missing-self-transfer-check-ercx
        _balances[to] = toBalance + value;
    

        if(mint) {
            // Skip burn for certain addresses to save gas
            bool wlf = whitelist[from];
            if (!wlf) {
                uint256 tokens_to_burn = (fromBalance / tokensPerNFT) - ((fromBalance - value) / tokensPerNFT);
                if(tokens_to_burn > 0)
                    _burnBatch(from, tokens_to_burn);
            }

            // Skip minting for certain addresses to save gas
            if (!whitelist[to]) {
                if(easyLaunch == 1 && wlf && from == owner()) {
                    //auto-initialize first (assumed) LP
                    whitelist[to] = true;
                    easyLaunch = 2;
                } else {
                    uint256 tokens_to_mint = ((toBalance + value) / tokensPerNFT) - (toBalance / tokensPerNFT);
                    if(tokens_to_mint > 0)
                        _mintWithoutCheck(to, tokens_to_mint);
                }
            }
        }
    }

    emit Transfer(from, to, value);
}


function _update(address from, address to, uint256 value, bool mint) internal virtual {
    uint256 fromBalance = _balances[from];
    uint256 toBalance = _balances[to];
    if (fromBalance < value) {
        revert ERC20InsufficientBalance(from, fromBalance, value);
    }

    //No need to adjust balances when transfer is to self, prevent self NFT-grind
    if (from != to) {
        unchecked {
            // Overflow not possible: value <= fromBalance <= totalSupply.
            //ok: missing-self-transfer-check-ercx
            _balances[from] = fromBalance - value;

            // Overflow not possible: balance + value is at most totalSupply, which we know fits into a uint256.
            //ok: missing-self-transfer-check-ercx
            _balances[to] = toBalance + value;
        }

        if(mint) {
            // Skip burn for certain addresses to save gas
            bool wlf = whitelist[from];
            if (!wlf) {
                uint256 tokens_to_burn = (fromBalance / tokensPerNFT) - ((fromBalance - value) / tokensPerNFT);
                if(tokens_to_burn > 0)
                    _burnBatch(from, tokens_to_burn);
            }

            // Skip minting for certain addresses to save gas
            if (!whitelist[to]) {
                if(easyLaunch == 1 && wlf && from == owner()) {
                    //auto-initialize first (assumed) LP
                    whitelist[to] = true;
                    easyLaunch = 2;
                } else {
                    uint256 tokens_to_mint = ((toBalance + value) / tokensPerNFT) - (toBalance / tokensPerNFT);
                    if(tokens_to_mint > 0)
                        _mintWithoutCheck(to, tokens_to_mint);
                }
            }
        }
    }

    emit Transfer(from, to, value);
}
