pragma solidity ^0.4.16;

contract Identity {
    //Datastructures

    /*This is a credential that can be sent to an Identity key
        verifiedHASH is hash of a piece of data which is created by the issuer
        encryptedIPFSLink is for when the file is encrypted with the users PGP key that is on the platform
        The user can get the file which generates the verified hash and use that as ID which can be verified in this smart contact
        validity is for the state of the token, it can be used to revoke the credential as well
        ownerAccepts shows the owner agrees with what the credential repersents
        */
    struct identityTokenStruct {
        string verifiedHASH;
        string encryptedIPFSLink;
        uint16 validity;
        bool ownerAccepts;
    }
    /*
    This struct is for adding and removing public keys that can control the identity
    */
    struct identityAddress {
        address accountAddress;
        bool valid;
    }
    /*
    //Not used in current implementation
    struct userInfoStruct {
        string rawPGPKey;
        string ipfsPGP;
    }
    //mapping (bytes32 => userInfoStruct) public userInfo; 
    */
    mapping (address => bytes32[]) public publicKeyToIdentity;
    mapping (bytes32 => string) public email;
    mapping (bytes32 => string) public PGPKey;
    mapping (bytes32 => bool) public validIdentityKeys;
    mapping (bytes32 => identityAddress[]) public identities;

    //User, Issuer, Certification ID
    mapping (bytes32 => mapping(bytes32 => mapping(bytes16 => identityTokenStruct))) public identityToken;

    //This stuct maps to metadata or IPFS hash that explains what the token is about for people who do not know what the token is
    mapping (bytes32 => mapping(bytes16 => string)) public tokenMetadata;

    //Constructor
        //Curently I have nothing for it to do
        //This is a decentralized identity platform, so the creator has no authory anyways
    address public creator;
    constructor() public {
        creator = msg.sender;
    }

    
    function createIdentity (bytes32 _identityKey) public returns (bool) {
        if(validIdentityKeys[_identityKey] == false){
            validIdentityKeys[_identityKey] = true;
            identities[_identityKey].push(identityAddress(msg.sender, true));
            publicKeyToIdentity[msg.sender].push(_identityKey);
            return(true);
        }
        else{
            return(false);
        }
    }
    function addPublicKey (bytes32 _userID, uint16 _position, address newPublicKey) public returns(bool) {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identities[_userID].push(identityAddress(newPublicKey, true));
            publicKeyToIdentity[msg.sender].push(_userID);
            return(true);
        }
        else {
            return(false);
        }
    }
    function addRawPGPKey (bytes32 _userID, uint16 _position, string _PGPKey) public returns (bool) {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            PGPKey[_userID] = _PGPKey;
            return (true);
        }
        else {
            return(false);
        }
    }
    function issueToken (bytes32 _userID, uint16 _position, bytes32 _issueIDTo, string _verifiedHASH, string _encryptedIPFSLink, uint16 _validity, bytes16 tokenID) public returns (bool) {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identityToken[_issueIDTo][_userID][tokenID] = identityTokenStruct(_verifiedHASH, _encryptedIPFSLink, _validity, false);
        }
    }
    function revokeIssuedToken (bytes32 _userID, uint16 _position, bytes32 _issueIDTo, uint16 _validity, bytes16 tokenID) public returns (bool) {//bytes32 _userIDTo, 
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identityToken[_issueIDTo][_userID][tokenID].validity = _validity;
        }
    }
    function acceptToken (bytes32 _userID, uint16 _position, bytes32 _issuerID, bytes16 _certID) public {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identityToken[_userID][_issuerID][_certID].ownerAccepts = true;
        }
    }
    function revokeToken (bytes32 _userID, uint16 _position, bytes32 _issuerID, bytes16 _certID) public {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identityToken[_userID][_issuerID][_certID].ownerAccepts = false;
        }

    }
    function addTokenMetaData (bytes32 _userID, uint16 _position, bytes16 _certID, string _metaData) public {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            tokenMetadata[_userID][_certID] = _metaData;
        }
    }

    function setEmail (bytes32 _userID, uint16 _position, string _email) public {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            email[_userID] = _email;
        }
    }
    /*
    function deletePublicKey () public {
        //How do we remove keys from the middle of the array
    }
    function addPGPKey (string _key) public {
        //Do his at the end
    }
    function removePGPKey () public {}
    function selectCurrentPGPKey () public {}
    */

}