const { ethers } = require ("hardhat")
const { string } = require("hardhat/internal/core/params/argumentTypes")

async function main(){
  const LockFactory=await ethers.getContractFactory("Lock")
  console.log("Deploying contract...")
  const lock =await LockFactory.deploy(ERC721(name_,symbol_))
  await lock.deployed()
}

main()
.then(()=>process.exit(0))
  .catch((error) => {
  console.error(error);
  process.exit(1);
});
