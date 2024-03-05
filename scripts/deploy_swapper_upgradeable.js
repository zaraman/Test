const { ethers, upgrades } = require("hardhat");
const ROUTER = process.env.SWAP_ROUTER
async function main() {
  await hre.run('compile');
  const ERC20SwapperUpgradeable = await ethers.getContractFactory("ERC20SwapperUpgradeable");

  console.log("Deploying ERC20SwapperUpgradeable...");
  const erc20Swapper = await upgrades.deployProxy(ERC20SwapperUpgradeable, [ROUTER], { initializer: 'initialize' });
  await erc20Swapper.deployed();
  console.log("ERC20SwapperUpgradeable deployed to:", erc20Swapper.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
