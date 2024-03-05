// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importing OpenZeppelin's upgradeable contract version
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
}

interface IPancakeRouter02 {
    function WETH() external pure returns (address);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
}

contract ERC20SwapperUpgradeable is Initializable, OwnableUpgradeable {
    using AddressUpgradeable for address;

    IPancakeRouter02 public pancakeRouter;

    function initialize(address _pancakeRouter) public initializer {
        __Ownable_init(); // Initialize the ownable contract
        require(_pancakeRouter != address(0), "ERC20SwapperUpgradeable: invalid router address");
        pancakeRouter = IPancakeRouter02(_pancakeRouter);
    }

    function swapEtherToToken(address token, uint minAmount) external payable returns (uint) {
        require(msg.value > 0, "ERC20SwapperUpgradeable: must send Ether");
        require(token != address(0), "ERC20SwapperUpgradeable: invalid token address");

        address[] memory path = new address[](2);
        path[0] = pancakeRouter.WETH();
        path[1] = token;

        uint[] memory amounts = pancakeRouter.swapExactETHForTokens{value: msg.value}(
            minAmount,
            path,
            msg.sender,
            block.timestamp + 1200
        );
        return amounts[amounts.length - 1];
    }

    receive() external payable {}
    fallback() external payable {}
}
