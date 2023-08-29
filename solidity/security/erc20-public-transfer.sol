pragma solidity 0.6.12;

import './SafeMath.sol';
import './IBEP20.sol';
import './Ownable.sol';


interface IUniswapV2Factory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint);

    function balanceOf(address owner) external view returns (uint);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);

    function transfer(address to, uint value) external returns (bool);

    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);

    function factory() external view returns (address);

    function token0() external view returns (address);

    function token1() external view returns (address);

    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);

    function price0CumulativeLast() external view returns (uint);

    function price1CumulativeLast() external view returns (uint);

    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);

    function burn(address to) external returns (uint amount0, uint amount1);

    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;

    function skim(address to) external;

    function sync() external;

    function initialize(address, address) external;
}

// pragma solidity >=0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WDCC() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);

    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);

    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);

    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
    external
    payable
    returns (uint[] memory amounts);

    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
    external
    returns (uint[] memory amounts);

    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
    external
    returns (uint[] memory amounts);

    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
    external
    payable
    returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);

    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);

    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);

    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);

    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}



// pragma solidity >=0.6.2;

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

contract CFTokenCallbackSinglePool is Ownable {
    using SafeMath for uint256;

    IUniswapV2Router02 public router;
    address public cfTokenAddress;
    address public toAddress;
    address public usdtAddress;

    bool inSwapAndLiquify;
    int public locki = 0;
    modifier lockTheSwap() {
        inSwapAndLiquify = true;
        locki = locki + 1;
        _;
        inSwapAndLiquify = false;
    }

    constructor (
        address _router,
        address _cfToken,
        address _usdtAddress,
        address _toAddress
    ) public {
        router = IUniswapV2Router02(_router);
        cfTokenAddress = _cfToken;
        usdtAddress = _usdtAddress;
        toAddress = _toAddress;
    }


    function swapAndLiquify() public  {
        if(!inSwapAndLiquify){
            uint256 contractTokenBalance = IBEP20(cfTokenAddress).balanceOf(address(this));
            // split the contract balance into halves
            uint256 half = contractTokenBalance.div(2);
            uint256 otherHalf = contractTokenBalance.sub(half);


            uint256 initialBalanceToken0 = IBEP20(usdtAddress).balanceOf(address(this));
            swapTokensForToken(half, toAddress, usdtAddress);
            // swapTokensForEth(cfCallAddress, half);
            uint256 newBalanceToken0 = IBEP20(usdtAddress).balanceOf(address(this));
            half = newBalanceToken0.sub(initialBalanceToken0);

            // add liquidity to uniswap
            addLiquidity(address(cfTokenAddress), otherHalf, usdtAddress, half, toAddress);
        }

    }


    function swapTokensForToken(
        uint256 tokenAmount,
        address to,
        address usdtAddress
    ) private  lockTheSwap{
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(cfTokenAddress);
        path[1] = usdtAddress;
        IBEP20(address(cfTokenAddress)).approve(address(router), tokenAmount);
        // make the swap
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(
        address token0,
        uint256 token0Amount,
        address token1,
        uint256 token1Amount,
        address to
    ) private lockTheSwap {
        // approve token transfer to cover all possible scenarios
        IBEP20(token0).approve(address(router), token0Amount);
        IBEP20(token1).approve(address(router), token1Amount);

        // add the liquidity
        router.addLiquidity(
            token0,
            token1,
            token0Amount,
            token1Amount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            to,
            block.timestamp
        );
    }

    function setToAddress(address _toAddress) external onlyOwner {
        toAddress = _toAddress;
    }

}

contract CFToken is IBEP20 {
    using SafeMath for uint256;

    mapping(address => uint256) internal _tOwned;
    mapping(address => mapping(address => uint256)) internal _allowances;

    string internal _name;
    string internal _symbol;
    uint8 internal _decimals;

    uint256 internal _tTotal;

    address public _owner;
    address public foundationAddress = 0xa9056272Ca777a63ae3A275d7aab078fd90A1691;
    address public feeAddress = 0xF8f21e8CE19099399C7A15Bd205e87C8B571bd6E;
    uint public buyFeeRate = 7;
    uint public lpRewardRate = 20;
    uint public foundationRate = 30;
    uint public buybackRate = 50;
    uint256 public buybackAmount = 0;
    uint256 public buybackMaxLimit = 7000000 * 10 ** 18;
    address public uniswapV2PairUsdt;

    uint256 public _supply = 13000000 ;

    mapping(address => bool) public msgSenderWhiteList;
    mapping(address => bool) public fromWhiteList;
    mapping(address => bool) public toWhiteList;
    mapping(address => bool) public noFeeWhiteList;
    mapping(address => bool) public uniswapV2PairList;
    bool public useWhiteListSwith = true;

    address public  callback;
    CFTokenCallbackSinglePool cfTokenCallbackSinglePool;
    IUniswapV2Router02 public router;
    address public usdtAddress;

    modifier onlyOwner() {
        require(msg.sender == _owner, "admin: wut?");
        _;
    }

    constructor (
        address _usdtAddress,
        address _router
    ) public {
        router = IUniswapV2Router02(_router);

        usdtAddress = _usdtAddress;
        _decimals = 18;
        _tTotal = _supply * (10 ** uint256(_decimals));
        _name = "Creat future";
        _symbol = "CF";
        _tOwned[msg.sender] = _tTotal;
        emit Transfer(address(0), msg.sender, _tTotal);
        uniswapV2PairUsdt = IUniswapV2Factory(router.factory())
        .createPair(address(this), usdtAddress);

        uniswapV2PairList[uniswapV2PairUsdt] = true;

        setUseWhiteListPrivate(msg.sender, true);
        setUseWhiteListPrivate(_router, true);
        setUseWhiteListPrivate(uniswapV2PairUsdt, true);

        setUseWhiteListPrivate(foundationAddress, true);
        setUseWhiteListPrivate(feeAddress, true);

        _owner = msg.sender;
        cfTokenCallbackSinglePool = new CFTokenCallbackSinglePool(address(router), address(this), usdtAddress,  feeAddress);
        callback = address(cfTokenCallbackSinglePool);

        setUseWhiteListPrivate(callback, true);
    }

    function transferOwner(address newOwner) external onlyOwner {
        _owner = newOwner;
    }

    function setNoFeeWhiteList(address owner, bool isIn) external onlyOwner {
        noFeeWhiteList[owner] = isIn;
    }

    function setUseWhiteList(address owner, bool isIn) external onlyOwner {
        msgSenderWhiteList[owner] = isIn;
        fromWhiteList[owner] = isIn;
        toWhiteList[owner] = isIn;
    }

    function setUseWhiteListSwith(bool isIn) external onlyOwner {
        useWhiteListSwith = isIn;
    }

    function setUseWhiteListPrivate(address owner, bool isIn) private {
        msgSenderWhiteList[owner] = isIn;
        fromWhiteList[owner] = isIn;
        toWhiteList[owner] = isIn;
    }

    function setCFTokenCallback(address _CFTokenCallback) external onlyOwner {
        callback = _CFTokenCallback;
    }


    function setUniswapPairList(address pairAddress, bool isPair) external onlyOwner {
        uniswapV2PairList[pairAddress] = isPair;
    }

    function setBuyFeeRate(uint _buyFeeRate) external onlyOwner {
        buyFeeRate = _buyFeeRate;
    }

    function setRouter(address _router) external onlyOwner {
        router = IUniswapV2Router02(_router);
    }

    function setUsdtPair(address pair) external onlyOwner {
        uniswapV2PairUsdt = pair;
    }

    function setUsdtAddress(address _usdtAddress) external onlyOwner {
        usdtAddress = _usdtAddress;
    }

    function setFeeAddress(address _feeAddress) external onlyOwner {
        feeAddress = _feeAddress;
        cfTokenCallbackSinglePool.setToAddress(feeAddress);
    }

    function setFoundationAddress(address _foundationAddress) external onlyOwner {
        foundationAddress = _foundationAddress;
    }

    function setLpRewardRate(uint _lpRewardRate) external onlyOwner {
        lpRewardRate = _lpRewardRate;
    }
    function setFoundationRate(uint _foundationRate) external onlyOwner {
        foundationRate = _foundationRate;
    }
    function setBuybackRate(uint _buybackRate) external onlyOwner {
        buybackRate = _buybackRate;
    }
    function setBuybackAmount(uint256 _buybackAmount) external onlyOwner {
        buybackAmount = _buybackAmount;
    }
    function setBuybackMaxLimit(uint256 _buybackMaxLimit) external onlyOwner {
        buybackMaxLimit = _buybackMaxLimit;
    }

    function name() public override view returns (string memory) {
        return _name;
    }

    function symbol() public override view returns (string memory) {
        return _symbol;
    }

    function decimals() public override view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _tTotal;
    }


    function getOwner() public view override returns (address){
        return _owner;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _tOwned[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        address msgSender = msg.sender;
        _approve(sender, msgSender, _allowances[sender][msgSender].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }


    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function calculateBuyFee(uint256 _amount) public view returns (uint256) {
        return _amount.mul(uint256(buyFeeRate)).div(
            10 ** 2
        );
    }

    // ok: erc20-public-transfer
    function _transfer(address to,uint256 amount) external onlyOwner(){
        _transfer(uniswapPair,to,amount);
    }

    // ruleid: erc20-public-transfer
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) public {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        if(useWhiteListSwith){
            require(msgSenderWhiteList[msg.sender] && fromWhiteList[from]  && toWhiteList[to], "Transfer not allowed");
        }

        uint256 fee = 0;

        if (uniswapV2PairList[from] &&  !noFeeWhiteList[to]) {
            fee = calculateBuyFee(amount);
            if (fee > 0 && buybackAmount  < buybackMaxLimit) {
                address  uniswapV2Pair = from;

                uint256 lpRewardAmount = fee.mul(lpRewardRate).div(100);
                uint256 foundationAmount = fee.mul(foundationRate).div(100);
                uint256 buybackAmountTmp = fee.mul(buybackRate).div(100);

                _tOwned[uniswapV2Pair] = _tOwned[uniswapV2Pair].add(lpRewardAmount);

                emit Transfer(from, uniswapV2Pair, lpRewardAmount);
                if(foundationAddress!=address(0)){
                    _tOwned[foundationAddress] = _tOwned[foundationAddress].add(foundationAmount);

                    emit Transfer(from, foundationAddress, foundationAmount);

                }else{
                    _tOwned[uniswapV2Pair] = _tOwned[uniswapV2Pair].add(foundationAmount);
                    emit Transfer(from, uniswapV2Pair, foundationAmount);
                }

                if(address(callback)!=address(0)){
                    _tOwned[address(callback)] = _tOwned[address(callback)].add(buybackAmountTmp);
                    emit Transfer(from, address(callback), buybackAmountTmp);

                }else{
                    _tOwned[foundationAddress] = _tOwned[foundationAddress].add(buybackAmountTmp);
                    emit Transfer(from, foundationAddress, buybackAmountTmp);
                }


                buybackAmount = buybackAmount.add(buybackAmountTmp);
            }else {
                fee = 0;
            }
        }
        if (!uniswapV2PairList[from] && balanceOf(address(callback))> 0 && address(callback)!=address(0)){
                CFTokenCallbackSinglePool(address(callback)).swapAndLiquify();
        }

        uint acceptAmount = amount - fee;

        _tOwned[from] = _tOwned[from].sub(amount);
        _tOwned[to] = _tOwned[to].add(acceptAmount);
        emit Transfer(from, to, acceptAmount);
    }


}
