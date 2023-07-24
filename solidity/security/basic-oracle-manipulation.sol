pragma solidity 0.6.12;

import "@openzeppelin/contracts/math/Math.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/SafeERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "./interface/IStrategy.sol";
import "hardhat/console.sol";

contract OneRingVault is ERC20Upgradeable, OwnableUpgradeable {
    using SafeERC20Upgradeable for IERC20Upgradeable;
    using SafeERC20 for IERC20;
    using SafeMath for Math;

    address public activeStrategy;

    address[] public underlyings;
    mapping(address => bool) public underlyingEnabled;

    uint256 public underlyingUnit;

    event Withdraw(
        address indexed beneficiary,
        uint256 amount,
        address indexed underlying
    );
    event Deposit(
        address indexed beneficiary,
        uint256 amount,
        address indexed underlying
    );
    event Invest(
        uint256 amount,
        address indexed underlying,
        address indexed strategy
    );

    address public treasury;
    uint256 public performanceFee;
    uint256 public performanceFeeMax;

    constructor() public {}

    function initialize(address[] memory _underlyings) public initializer {
        __ERC20_init("One Ring Share", "OShare");
        _setupDecimals(18);
        __Ownable_init();

        underlyingUnit = 10**18;

        for (uint256 _ui = 0; _ui < _underlyings.length; _ui++) {
            _addUnderlying(_underlyings[_ui]);
        }
    }

    function _doHardWork(uint256 _amount, address _token) internal {
        _invest(_amount, _token);
        IStrategy(activeStrategy).doHardWork();
    }

    function doHardWork(uint256 _amount, address _token) external onlyOwner {
        _doHardWork(_amount, _token);
    }

    function _doHardWorkAll() internal {
        for (uint256 i = 0; i < underlyings.length; i++) {
            uint256 _amount = IERC20(underlyings[i]).balanceOf(address(this));
            _invest(_amount, underlyings[i]);
        }
        IStrategy(activeStrategy).doHardWork();
    }

    function doHardWorkAll() external onlyOwner {
        _doHardWorkAll();
    }

    function _invest(uint256 _amount, address _token) internal {
        uint256 _availableAmount = IERC20(_token).balanceOf(address(this));
        require(_amount <= _availableAmount, "not insufficient amount");
        if (_amount > 0) {
            IERC20(_token).safeTransfer(address(activeStrategy), _amount);
            IStrategy(activeStrategy).assetToUnderlying(_token);
            emit Invest(_amount, _token, activeStrategy);
        }
    }

    function invest(uint256 _amount, address _token) public onlyOwner {
        _invest(_amount, _token);
    }

    function balanceWithInvested() public view returns (uint256 balance) {
        balance = IStrategy(activeStrategy).investedBalanceInUSD();
    }
    function getSharePrice() public view returns (uint256 _sharePrice) {
        // ruleid: basic-oracle-manipulation
        _sharePrice = totalSupply() == 0
            ? underlyingUnit
            : underlyingUnit.mul(balanceWithInvested()).div(totalSupply());

        if (_sharePrice < underlyingUnit) {
            _sharePrice = underlyingUnit;
        }
    }

    function _getDecimaledUnderlyingBalance(address _underlying)
        internal
        returns (uint256 _balance)
    {
        _balance = IERC20(_underlying)
            .balanceOf(address(this))
            .mul(uint256(10)**uint256(decimals()))
            .div(uint256(10)**uint256(ERC20(_underlying).decimals()));
    }

    function _getDefaultMinimumAmountForDeposit(uint256 _amount, address _token)
        internal
        returns (uint256 _minAmount)
    {
        uint256 _sharePrice = getSharePrice();
        uint256 _amountInUsd = _amount
            .mul(uint256(10)**uint256(decimals()))
            .div(uint256(10)**uint256(ERC20(_token).decimals()));
        _minAmount = _amountInUsd.mul(underlyingUnit).div(_sharePrice);
        _minAmount = _minAmount.mul(98).div(100);
    }

    function deposit(uint256 _amount, address _token) external {
        uint256 _minAmount = _getDefaultMinimumAmountForDeposit(
            _amount,
            _token
        );
        _deposit(_amount, _token, msg.sender, _minAmount);
    }

    function depositSafe(
        uint256 _amount,
        address _token,
        uint256 _minAmount
    ) external {
        _deposit(_amount, _token, msg.sender, _minAmount);
    }

    function _deposit(
        uint256 _amount,
        address _underlying,
        address _sender,
        uint256 _minAmount
    ) internal {
        require(_amount > 0, "Cannot deposit 0");
        require(
            underlyingEnabled[_underlying],
            "Underlying token is not enabled"
        );

        uint256 _sharePrice = getSharePrice();

        IERC20(_underlying).safeTransferFrom(_sender, activeStrategy, _amount);
        uint256 _newLiquidityInUSD = IStrategy(activeStrategy)
            .assetToUnderlying(_underlying);

        uint256 _amountInUSD = _amount
            .mul(uint256(10)**uint256(decimals()))
            .div(uint256(10)**uint256(ERC20(_underlying).decimals()));

        if (_newLiquidityInUSD > _amountInUSD) {
            _newLiquidityInUSD = _amountInUSD;
        }

        _doHardWorkAll();

        uint256 _toMint = _newLiquidityInUSD.mul(underlyingUnit).div(
            _sharePrice
        );
        _mint(_sender, _toMint);

        require(_toMint >= _minAmount, "Mint amount is too small.");

        emit Deposit(_sender, _amount, _underlying);
    }

    function withdrawAll(address _underlying) external onlyOwner {
        _withdrawAll(_underlying);
    }

    function _withdrawAll(address _underlying) internal {
        IStrategy(activeStrategy).withdrawAllToVault(_underlying);
    }

    function withdraw(uint256 _amount, address _underlying)
        external
        returns (uint256)
    {
        // if slippage is not set, set it to 2 percent
        uint256 _sharePrice = getSharePrice();
        uint256 _amountInUsd = _amount.mul(_sharePrice).div(underlyingUnit);
        uint256 _minAmountInUsd = _amountInUsd.mul(98).div(100);
        uint256 _minAmount = _minAmountInUsd
            .mul(uint256(10)**uint256(ERC20(_underlying).decimals()))
            .div(uint256(10)**uint256(decimals()));
        return _withdraw(_amount, msg.sender, _underlying, _minAmount);
    }

    function withdrawSafe(
        uint256 _amount,
        address _underlying,
        uint256 _minAmount
    ) public returns (uint256) {
        return _withdraw(_amount, msg.sender, _underlying, _minAmount);
    }

    function _withdraw(
        uint256 _amount,
        address _sender,
        address _underlying,
        uint256 _minAmount
    ) internal returns (uint256) {
        require(totalSupply() > 0, "Vault has no shares");
        require(_amount > 0, "Shares must be greater than 0");
        require(underlyingEnabled[_underlying], "Underlying is not enabled");

        uint256 _totalSupply = totalSupply();
        _burn(_sender, _amount);

        uint256 _toWithdraw = balanceWithInvested().mul(_amount).div(
            _totalSupply
        );
        uint256 _realWithdraw;
        uint256 _stakedWithdraw;

        uint256 _underlyingBal = _getDecimaledUnderlyingBalance(_underlying);
        if (_toWithdraw <= _underlyingBal) {
            _realWithdraw = _toWithdraw
                .mul(uint256(10)**uint256(ERC20(_underlying).decimals()))
                .div(uint256(10)**uint256(decimals()));
            IERC20(_underlying).safeTransferFrom(
                address(this),
                _sender,
                _realWithdraw
            );
            emit Withdraw(_sender, _realWithdraw, _underlying);
            return _realWithdraw;
        } else {
            _stakedWithdraw = _underlyingBal;
        }

        uint256 _missing = _toWithdraw.sub(_stakedWithdraw);
        IStrategy(activeStrategy).withdrawToVault(_missing, _underlying);

        _realWithdraw = IERC20(_underlying).balanceOf(address(this));

        require(
            _realWithdraw >= _minAmount,
            "Withdraw amount is less than mininum amount."
        );

        IERC20(_underlying).safeTransfer(_sender, _realWithdraw);
        emit Withdraw(_sender, _realWithdraw, _underlying);
        return _realWithdraw;
    }

    function _addUnderlying(address _underlying) internal {
        require(_underlying != address(0), "_underlying must be defined");
        underlyings.push(_underlying);
        underlyingEnabled[_underlying] = true;
    }

    function enableUnderlying(address _underlying) public onlyOwner {
        require(_underlying != address(0), "_underlying must be defined");
        underlyingEnabled[_underlying] = true;
    }

    function disableUnderlying(address _underlying) public onlyOwner {
        require(_underlying != address(0), "_underlying must be defined");
        underlyingEnabled[_underlying] = false;
    }

    function setActiveStrategy(address _strategy) public onlyOwner {
        require(_strategy != address(0), "strategy must be defined");
        activeStrategy = _strategy;
    }

    function migrateStrategy(
        address _oldStrategy,
        address _newStrategy,
        address _underlying,
        uint256 _usdAmount
    ) external onlyOwner {
        require(_underlying != address(0), "underlying must be defined");
        require(_oldStrategy != address(0), "Old strategy must be defined");
        require(_newStrategy != address(0), "New strategy must be defined");
        require(
            IStrategy(activeStrategy).strategyEnabled(_newStrategy),
            "New strategy must be enabled."
        );

        uint256 _underlyingAmountBefore = IERC20(_underlying).balanceOf(
            address(this)
        );
        IStrategy(_oldStrategy).withdrawToVault(_usdAmount, _underlying);
        uint256 _underlyingAmountAfter = IERC20(_underlying).balanceOf(
            address(this)
        );

        uint256 _amountToInvest = _underlyingAmountAfter.sub(
            _underlyingAmountBefore
        );
        IERC20(_underlying).safeTransfer(_newStrategy, _amountToInvest);
        IStrategy(_newStrategy).doHardWork();
    }

    function setTreasury(address _treasury) external onlyOwner {
        require(_treasury != address(0), "zero address");
        treasury = _treasury;
    }

    function setPerformanceFee(
        uint256 _performanceFee,
        uint256 _performanceFeeMax
    ) external onlyOwner {
        require(_performanceFee <= _performanceFeeMax, "not valid fee values");
        performanceFee = _performanceFee;
        performanceFeeMax = _performanceFeeMax;
    }

    function underlyingLength() public view returns (uint256) {
        return underlyings.length;
    }
}

// Deus Finance vulnerable oracle

contract Oracle {
    IERC20 public dei;
    IERC20 public usdc;
    IERC20 public pair;

    constructor(
        IERC20 dei_,
        IERC20 usdc_,
        IERC20 pair_
    ) {
        dei = dei_;
        usdc = usdc_;
        pair = pair_;
    }

    function getPrice() external view returns (uint256) {
        return
            // ruleid: basic-oracle-manipulation
            ((dei.balanceOf(address(pair)) + (usdc.balanceOf(address(pair)) * 1e12)) *
                1e18) / pair.totalSupply();
    }
}


// Deus vulnerable again

// Be name Khoda
// Bime Abolfazl
// SPDX-License-Identifier: MIT

// =================================================================================================================
//  _|_|_|    _|_|_|_|  _|    _|    _|_|_|      _|_|_|_|  _|                                                       |
//  _|    _|  _|        _|    _|  _|            _|            _|_|_|      _|_|_|  _|_|_|      _|_|_|    _|_|       |
//  _|    _|  _|_|_|    _|    _|    _|_|        _|_|_|    _|  _|    _|  _|    _|  _|    _|  _|        _|_|_|_|     |
//  _|    _|  _|        _|    _|        _|      _|        _|  _|    _|  _|    _|  _|    _|  _|        _|           |
//  _|_|_|    _|_|_|_|    _|_|    _|_|_|        _|        _|  _|    _|    _|_|_|  _|    _|    _|_|_|    _|_|_|     |
// =================================================================================================================
// ==================== Oracle ===================
// ==============================================
// DEUS Finance: https://github.com/deusfinance

// Primary Author(s)
// Mmd: https://github.com/mmd-mostafaee

pragma solidity 0.8.12;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/IMuon.sol";
import "./interfaces/IBaseV1Pair.sol";

/// @title Oracle of DeiLenderLP
/// @author DEUS Finance
/// @notice to provide LP price for DeiLenderLP
contract Oracle is AccessControl {
    IERC20 public dei;
    IERC20 public usdc;
    IERC20 public pair;

    uint256 price; // usdc

    IMuonV02 public muon;
    uint32 public appId;
    uint256 public minimumRequiredSignatures;
    uint256 public expireTime;
    uint256 public threshold;

    bytes32 public constant SETTER_ROLE = keccak256("SETTER_ROLE");

    modifier isSetter() {
        require(hasRole(SETTER_ROLE, msg.sender), "Caller is not setter");
        _;
    }

    constructor(
        IERC20 dei_,
        IERC20 usdc_,
        IERC20 pair_,
        IMuonV02 muon_,
        uint32 appId_,
        uint256 minimumRequiredSignatures_,
        uint256 expireTime_,
        uint256 threshold_,
        address admin,
        address setter
    ) {
        dei = dei_;
        usdc = usdc_;
        pair = pair_;
        muon = muon_;
        appId = appId_;
        expireTime = expireTime_;
        threshold = threshold_;

        minimumRequiredSignatures = minimumRequiredSignatures_;

        _setupRole(DEFAULT_ADMIN_ROLE, admin);
        _setupRole(SETTER_ROLE, setter);
    }

    function setMuon(IMuonV02 muon_) external isSetter {
        muon = muon_;
    }

    function setAppId(uint32 appId_) external isSetter {
        appId = appId_;
    }

    function setMinimumRequiredSignatures(uint256 minimumRequiredSignatures_)
        external
        isSetter
    {
        minimumRequiredSignatures = minimumRequiredSignatures_;
    }

    function setExpireTime(uint256 expireTime_) external isSetter {
        expireTime = expireTime_;
    }

    function setThreshold(uint256 threshold_) external isSetter {
        threshold = threshold_;
    }

    /// @notice returns on chain LP price
    function getOnChainPrice() public view returns (uint256) {
        return
        // ruleid: basic-oracle-manipulation
            ((dei.balanceOf(address(pair)) * IBaseV1Pair(address(pair)).getAmountOut(1e18, address(dei)) * 1e12 / 1e18) + (usdc.balanceOf(address(pair)) * 1e12)) * 1e18 / pair.totalSupply();
    }

    /// @notice returns
    function getPrice(
        uint256 price,
        uint256 timestamp,
        bytes calldata reqId,
        SchnorrSign[] calldata sigs
    ) public returns (uint256) {
        require(
            timestamp + expireTime >= block.timestamp,
            "ORACLE: SIGNATURE_EXPIRED"
        );

        uint256 onChainPrice = getOnChainPrice();
        uint256 diff = onChainPrice < price ? onChainPrice * 1e18 / price : price * 1e18 / onChainPrice;
        require(
           1e18 - diff < threshold 
            ,"ORACLE: PRICE_GAP"
        );

        address[] memory pairs1 = new address[](1);
        pairs1[0] = address(pair);
        bytes32 hash = keccak256(
            abi.encodePacked(
                appId,
                address(pair),
                new address[](0),
                pairs1,
                price,
                timestamp
            )
        );

        require(
            muon.verify(reqId, uint256(hash), sigs),
            "ORACLE: UNVERIFIED_SIGNATURES"
        );

        return price;
    }
}