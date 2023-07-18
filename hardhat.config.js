require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers: [
        {
            version: '0.8.20',
            settings: {
                evmVersion: 'paris'
            }
        }
    ]
  },
  networks: {
    goerli: {
      url: process.env.RPC_GOERLI_ENDPOINT,
      accounts: [process.env.PRIVATE_KEY]
    },
    polygon_mumbai: {
      url: process.env.RPC_POLYGON_MUMBAI_ENDPOINT,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
