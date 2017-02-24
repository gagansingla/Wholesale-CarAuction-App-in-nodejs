var mysql = require('mysql');

var data = [];

data['paypal'] = 'rengaone1990@gmail.com';

data['paypalsandbox'] = true;
data['surl'] = 'http://shopifyclone.com';
data['port'] = '3030';
data['url'] = data['surl']+':'+data['port'];
data['title'] = 'AuctionSoftware.com';
data['path'] = '/home/shopifyclone/public_html';
data['spath'] = data['url']+'/';
//data['surl'] += '/node/node1/penny/trunk/';
data['dpath'] = data['spath'];
data['externalcss'] = data['spath']+'css/';
data['externaljs'] = data['spath']+'js/';
data['imgpath'] = data['surl']+'/uploads/';
data['connect'] = mysql.createConnection({
  host : 'localhost',
  	user : 'shopifyc_penny',
  	password: 'shopifyc_penny',
  });   
data['connect'].connect();
data['connect'].query('use shopifyc_penny');
data['mysql'] = data['connect'];
data['captachapublickey'] = '6LcIlP4SAAAAAKZaBnJuOZVNMsZXcv7Sfx8FfzFd';
data['captachaprivatekey'] = '6LcIlP4SAAAAAL5RHTz3qZ-isRTPA1UAazjOmrkp';


exports.app = function()
{  

   return data;
}
