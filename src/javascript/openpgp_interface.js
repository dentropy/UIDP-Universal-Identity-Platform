// These three functions are the basic functions we can use to interface with openpgp
// they assume openpgp has been loaded into the web browser.
// ie <script src="openpgp.min.js"></script>

function identityGenerateKey(id, pwd) {
	var options = {
  	  userIds: [{ id: id}], // multiple user IDs
  	  curve: "ed25519",                                         // ECC curve name
  	  passphrase: pwd         // protects the private key
	}
	return openpgp.generateKey(options)
}

function encryptMessage(message, pubkey){
	var msg_opt = {
      data: message,                             // input as String (or Uint8Array)
      publicKeys: openpgp.key.readArmored(pubkey).keys,  // for encryption
    }
    return openpgp.encrypt(msg_opt)
}

async function decryptMessage(message, privkey, passphrase){
	var privKeyObj = openpgp.key.readArmored(privkey).keys[0];
	decrypt_options = {
   		message: openpgp.message.readArmored(message),     // parse armored message
    	privateKeys: [privKeyObj]                            // for decryption
    };
    await privKeyObj.decrypt(passphrase)
    return openpgp.decrypt(decrypt_options)
}

async function demoAllFunctions(){
	var testMessage1 = "this is a testmessage 1"
	var testPwd1 = "foonpwd"
	var testId1 = "fun id"
	var testPrivateKey1
	var testPubKey1
	identityGenerateKey(testId1, testPwd1).then(function(key){
		var pubkey = key.publicKeyArmored
		testPubKey1 = pubkey
		testPrivateKey1 = key.privateKeyArmored
		return encryptMessage(testMessage1, pubkey)
	}).then(function(ciphertext){
		var encrypted = ciphertext.data // '-----BEGIN PGP MESSAGE ... END PGP MESSAGE-----'
    	return decryptMessage(encrypted, testPrivateKey1, testPwd1)   
	}).then(function(plaintext){
		console.log("decrypted message")
		console.log(plaintext.data)
		console.log((plaintext.data === testMessage1))
	})
	
	// plenty of time for the pub/priv key pair to be generated :)
	await sleep(2000)
	
	var testMessage2 = "next message"
	var encData
	encryptMessage(testMessage2, testPubKey1).then(function(ciphertext){
		var encrypted_data = ciphertext.data
		encData = encrypted_data
	})
	await sleep(2000)
	decryptMessage(encData, testPrivateKey1, testPwd1).then(function(plaintext){
		console.log("decrypted message")
		console.log(plaintext.data)
		console.log("this should be true")
		console.log((plaintext.data === testMessage2))
	})
}

async function demo2(){
	// lets try a whole new example
	var testPwd2 = "scorpio"
	var textId2 = "hank"
	var key = await identityGenerateKey(textId2, testPwd2)
	console.log("keys:")
	console.log(key)
	
	var testMessage3 = "test message the third"
	// take testMessage3 and encrypt it with the new pubkey from key
	var ciphertext3 = await encryptMessage(testMessage3, key.publicKeyArmored)
	var enc_data = ciphertext3.data // this is essentially the encrypted message
	var plaintext = await decryptMessage(enc_data, key.privateKeyArmored, testPwd2) 
	console.log("The plain text is")
	console.log(plaintext.data)
	console.log("and it should be equal to testMessage3")
	console.log((plaintext.data === testMessage3))
	return 12
}

// function for testing
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
