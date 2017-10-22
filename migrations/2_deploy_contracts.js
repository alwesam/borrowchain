var Borrow = artifacts.require("./BorrowChain.sol");
module.exports = function(deployer) {
  deployer.deploy(Borrow);
};
