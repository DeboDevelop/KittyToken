const hre = require("hardhat");

async function main() {
  const UniswapV2AddLiquidity = await hre.ethers.getContractFactory("UniswapV2AddLiquidity");
  const uiniswapV2AddLiquidityContract = await UniswapV2AddLiquidity.deploy();

  console.log("UniswapV2 Add Liquidity deployed: ", await uiniswapV2AddLiquidityContract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});