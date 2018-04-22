module.exports = {
  networks: {
    /*development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
    rinkeby: {
      host: "https://rinkeby.infura.io/",
      port: 8545,
      network_id: "*" // Match any network id
    }
    */

    development: {
      provider: new HDWalletProvider("conduct coil cactus atom need donate paddle fossil moon impact cargo text", "https://ropsten.infura.io/"),
      network_id: '3',
    },
  }
};