//SPDX-License-Identifier: MIT
pragma solidity 0.7.5;

import "@openzeppelin/contracts/math/Math.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

// Inheritance
import "../interfaces/IStakingRewards.sol";
import "../interfaces/Pausable.sol";
import "../interfaces/RewardsDistributionRecipient.sol";
import "../interfaces/OnDemandToken.sol";
import "../interfaces/MintableToken.sol";

// based on synthetix
contract StakingRewards is IStakingRewards, RewardsDistributionRecipient, ReentrancyGuard, Pausable {
    using SafeERC20 for IERC20;

    struct Times {
        uint32 periodFinish;
        uint32 rewardsDuration;
        uint32 lastUpdateTime;
        uint96 totalRewardsSupply;
    }

    // ========== STATE VARIABLES ========== //

    uint256 public immutable maxEverTotalRewards;

    IERC20 public immutable rewardsToken;
    IERC20 public immutable stakingToken;

    uint256 public rewardRate = 0;
    uint256 public rewardPerTokenStored;
    
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    Times public timeData;
    bool public stopped;

    // ========== EVENTS ========== //

    event RewardAdded(uint256 reward);
    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);
    event RewardsDurationUpdated(uint256 newDuration);
    event FarmingFinished();

    // ========== MODIFIERS ========== //

    modifier whenActive() {
        require(!stopped, "farming is stopped");
        _;
    }

    modifier updateReward(address account) virtual {
        uint256 newRewardPerTokenStored = rewardPerToken();
        rewardPerTokenStored = newRewardPerTokenStored;
        timeData.lastUpdateTime = uint32(lastTimeRewardApplicable());

        if (account != address(0)) {
            rewards[account] = earned(account);
            userRewardPerTokenPaid[account] = newRewardPerTokenStored;
        }

        _;
    }

    // ========== CONSTRUCTOR ========== //

    constructor(
        address _owner,
        address _rewardsDistribution,
        address _stakingToken,
        address _rewardsToken
    ) Owned(_owner) {
        require(OnDemandToken(_rewardsToken).ON_DEMAND_TOKEN(), "rewardsToken must be OnDemandToken");

        stakingToken = IERC20(_stakingToken);
        rewardsToken = IERC20(_rewardsToken);
        rewardsDistribution = _rewardsDistribution;

        timeData.rewardsDuration = 2592000; // 30 days
        maxEverTotalRewards = MintableToken(_rewardsToken).maxAllowedTotalSupply();
    }

    // ========== RESTRICTED FUNCTIONS ========== //

    function notifyRewardAmount(
        uint256 _reward
    ) override virtual external whenActive onlyRewardsDistribution updateReward(address(0)) {
        Times memory t = timeData;
        uint256 newRewardRate;

        if (block.timestamp >= t.periodFinish) {
            newRewardRate = _reward / t.rewardsDuration;
        } else {
            uint256 remaining = t.periodFinish - block.timestamp;
            uint256 leftover = remaining * rewardRate;
            newRewardRate = (_reward + leftover) / t.rewardsDuration;
        }

        require(newRewardRate != 0, "invalid rewardRate");

        rewardRate = newRewardRate;

        // always increasing by _reward even if notification is in a middle of period
        // because leftover is included
        uint256 totalRewardsSupply = timeData.totalRewardsSupply + _reward;
        require(totalRewardsSupply <= maxEverTotalRewards, "rewards overflow");

        timeData.totalRewardsSupply = uint96(totalRewardsSupply);
        timeData.lastUpdateTime = uint32(block.timestamp);
        timeData.periodFinish = uint32(block.timestamp + t.rewardsDuration);

        emit RewardAdded(_reward);
    }

    function setRewardsDuration(uint256 _rewardsDuration) external whenActive onlyOwner {
        require(_rewardsDuration != 0, "empty _rewardsDuration");

        require(
            block.timestamp > timeData.periodFinish,
            "Previous period must be complete before changing the duration"
        );

        timeData.rewardsDuration = uint32(_rewardsDuration);
        emit RewardsDurationUpdated(_rewardsDuration);
    }

    // when farming was started with 1y and 12tokens
    // and we want to finish after 4 months, we need to end up with situation
    // like we were starting with 4mo and 4 tokens.
    function finishFarming() virtual external whenActive onlyOwner {
        Times memory t = timeData;
        require(block.timestamp < t.periodFinish, "can't stop if not started or already finished");

        stopped = true;

        if (_totalSupply != 0) {
            uint256 remaining = t.periodFinish - block.timestamp;
            timeData.rewardsDuration = uint32(t.rewardsDuration - remaining);
        }

        timeData.periodFinish = uint32(block.timestamp);

        emit FarmingFinished();
    }

    // ========== MUTATIVE FUNCTIONS ========== //

    function exit() override external {
        withdraw(_balances[msg.sender]);
        getReward();
    }

    function stake(uint256 amount) override external {
        _stake(msg.sender, amount, false);
    }

    function rescueToken(ERC20 _token, address _recipient, uint256 _amount) external onlyOwner() {
        if (address(_token) == address(stakingToken)) {
            require(_totalSupply <= stakingToken.balanceOf(address(this)) - _amount, "amount is too big to rescue");
        } else if (address(_token) == address(rewardsToken)) {
            revert("reward token can not be rescued");
        }

        _token.transfer(_recipient, _amount);
    }

    function periodFinish() external view returns (uint256) {
        return timeData.periodFinish;
    }

    function rewardsDuration() external view returns (uint256) {
        return timeData.rewardsDuration;
    }

    function lastUpdateTime() external view returns (uint256) {
        return timeData.lastUpdateTime;
    }

    function balanceOf(address account) override external view returns (uint256) {
        return _balances[account];
    }

    function getRewardForDuration() override external view returns (uint256) {
        return rewardRate * timeData.rewardsDuration;
    }

    function version() external pure virtual returns (uint256) {
        return 1;
    }

    function withdraw(uint256 amount) override public {
        _withdraw(amount, msg.sender, msg.sender);
    }

    function getReward() override public {
        _getReward(msg.sender, msg.sender);
    }

    // ========== VIEWS ========== //

    function totalSupply() override public view returns (uint256) {
        return _totalSupply;
    }

    function lastTimeRewardApplicable() override public view returns (uint256) {
        return Math.min(block.timestamp, timeData.periodFinish);
    }

    function rewardPerToken() override public view returns (uint256) {
        if (_totalSupply == 0) {
            return rewardPerTokenStored;
        }

        return rewardPerTokenStored + (
            (lastTimeRewardApplicable() - timeData.lastUpdateTime) * rewardRate * 1e18 / _totalSupply
        );
    }

    function earned(address account) override virtual public view returns (uint256) {
        return (_balances[account] * (rewardPerToken() - userRewardPerTokenPaid[account]) / 1e18) + rewards[account];
    }

    function _stake(address user, uint256 amount, bool migration)
        internal
        nonReentrant
        notPaused
        updateReward(user)
    {
        require(timeData.periodFinish != 0, "Stake period not started yet");
        require(amount != 0, "Cannot stake 0");

        _totalSupply = _totalSupply + amount;
        _balances[user] = _balances[user] + amount;

        if (migration) {
            // other contract will send tokens to us, this will save ~13K gas
        } else {
            // not using safe transfer, because we working with trusted tokens
            require(stakingToken.transferFrom(user, address(this), amount), "token transfer failed");
        }

        emit Staked(user, amount);
    }

    /// @param amount tokens to withdraw
    /// @param user address
    /// @param recipient address, where to send tokens, if we migrating token address can be zero
    function _withdraw(uint256 amount, address user, address recipient) internal nonReentrant updateReward(user) {
        require(amount != 0, "Cannot withdraw 0");

        // not using safe math, because there is no way to overflow if stake tokens not overflow
        _totalSupply = _totalSupply - amount;
        // todoruleid: basic-arithmetic-underflow
        _balances[user] = _balances[user] - amount;
        // not using safe transfer, because we working with trusted tokens
        require(stakingToken.transfer(recipient, amount), "token transfer failed");

        emit Withdrawn(user, amount);
    }

    /// @param user address
    /// @param recipient address, where to send reward
    function _getReward(address user, address recipient)
        internal
        virtual
        nonReentrant
        updateReward(user)
        returns (uint256 reward)
    {
        reward = rewards[user];

        if (reward != 0) {
            rewards[user] = 0;
            OnDemandToken(address(rewardsToken)).mint(recipient, reward);
            emit RewardPaid(user, reward);
        }
    }
}

// Remittance Token

contract RemcoToken is Token, Owned {
    using SafeMath for uint256;
  
    uint public  _totalSupply;
  
    string public   name;         //The Token's name
  
    uint8 public constant decimals = 8;    //Number of decimals of the smallest unit
  
    string public  symbol;    //The Token's symbol 
  
    uint256 public mintCount;
  
    uint256 public deleteToken;
  
    uint256 public soldToken;

   
    mapping (address => uint256) public balanceOf;

    // Owner of account approves the transfer of an amount to another account
    mapping(address => mapping(address => uint256)) allowed;

  

    // Constructor
    function RemcoToken(string coinName,string coinSymbol,uint initialSupply) {
        _totalSupply = initialSupply *10**uint256(decimals);                        // Update total supply
        balanceOf[msg.sender] = _totalSupply; 
        name = coinName;                                   // Set the name for display purposes
        symbol =coinSymbol;   
        
    }

   function totalSupply()  public  returns (uint256 totalSupply) {
        return _totalSupply;
    }
	
    // Send back ether sent to me
    function () {
        revert();
    }

    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _amount) returns (bool success) {
        // according to AssetToken's total supply, never overflow here
        if (balanceOf[msg.sender] >= _amount
            && _amount > 0) {            
            balanceOf[msg.sender] -= uint112(_amount);
            balanceOf[_to] = _amount.add(balanceOf[_to]).toUINT112();
            soldToken = _amount.add(soldToken).toUINT112();
            Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }

   
    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) returns (bool success) {
        // according to AssetToken's total supply, never overflow here
        if (balanceOf[_from] >= _amount
            && allowed[_from][msg.sender] >= _amount
            && _amount > 0) {
            balanceOf[_from] = balanceOf[_from].sub(_amount).toUINT112();
            allowed[_from][msg.sender] -= _amount;
            balanceOf[_to] = _amount.add(balanceOf[_to]).toUINT112();
            Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }

   
    function approve(address _spender, uint256 _amount) returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }



    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    //Mint tokens and assign to some one
    function mint(address _owner, uint256 _amount) onlyOwner{
     
            balanceOf[_owner] = _amount.add(balanceOf[_owner]).toUINT112();
            mintCount =  _amount.add(mintCount).toUINT112();
            _totalSupply = _totalSupply.add(_amount).toUINT112();
    }
  //Burn tokens from owner account
  function burn(uint256 _count) public returns (bool success)
  {
          // todoruleid: basic-arithmetic-underflow
          balanceOf[msg.sender] -=uint112( _count);
          deleteToken = _count.add(deleteToken).toUINT112();
         _totalSupply = _totalSupply.sub(_count).toUINT112();
          Burn(msg.sender, _count);
		  return true;
    }
    
  }