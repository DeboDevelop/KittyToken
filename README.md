## KittyToken

KittyToken is an ERC20 Token created by inheriting the OpenZeppelin Contract's ERC20, ERC20Burnable, and ERC20Capped. The ERC20 standard is a widely adopted interface for fungible tokens on the Ethereum blockchain. The ERC20 standard outlines a set of rules and functions that a smart contract must adhere to in order to be considered an ERC20-compliant token. The token is designed to be fungible, meaning each unit of the token is interchangeable and indistinguishable from another unit of the same value. ERC20Burnable allows the destruction of its own tokens, and ERC20Capped enforces a cap on the total supply when minting tokens.

The UniswapV2AddLiquidity smart contract is used for the purpose of providing liquidity to a Uniswap V2 pool. By deploying this contract and calling its specific function, the contract owner can add a predefined amount of KittyToken and Any Other Stable Coin Token to a Uniswap V2 pool. The KUSDToken is also an ERC20 Token representing a stablecoin token. It is created to test the UniswapV2AddLiquidity smart contract since tokens are hard to come by in test nets. We can create a KittyToken/KUSDToken pair and test the UniswapV2AddLiquidity smart contract.

### Recommended Requirements

node v18.16.0 or above.

npm v9.5.1 or above.

### To Run Locally

1. Clone the Repository.
2. Create a `.env` file and populate the following environment variable.
```
PRIVATE_KEY=Private key of your wallet
RPC_GOERLI_ENDPOINT=RPC endpoint to Goerli testnet.
RPC_POLYGON_MUMBAI_ENDPOINT=RPC endpoint to Polygon Mumbai testnet.
```
3. Run `npm install` to install the dependencies.
4. Run `npx hardhat node` to run local blockchain.
5. Run `npx hardhat test` to run the test.
6. Run `npx hardhat run --network <your-network> scripts/<filename>.js` to deploy the smart contracts.

### License

This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE) file for details.

### Author

[Debajyoti Dutta](https://github.com/DeboDevelop)