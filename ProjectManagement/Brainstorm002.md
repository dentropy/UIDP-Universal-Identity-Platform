# Brainstorm 002
* Goal
    * <b>Implement new Manage Identity Page</b>
* What does this Manage Identity Page do?
    * Create an Identity using metamask and a public private key pair
    * Manage multitple identitys controlled by one public private key pair
    * Add and modify meta data to ones identity including
        * Email
        * PGP Key
        * Other
    * Retrive metadata from idenrity
    * Vote to remove a key pair
        * See current status of votes
    * Manage personal credential tokens
        * See list of credential tokens
        * Accept or revoke and credential token
        * See metadata associeted with credential token
    * Issue credential tokens to other identities
``` 
struct identityTokenStruct {
    string verifiedHASH;
    string encryptedIPFSLink;
    uint16 validity;
    bool ownerAccepts;
}
```
* An API is needed running in the front end
* List everything this API has to do?
    * Create and Identity on the blockchain
    * Fetch list of identitys associeted with public key
    * Get and Set 
        * PGP Key
        * Email
    * Get and Set Creadential token metadata
    * Accept or revoke credential token
* Plan
    1. First implement an API what does the above and outputs everything to console
    2. Then write some javascript functions that can take the data strucutre from the API above and implement it in the user interface
* Need to break down first part of the plan
    * Very specific goals are required
    * Create Identity
        * Get Identity's
    * Add Email
        * Get Email
    * Add PGP Key
        * Get PGP Key
    * Issue Credential Token
        * Get Credential Tokens
    * Manage key pairs in next iteration
* A datastructure is required for this
    * Dictionary or List?
    * Dictionary with the keys being the 32 byte unique identitys
* What goes in this dictionary key?
    * email
    * pgpKey
    * Dictionary of Credential Tokens
    * Dictionary of issued credential tokens
