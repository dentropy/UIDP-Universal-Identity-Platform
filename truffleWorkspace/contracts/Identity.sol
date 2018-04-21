pragma solidity ^0.4.16;

contract Identity {
    //Datastructures
    struct identityToken {
        bytes32 verifiedHASH;
        bytes32 encryptedIPFSLink;
        uint16 validity;
        bool ownerAccepts;
    }
    struct identityAddress {
        address accountAddress;
        bool valid;
    }
    mapping (bytes32 => bool) validIdentityKeys;
    mapping (bytes32 => identityAddress[]) public identities;
    mapping (bytes32 => mapping(bytes32 => identityToken)) identityTokens;
    //Functions


    //Constructor
    //Curently I have nothing for it to do
    //This is a decentralized identity platform, so I have no authory anyways
    address creator;
    function Identity () internal {
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
        if(identities[_userID][_position].accountAddress == msg.sender){
            identities[_userID].push(identityAddress(newPublicKey, true));
            return(true);
        }
        else {
            return(false);
        }
    }
    function deletePublicKey () public {
        //How do we remove keys from the middle of the array
    }
    function addPGPKey (string _key) public {
        //Doing this next
    }
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