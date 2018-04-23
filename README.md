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
* Identity is useless unless you can do something with it
    * Any identity can issue non transfurable tokens to another identity as a credential
    * This token contains metadata of a hash of a file that the user of the identity can show as proof of their identity
    * To transfer the identity file from the issuer to the user encrypting it with PGP and transfering it using email or IPFS 
    * Note that the token has a spot for the encrypted IPFS location so the user does not even need an email address
* PGP for secure transmission of information accross the internet
    * When an issuer gives out a credential a hash of a file is attached
    * The issuer transmits the file to the users email
    * One can attach a pgp key and email to their identity for secure communication with other entities on the identity platform
    * One can even generate a pgp key on our site [here](http://blockapps.tech:3042/GeneratePGPPair/index.html)
    * One can get thie pgp client [here](https://www.openpgp.org/software/)
* Dependencies
    * Nodejs
        * npm install -g truffle
        * npm install truffle-hdwallet-provider
        * npm install express
