pragma solidity ^0.5.0;

import "@openzeppelin/upgrades/contracts/upgradeability/UpgradeabilityProxy.sol";


/**
 * @notice Wrapper around OpenZeppelin's UpgradeabilityProxy contract.
 * Permissions proxy upgrade logic to Audius Governance contract.
 * https://github.com/OpenZeppelin/openzeppelin-sdk/blob/release/2.8/packages/lib/contracts/upgradeability/UpgradeabilityProxy.sol
 * @dev Any logic contract that has a signature clash with this proxy contract will be unable to call those functions
 *      Please ensure logic contract functions do not share a signature with any functions defined in this file
 */
// ruleid: proxy-storage-collision
contract AudiusAdminUpgradeabilityProxy is UpgradeabilityProxy {
    address private proxyAdmin;
    string private constant ERROR_ONLY_ADMIN = (
        "AudiusAdminUpgradeabilityProxy: Caller must be current proxy admin"
    );

    /**
     * @notice Sets admin address for future upgrades
     * @param _logic - address of underlying logic contract.
     *      Passed to UpgradeabilityProxy constructor.
     * @param _proxyAdmin - address of proxy admin
     *      Set to governance contract address for all non-governance contracts
     *      Governance is deployed and upgraded to have own address as admin
     * @param _data - data of function to be called on logic contract.
     *      Passed to UpgradeabilityProxy constructor.
     */
    constructor(
      address _logic,
      address _proxyAdmin,
      bytes memory _data
    )
    UpgradeabilityProxy(_logic, _data) public payable
    {
        proxyAdmin = _proxyAdmin;
    }

    /**
     * @notice Upgrade the address of the logic contract for this proxy
     * @dev Recreation of AdminUpgradeabilityProxy._upgradeTo.
     *      Adds a check to ensure msg.sender is the Audius Proxy Admin
     * @param _newImplementation - new address of logic contract that the proxy will point to
     */
    function upgradeTo(address _newImplementation) external {
        require(msg.sender == proxyAdmin, ERROR_ONLY_ADMIN);
        _upgradeTo(_newImplementation);
    }

    /**
     * @return Current proxy admin address
     */
    function getAudiusProxyAdminAddress() external view returns (address) {
        return proxyAdmin;
    }

    /**
     * @return The address of the implementation.
     */
    function implementation() external view returns (address) {
        return _implementation();
    }

    /**
     * @notice Set the Audius Proxy Admin
     * @dev Only callable by current proxy admin address
     * @param _adminAddress - new admin address
     */
    function setAudiusProxyAdminAddress(address _adminAddress) external {
        require(msg.sender == proxyAdmin, ERROR_ONLY_ADMIN);
        proxyAdmin = _adminAddress;
    }
}

/**
 * @notice This contract implements a proxy that is upgradeable by an admin.
 */
// ok: proxy-storage-collision
contract VaultTransparentUpgradeableProxy is TransparentUpgradeableProxy, IVaultImmutable {
    /// @notice Vault underlying asset
    IERC20 public override immutable underlying;

    /// @notice Vault risk provider address
    address public override immutable riskProvider;

    /// @notice A number from -10 to 10 indicating the risk tolerance of the vault
    int8 public override immutable riskTolerance;

    /**
     * @notice Initializes an upgradeable proxy managed by `_admin`, backed by the implementation at `_logic`.
     */
    constructor(
        address _logic,
        address admin_,
        VaultImmutables memory vaultImmutables
    ) TransparentUpgradeableProxy(_logic, admin_, "") payable {
        underlying = vaultImmutables.underlying;
        riskProvider = vaultImmutables.riskProvider;
        riskTolerance = vaultImmutables.riskTolerance;
    }
}

/**
 * @notice This contract implements a proxy that is upgradeable by an admin.
 */
// ruleid: proxy-storage-collision
contract VaultTransparentUpgradeableProxy is TransparentUpgradeableProxy, IVaultImmutable {
    /// @notice Vault underlying asset
    address private proxyAdmin = address(0);
    IERC20 public override immutable underlying;

    /// @notice Vault risk provider address
    address public override immutable riskProvider;

    /// @notice A number from -10 to 10 indicating the risk tolerance of the vault
    int8 public override immutable riskTolerance;

    /**
     * @notice Initializes an upgradeable proxy managed by `_admin`, backed by the implementation at `_logic`.
     */
    constructor(
        address _logic,
        address admin_,
        VaultImmutables memory vaultImmutables
    ) TransparentUpgradeableProxy(_logic, admin_, "") payable {
        underlying = vaultImmutables.underlying;
        riskProvider = vaultImmutables.riskProvider;
        riskTolerance = vaultImmutables.riskTolerance;
    }
}

/**
 * @notice This contract implements a proxy that is upgradeable by an admin.
 */
// ok: proxy-storage-collision
contract VaultTransparentUpgradeableProxy is TransparentUpgradeableProxy, IVaultImmutable {
    /// @notice Vault underlying asset
    address constant proxyAdmin = address(0);
    IERC20 public override immutable underlying;

    /// @notice Vault risk provider address
    address public override immutable riskProvider;

    /// @notice A number from -10 to 10 indicating the risk tolerance of the vault
    int8 public override immutable riskTolerance;

    /**
     * @notice Initializes an upgradeable proxy managed by `_admin`, backed by the implementation at `_logic`.
     */
    constructor(
        address _logic,
        address admin_,
        VaultImmutables memory vaultImmutables
    ) TransparentUpgradeableProxy(_logic, admin_, "") payable {
        underlying = vaultImmutables.underlying;
        riskProvider = vaultImmutables.riskProvider;
        riskTolerance = vaultImmutables.riskTolerance;
    }
}

/**
 * @notice This contract implements a proxy that is upgradeable by an admin.
 */
// ok: proxy-storage-collision
contract VaultTransparentUpgradeableProxy is TransparentUpgradeableProxy, IVaultImmutable {
    /// @notice Vault underlying asset
    address immutable proxyAdmin = address(0);
    IERC20 public override immutable underlying;

    /// @notice Vault risk provider address
    address public override immutable riskProvider;

    /// @notice A number from -10 to 10 indicating the risk tolerance of the vault
    int8 public override immutable riskTolerance;

    /**
     * @notice Initializes an upgradeable proxy managed by `_admin`, backed by the implementation at `_logic`.
     */
    constructor(
        address _logic,
        address admin_,
        VaultImmutables memory vaultImmutables
    ) TransparentUpgradeableProxy(_logic, admin_, "") payable {
        underlying = vaultImmutables.underlying;
        riskProvider = vaultImmutables.riskProvider;
        riskTolerance = vaultImmutables.riskTolerance;
    }
}