pragma solidity ^0.5.16;

import "./PriceOracle.sol";
import "./RBep20.sol";

interface oracleChainlink {
    function decimals() external view returns (uint8);
    function latestRoundData()
    external
    view
    returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );
}

contract SimplePriceOracle is PriceOracle {
    mapping(address => uint) prices;

    event PricePosted(address asset, uint previousPriceMantissa, uint requestedPriceMantissa, uint newPriceMantissa);

    mapping(address => oracleChainlink) public oracleData;

    constructor() public {
    }
    // ruleid: oracle-price-update-not-restricted
    function setOracleData(address rToken, oracleChainlink _oracle) external {
        oracleData[rToken] = _oracle;
    }

    function getUnderlyingPrice(RToken rToken) public view returns (uint) {
        uint decimals = oracleData[address(rToken)].decimals();
        (uint80 roundId,int256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound) = oracleData[address(rToken)].latestRoundData();
        return 10 ** (18 - decimals) * uint(answer);
    }
}


// AAVE v2 (but vulnerable)
contract AaveFallbackOracle is Ownable, IPriceOracleGetter {
  using SafeMath for uint256;
  struct Price {
    uint64 blockNumber;
    uint64 blockTimestamp;
    uint128 price;
  }
  event PricesSubmitted(address sybil, address[] assets, uint128[] prices);
  event SybilAuthorized(address indexed sybil);
  event SybilUnauthorized(address indexed sybil);
  uint256 public constant PERCENTAGE_BASE = 1e4;
  mapping(address => Price) private _prices;
  mapping(address => bool) private _sybils;
  modifier onlySybil {
    _requireWhitelistedSybil(msg.sender);
    _;
  }
  function authorizeSybil(address sybil) external onlyOwner {
    _sybils[sybil] = true;
    emit SybilAuthorized(sybil);
  }
  function unauthorizeSybil(address sybil) external onlyOwner {
    _sybils[sybil] = false;
    emit SybilUnauthorized(sybil);
  }
  // ok: oracle-price-update-not-restricted
  function submitPrices(address[] calldata assets, uint128[] calldata prices) external onlySybil {
    require(assets.length == prices.length, 'INCONSISTENT_PARAMS_LENGTH');
    for (uint256 i = 0; i < assets.length; i++) {
      _prices[assets[i]] = Price(uint64(block.number), uint64(block.timestamp), prices[i]);
    }
    emit PricesSubmitted(msg.sender, assets, prices);
  }
  function getAssetPrice(address asset) external view override returns (uint256) {
    return uint256(_prices[asset].price);
  }
  function isSybilWhitelisted(address sybil) public view returns (bool) {
    return _sybils[sybil];
  }
  function getPricesData(address[] calldata assets) external view returns (Price[] memory) {
    Price[] memory result = new Price[](assets.length);
    for (uint256 i = 0; i < assets.length; i++) {
      result[i] = _prices[assets[i]];
    }
    return result;
  }
  function filterCandidatePricesByDeviation(
    uint256 deviation,
    address[] calldata assets,
    uint256[] calldata candidatePrices
  ) external view returns (address[] memory, uint256[] memory) {
    require(assets.length == candidatePrices.length, 'INCONSISTENT_PARAMS_LENGTH');
    address[] memory filteredAssetsWith0s = new address[](assets.length);
    uint256[] memory filteredCandidatesWith0s = new uint256[](assets.length);
    uint256 end0sInLists;
    for (uint256 i = 0; i < assets.length; i++) {
      uint128 currentOraclePrice = _prices[assets[i]].price;
      if (
        uint256(currentOraclePrice) >
        candidatePrices[i].mul(PERCENTAGE_BASE.add(deviation)).div(PERCENTAGE_BASE) ||
        uint256(currentOraclePrice) <
        candidatePrices[i].mul(PERCENTAGE_BASE.sub(deviation)).div(PERCENTAGE_BASE)
      ) {
        filteredAssetsWith0s[end0sInLists] = assets[i];
        filteredCandidatesWith0s[end0sInLists] = candidatePrices[i];
        end0sInLists++;
      }
    }
    address[] memory resultAssets = new address[](end0sInLists);
    uint256[] memory resultPrices = new uint256[](end0sInLists);
    for (uint256 i = 0; i < end0sInLists; i++) {
      resultAssets[i] = filteredAssetsWith0s[i];
      resultPrices[i] = filteredCandidatesWith0s[i];
    }
    return (resultAssets, resultPrices);
  }
  function _requireWhitelistedSybil(address sybil) internal view {
    require(isSybilWhitelisted(sybil), 'INVALID_SYBIL');
  }
}

// AAVE v3 (vulnerable)

import {IPriceOracle} from '../../interfaces/IPriceOracle.sol';
contract PriceOracle is IPriceOracle {
  // Map of asset prices (asset => price)
  mapping(address => uint256) internal prices;
  uint256 internal ethPriceUsd;
  event AssetPriceUpdated(address asset, uint256 price, uint256 timestamp);
  event EthPriceUpdated(uint256 price, uint256 timestamp);
  function getAssetPrice(address asset) external view override returns (uint256) {
    return prices[asset];
  }
  // ruleid: oracle-price-update-not-restricted
  function setAssetPrice(address asset, uint256 price) external override {
    prices[asset] = price;
    emit AssetPriceUpdated(asset, price, block.timestamp);
  }
  function getEthUsdPrice() external view returns (uint256) {
    return ethPriceUsd;
  }
  function setEthUsdPrice(uint256 price) external {
    ethPriceUsd = price;
    emit EthPriceUpdated(price, block.timestamp);
  }
}