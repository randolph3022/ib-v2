// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Constants.sol";
import "../../libraries/DataTypes.sol";

contract IronBankStorage is Constants {
    event MarketConfiguratorSet(address configurator);

    event CreditLimitManagerSet(address manager);

    event CreditLimitChanged(address user, address market, uint256 credit);

    event PriceOracleSet(address priceOracle);

    event MarketListed(address indexed market, uint40 timestamp, DataTypes.MarketConfig config);

    event MarketDelisted(address indexed market);

    event MarketConfigurationChanged(address indexed market, DataTypes.MarketConfig config);

    event InterestAccrued(address indexed market, uint256 interestIncreased, uint256 borrowIndex, uint256 totalBorrow);

    event MarketEntered(address indexed market, address indexed user);

    event MarketExited(address indexed market, address indexed user);

    event Supply(
        address indexed market, address from, address indexed to, uint256 indexed amount, uint256 ibTokenAmount
    );

    event Borrow(
        address indexed market,
        address indexed from,
        address to,
        uint256 indexed amount,
        uint256 accountBorrow,
        uint256 totalBorrow
    );

    event Redeem(
        address indexed market, address indexed from, address to, uint256 indexed amount, uint256 ibTokenAmount
    );

    event Repay(
        address indexed market,
        address from,
        address indexed to,
        uint256 indexed amount,
        uint256 accountBorrow,
        uint256 totalBorrow
    );

    event Liquidate(
        address liquidator, address violator, address marketBorrow, address marketCollateral, uint256 repayAmount
    );

    event TokenSeized(address token, address recipient, uint256 amount);

    event ReservesIncreased(address market, uint256 ibTokenAmount, uint256 amount);

    event ReservesDecreased(address market, uint256 ibTokenAmount, uint256 amount, address recipient);

    event ExtensionAdded(address user, address extension);

    event ExtensionRemoved(address user, address extension);

    mapping(address => DataTypes.Market) public markets;
    address[] public allMarkets;

    mapping(address => mapping(address => bool)) public enteredMarkets;
    mapping(address => address[]) public allEnteredMarkets;
    mapping(address => mapping(address => bool)) public allowedExtensions;
    mapping(address => address[]) public allAllowedExtensions;
    mapping(address => mapping(address => uint256)) public creditLimits;
    mapping(address => address[]) public allCreditMarkets;
    mapping(address => uint8) public liquidityCheckStatus;

    address public priceOracle;

    address public marketConfigurator;
    address public creditLimitManager;
}
