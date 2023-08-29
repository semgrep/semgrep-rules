pragma solidity ^0.5.16;

import "./SafeMath.sol";

interface IFeed {
    function decimals() external view returns (uint8);
    function latestAnswer() external view returns (uint);
}

interface IKeep3rV2 {
    function current(address tokenIn, uint amountIn, address tokenOut) external view returns (uint256 amountOut, uint lastUpdatedAgo);
}

contract InvFeed is IFeed {
    using SafeMath for uint;

    IKeep3rV2 public keep3rV2Feed;
    IFeed public ethFeed;
    address public inv;
    address public weth;

    constructor(IKeep3rV2 _keep3rV2Feed, IFeed _ethFeed, address _inv, address _weth) public {
        keep3rV2Feed = _keep3rV2Feed;
        ethFeed = _ethFeed;
        inv = _inv;
        weth = _weth;
    }

    function decimals() public view returns(uint8) {
        return 18;
    }

    function latestAnswer() public view returns (uint) {
        // ruleid: keeper-network-oracle-manipulation
        (uint invEthPrice, ) = keep3rV2Feed.current(inv, 1e18, weth);
        return invEthPrice
            .mul(ethFeed.latestAnswer())
            .div(10**uint256(ethFeed.decimals()));
    }

}