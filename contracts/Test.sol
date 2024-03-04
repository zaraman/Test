// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Address.sol";

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

contract ERC20Swapper {

    using SafeMath for uint256;
    using Address for address;

    IPancakeRouter02 public immutable pancakeRouter;

    constructor(address _pancakeRouter) public {
        require(_pancakeRouter != address(0), "ERC20Swapper: invalid router address");
        pancakeRouter = IPancakeRouter02(_pancakeRouter);
    }

    function swapEtherToToken(address token, uint minAmount) external payable returns (uint) {
        require(msg.value > 0, "ERC20Swapper: must send Ether");
        require(token != address(0), "ERC20Swapper: invalid token address");

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
