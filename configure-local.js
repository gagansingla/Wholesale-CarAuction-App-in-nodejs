var mysql = require('mysql');

var data = [];

data['paypal'] = 'rengaone1990@gmail.com';
data['paypalsandbox'] = true;
data['surl'] = 'http://localhost';
data['port'] = '8080';
data['url'] = data['surl']+':'+data['port'];
data['title'] = 'AuctionSoftware.com';
data['path'] = 'c:/wamp/www/node/node1/penny/trunk/';
data['spath'] = data['url']+'/';
//data['surl'] += '/node/node1/penny/trunk/';
data['dpath'] = data['spath'];
data['externalcss'] = data['spath']+'css/';
data['externaljs'] = data['spath']+'js/';
data['imgpath'] = data['url']+'/uploads/';
data['connect'] = mysql.createConnection({
  host : 'localhost',
  	user : 'root',
  	password: '',
  });   
data['connect'].connect();
data['connect'].query('use penny');
data['mysql'] = data['connect'];
data['captachapublickey'] = '6LcIlP4SAAAAAKZaBnJuOZVNMsZXcv7Sfx8FfzFd';
data['captachaprivatekey'] = '6LcIlP4SAAAAAL5RHTz3qZ-isRTPA1UAazjOmrkp';


exports.app = function()
{  

   return data;
}
