const hre = require("hardhat");

async function main() {
  const KUSDToken = await hre.ethers.getContractFactory("KUSDToken");
  const kUSDTokenContract = await KUSDToken.deploy(100000, 70000, 2);

  console.log("KUSD Token deployed: ", await kUSDTokenContract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});