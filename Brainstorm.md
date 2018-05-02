* Every function of the UIP smart contract has to work
    * There may be a problem with how the contract currently authenticates and or communicates other contracts 
* Functions include
    * function createIdentity (bytes32 _identityKey)
    * function addPublicKey (bytes32 _userID, uint16 _position, address newPublicKey)
    * function addRawPGPKey (bytes32 _userID, uint16 _position, string _PGPKey)
    * function issueToken (bytes32 _userID, uint16 _position, bytes32 _issueIDTo, string _verifiedHASH, string _encryptedIPFSLink, uint16 _validity, bytes16 tokenID)
    * function revokeIssuedToken (bytes32 _userID, uint16 _position, bytes32 _issueIDTo, uint16 _validity, bytes16 tokenID)
    * function acceptToken (bytes32 _userID, uint16 _position, bytes32 _issuerID, bytes16 _certID)
    * function revokeToken (bytes32 _userID, uint16 _position, bytes32 _issuerID, bytes16 _certID)
    * function addTokenMetaData (bytes32 _userID, uint16 _position, bytes16 _certID, string _metaData)
    * function setEmail (bytes32 _userID, uint16 _position, string _email)
* How will other smart contracts use the UIP
    * There has to be a public token of some kind and a private one
    * The public needs a seperate struct
    * What data do I want carried in this public token
        * First of all the issuer can reject the token
        * How about setting a payment address
        * How does one use their identity to communicate with another application
        * They will have to issue tokens
        * One should be able to reissue tokens
            * Let's check for that functionality
        * Issue token
            * It can overwrite the existing token
            * Ehhh this is an issue
        * Ok we need different types of tokens inside the smart contract
            * Identity File Token
                * The one already implemented
            * Identity application token
                * Wait applications use tones of different types of data
                * They also need it in different ways
                * How about I have another application token that saves a bytes 32, remember there is also the bytes16 which can be used
        * Ok these tokens can be reassigned is that a good idea?
            * It is an alright way of doing this, if I add events it will be alright
            * I can even have a special event for reassiened identity tokens