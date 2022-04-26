const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('PP88');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);

    // call the function
    let txn = await nftContract.makePP88()
    //wait for it to be mined
    await txn.wait()
};

const runMain = async () => {
    try {
        await main();
        process.exit(0)
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();