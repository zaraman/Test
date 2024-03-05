
ERC20Swapper Deployment Guide
Quickstart
This guide walks you through deploying the ERC20Swapper contract, which enables swapping Ether for ERC20 tokens using the PancakeSwap Router.

Prerequisites
Node.js and npm installed.
Hardhat environment set up in your project.
An account with enough ETH for deployment and transactions.
Access to a PancakeSwap Router address.
Installation
First, install the necessary npm packages:


Copy code
npm install
Configuration
Create a .env file in your project root with your deployment account's private key and your  API key (if deploying to a testnet or mainnet):

env
Copy code
BSCSCANAPIKEY_API_KEY=
BSC_PRIVATE_KEY=
Make sure to replace <BSC_PRIVATE_KEY> and <BSCSCANAPIKEY_API_KEY> with your actual private key and API_KEY.

Deployment
Run the deployment script with:

sh
Copy code
npx hardhat run scripts\deploy_swapper.js --network <network>
Replace <network> with the network you intend to deploy to, such as mainnet, testnet.


