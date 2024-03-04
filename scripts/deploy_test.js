const hre = require('hardhat')
const ROUTER = process.env.SWAP_ROUTER
const ver = async function verifyContracts(address, arguments) {
    await hre
        .run('verify:verify', {
            address: address,
            constructorArguments: arguments,
        })
        .catch((err) => console.log(err))
}

async function main() {
    const [deployer] = await hre.ethers.getSigners();
    const Contract = await hre.ethers.getContractFactory('ERC20Swapper');
    let contract = await Contract.deploy(
        ROUTER
    );

    const contractNew = await contract.deployed()

    console.log(`ERC20Swapper deployed: ${contractNew.address} by ${deployer.address}`);

    console.log('Verifying contracts...')
    await ver(contractNew.address, [ROUTER]);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
