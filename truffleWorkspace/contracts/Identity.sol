pragma solidity ^0.4.16;

contract Identity {
    //Datastructures
    struct identityToken {
        bytes32 verifiedHASH;
        bytes32 encryptedIPFSLink;
        uint16 validity;
        bool ownerAccepts;
    }
    mapping (bytes32 => bool) validIdentityKeys;
    mapping (bytes32 => address[]) public identities;
    mapping (bytes32 => mapping(bytes32 => identityToken)) identityTokens;
    //Functions


    //Constructor
    //Curently I have nothing for it to do
    //This is a decentralized identity platform, so I have no authory anyways
    function Identity () internal {

    }


    function createIdentity (bytes32 _identityKey) public returns (bool) {
        if(validIdentityKeys[_identityKey] == false){
            validIdentityKeys[_identityKey] = true;
            identities[_identityKey].push(msg.sender);
            return(true);
        }
        else{
            return(false);
        }
    }
    function addPublicKey () public {}
    function deletePublicKey () public {}
    function addPGPKey () public {}
    function addRawPGPKey () public {}
    function removePGPKey () public {}
    function selectCurrentPGPKey () public {}
    function addTokenMetaData () public {}
    function appendTokenMetadata () public {}
    function acceptToken () public {}
    function revokeToken () public {}
    function issueToken () public {}
    function revokeIssuedToken () public {}

}