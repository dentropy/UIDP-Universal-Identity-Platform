//SideNav Push
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}
//END SideNav Push


//Create object for the Identity smart contract
var IdentityContract = {};
$.getJSON(_location, function (result) {
    IdentityContract.abi = result;
    var tmp_networks = [];
    for (var i in IdentityContract.abi.networks) {
        tmp_networks.push(i);
    }
    IdentityContract.name = _name;
    var tmp_the_correct_network = tmp_networks[tmp_networks.length - 1];
    console.log(IdentityContract.abi)
    IdentityContract.address = IdentityContract.abi.networks[tmp_the_correct_network].address;
    IdentityContract.call = web3.eth.contract(IdentityContract.abi.abi).at(IdentityContract.address);
});
//END creating Identity smart contract object


//Attach email
function SetEmailID(){
    //UpdateIdentityEmail
}
function GetEmailID(){
    //CurrentIDEMail
}


//Update PGP Key
function SetPGPKeyID(){
    //UpdateIdentityPGPKey
}
function GetPGPKeyID(){
    //CurrentIDPGPKey
}


//Get all credential tokens
function GetCredentialTokens(){

}


//Give another identity a credential token
function GiveCredentialToken(){

}