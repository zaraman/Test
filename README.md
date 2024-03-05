# ERC20Swapper Deployment Guide
# Quickstart
This guide walks you through deploying the ERC20Swapper contract, which enables swapping Ether for ERC20 tokens using the PancakeSwap Router.

# Prerequisites
Node.js and npm installed.
Hardhat environment set up in your project.
An account with enough ETH for deployment and transactions.
Access to a PancakeSwap Router address.
Installation
First, install the necessary npm packages:
npm install

# Configuration
Create a .env file in your project root with your deployment account's private key and your  API key (if deploying to a testnet or mainnet):

# env
BSCSCANAPIKEY_API_KEY=
BSC_PRIVATE_KEY=
Make sure to replace <BSC_PRIVATE_KEY> and <BSCSCANAPIKEY_API_KEY> with your actual private key and API_KEY.

# Deployment
Run the deployment script with:
npx hardhat run scripts\deploy_swapper.js --network <network>
Replace <network> with the network you intend to deploy to, such as mainnet, testnet.

#Aditional functionality 
Deploy Proxy 
npx hardhat run scripts\deploy_swapper_upgradeable.js --network <network> 
npx hardhat verify --network test<network>net address oj implementation 


#AddresAlocation
https://testnet.bscscan.com/address/0x3F33c831Dd48b08101363D7d105A54AD6Ac31b18 ERC20Swapper
https://testnet.bscscan.com/address/0x2A19eBF5A48615e9345E0A68849a2Bf7762A43bC ERC20SwapperUpgradeable
