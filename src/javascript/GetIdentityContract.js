/*
Run the following commands in the Browser Console to interact with the smart contract(s)
SmartContract                                                   <--- to show the JSON contract structure
GetSmartContract("/abi/set_int.json", "set_int");               <--- To set the current/active smart contract
SmartContracts["set_int"].address;                              <--- To show the data eleemnts of the contract
SmartContracts["set_int"].abi;
*/
/*
Run the following commands to interact with the set_int smart contract (in folder './truffleWorkspace/contracts')
SmartContracts["set_int"].call.public_int(function (err, result){console.log(result)});         <---  RETURNS an array where c = 'the value in the contract'
SmartContracts["set_int"].call.set_int_data(12,function (){console.log("IT SHOULD WORK")});
*/

GetSmartContract("/abi/Identity.json", "Identity");
function GetCreator(){
    SmartContracts["Identity"].call.creator(function (err, result){
        console.log(result)
    }); 
}
function what(){
    console.log("GetCreator();")
}