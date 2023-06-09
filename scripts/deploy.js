const hre = require("hardhat");

async function main() {
  const KittyToken = await hre.ethers.getContractFactory("KittyToken");
  const kittyTokenContract = await KittyToken.deploy(100000, 2);

  // await kittyTokenContract.waitForDeployment();

  console.log("Kitty Token deployed: ", await kittyTokenContract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});