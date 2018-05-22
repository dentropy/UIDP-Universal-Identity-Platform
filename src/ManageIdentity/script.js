//SideNav Push
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}
//END SideNav Push


//Create object for the Identity smart contract
var IdentityContract = {};
$.getJSON("/abi/Identity.json", function (result) {
    IdentityContract.abi = result;
    var tmp_networks = [];
    for (var i in IdentityContract.abi.networks) {
        tmp_networks.push(i);
    }
    IdentityContract.name = "Identity";
    var tmp_the_correct_network = tmp_networks[tmp_networks.length - 1];
    console.log(IdentityContract.abi)
    IdentityContract.address = IdentityContract.abi.networks[tmp_the_correct_network].address;
    IdentityContract.call = web3.eth.contract(IdentityContract.abi.abi).at(IdentityContract.address);
    GetUSERIDS();
});
//END creating Identity smart contract object


var USERIDS = [];
var CurrentIDSelected = 0;

var tmpCountIDs = 0;

function GetUSERIDS() {
    IdentityContract.call.publicKeyToIdentity(web3.eth.accounts[0], tmpCountIDs, function (err, result) {
        if(result != "0x"){
            USERIDS.push(result);
            tmpCountIDs += 1;
            GetUSERIDS();
        }
        else {
            AfterIdentitysObtained();
        }
    })
}


//Attach email
function SetEmailID() {
    var tmpEmail = document.getElementById("UpdateIdentityEmail").value;
    document.getElementById("UpdateIdentityEmail").value = "";
    IdentityContract.call.setEmail(USERIDS[CurrentIDSelected], 0, tmpEmail, function (err, result) {
        console.log("email updated sucessfully");
        console.log(result);
    })
}

function GetEmailID() {
    //CurrentIDEMail
    IdentityContract.call.email(USERIDS[CurrentIDSelected], function(err, result){
        console.log(result);
        document.getElementById("CurrentIDEMail").innerHTML = "Your current email is set to : " + result;
    } )
}


//Update PGP Key
function SetPGPKeyID() {
    var tmpPGPKey = document.getElementById("UpdateIdentityPGPKey").value;
    document.getElementById("UpdateIdentityPGPKey").value = "";
    IdentityContract.call.addRawPGPKey(USERIDS[CurrentIDSelected], 0, tmpPGPKey, function (err, result) {
        console.log("PGPKey updated sucessfully");
        console.log(result);
    } )
}

function GetPGPKeyID() {
    //CurrentIDPGPKey
    IdentityContract.call.PGPKey(USERIDS[CurrentIDSelected], function(err, result){
        console.log(result);
        document.getElementById("CurrentIDPGPKey").innerHTML = "Your current public PGP Key is set to : " + result;
    })
}


//Get all credential tokens
function GetCredentialTokens() {

}


//Give another identity a credential token
function GiveCredentialToken() {

}


function CreateCredential() {
    //GiveCredentialTo
    //NameOfCredential
    //HashDataOfCredential
}


function AfterIdentitysObtained(){
    GetEmailID();
    GetPGPKeyID();  
}