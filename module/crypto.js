 // Nodejs encryption with CTR
var crypto = require('crypto'),
    algorithm = 'aes-256-ctr',
    password = '!@#$Auction_Software_9089';
 
exports.encrypt = function(text)
{ 
  var cipher = crypto.createCipher(algorithm,password)
  var crypted = cipher.update(text,'utf8','hex')
  crypted += cipher.final('hex');
  return crypted;
}
 
exports.decrypt = function(text)
{ 
  var decipher = crypto.createDecipher(algorithm,password)
  var dec = decipher.update(text,'hex','utf8')
  dec += decipher.final('utf8');
  return dec;
}


/*
var cryptos =  require('./module/crypto.js');
 var hw = cryptos.encrypt("hello world")
// outputs hello world
console.log(hw);
console.log(cryptos.decrypt(hw));*/
 



