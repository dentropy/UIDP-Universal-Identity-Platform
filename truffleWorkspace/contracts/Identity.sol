pragma solidity ^0.4.16;

contract Identity {
    //Datastructures
    struct identityTokenStruct {
        string verifiedHASH;
        string encryptedIPFSLink;
        uint16 validity;
        bool ownerAccepts;
    }
    struct identityAddress {
        address accountAddress;
        bool valid;
    }
    /*
    struct userInfoStruct {
        string rawPGPKey;
        string ipfsPGP;
    }
    */
    mapping (bytes32 => string) PGPKey;
    mapping (bytes32 => bool) validIdentityKeys;
    mapping (bytes32 => identityAddress[]) public identities;
    //mapping (bytes32 => userInfoStruct) public userInfo; 

    //User, Issuer, Certification ID
    mapping (bytes32 => mapping(bytes32 => mapping(bytes16 => identityTokenStruct))) identityToken;
    //Functions


    //Constructor
    //Curently I have nothing for it to do
    //This is a decentralized identity platform, so I have no authory anyways
    address creator;
    function Identity () public {
        creator = msg.sender;
    }


    function createIdentity (bytes32 _identityKey) public returns (bool) {
        if(validIdentityKeys[_identityKey] == false){
            validIdentityKeys[_identityKey] = true;
            identities[_identityKey].push(identityAddress(msg.sender, true));
            return(true);
        }
        else{
            return(false);
        }
    }
    function addPublicKey (bytes32 _userID, uint16 _position, address newPublicKey) public returns(bool) {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identities[_userID].push(identityAddress(newPublicKey, true));
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
    function issueToken (bytes32 _userID, uint16 _position, bytes32 _issueIDTo, string _verifiedHASH, string _encryptedIPFSLink, uint16 _validity, bytes32 _userIDTo, bytes16 tokenID) public returns (bool) {
        if(identities[_userID][_position].accountAddress == msg.sender && identities[_userID][_position].valid == true){
            identityToken[_issueIDTo][_userID][tokenID] = identityTokenStruct(_verifiedHASH, _encryptedIPFSLink, _validity, false);
        }
    }
    function revokeIssuedToken (bytes32 _userID, uint16 _position, bytes32 _issueIDTo, uint16 _validity, bytes32 _userIDTo, bytes16 tokenID) public returns (bool) {
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
    function addTokenMetaData () public {

    }
    function appendTokenMetadata () public {

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