# UIP-Universal-Identity-Platform
Universal Identity Platform
Using Solidity Ethereum and IPFS

* Give People, Organization, and even smart contracts an identity with the UIP, Universal Identity Platform
    * Our app is in production on the rinkeby testnet [here](http://blockapps.tech:3042/)
* Use metamask to get and put data on the blockchain using out Identity smart contract
    * Manage your identity with many public keys
        * So single point of failure as is the case with uPort
    * Use consensys with your public keys to unverify other public keys
        * When someone has 3 keys they can reject one
        * When someone has 4 keys they need 3 of them to reject one
        * WHen someone has 5 keys they need 3 of them to reject one
        * WHen someone has 6 keys they need 4 of them to reject one 
        * When someone has 7 keys they need 4 of them to reject one
    * Create multiple identitys with single public key
* Dependencies
    * Nodejs
        * npm install -g truffle
        * npm install truffle-hdwallet-provider
        * npm install express
