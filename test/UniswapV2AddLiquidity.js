const { expect } = require("chai");
const hre = require("hardhat");

describe("UniswapV2AddLiquidity contract", function() {
  // global vars
  let Token;
  let kittyToken;
  let kUSDToken;
  let UniSwapV2;
  let addLiquidityContract;
  let owner;
  let tokenCap = 100000;
  let tokenInitialMint = 70000;
  let tokenBlockReward = 2;
  let liquidityAmount = tokenInitialMint / 2;

  beforeEach(async function () {
    // Get the ContractFactory and Signers here.
    [owner, _, _] = await hre.ethers.getSigners();

    Token = await hre.ethers.getContractFactory("KittyToken");
    kittyToken = await Token.deploy(tokenCap, tokenInitialMint, tokenBlockReward);

    Token = await hre.ethers.getContractFactory("KUSDToken");
    kUSDToken = await Token.deploy(tokenCap, tokenInitialMint, tokenBlockReward);

    UniSwapV2 = await hre.ethers.getContractFactory("UniswapV2AddLiquidity");
    addLiquidityContract = await UniSwapV2.deploy();
  });

  describe("Add Liquidity", function () {
    it("Add Liquidity for the pair", async function () {
      let amountA, amountB, liquidity = await addLiquidityContract.addLiquidity(kittyToken, kUSDToken, liquidityAmount, liquidityAmount);
      expect(amountA).to.not.equal(0);
      expect(amountB).to.not.equal(0);
      expect(liquidity).to.not.equal(0);
    });
  });
});