// deployed at 0x00B8c1718a5100b913A7B6687A9141C0E9771E85

const hre = require("hardhat");

async function main() {
  const [owner, tipper, tipper2, tipper3] = await hre.ethers.getSigners();

  console.log("start");
  const BuyMeACoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
  console.log("1");
  const buyMeACoffee = await BuyMeACoffee.deploy();
  console.log("2");
  await buyMeACoffee.deployed();
  console.log("Contract deployed at: ", buyMeACoffee.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
