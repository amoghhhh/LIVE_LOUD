require("@nomicfoundation/hardhat-toolbox");
require('@nomiclabs/hardhat-ethers')
const API_URL = "https://eth-goerli.g.alchemy.com/v2/Fpo7JUNnuH1jAu8LQAymWniy9RISLlJf";
const PRIVATE_KEY = "3bee7ae1ea48d6fa87ec49b6a1dab83ff5b81da5e88846bc2f843c0c18ea6282"
const PUBLIC_KEY = "0x1067029AD2A1b3744f4eB7a4cd64002E3974Da31";
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  defaultNetwork: "goerli",
  networks: {
    hardhat:{},
    goerli:{
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`]
    }
  }
};