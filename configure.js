var mysql = require('mysql');

var data = [];
var fs = require('fs')
  , ini = require('ini');


//saving array







exports.app = function()
{  
	var config_app = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));
	config = config_app['section'];
	delete global;
	global = [];
	global.database = config['database'];
	console.log(config);
	global.connect = mysql.createConnection({
	  host : global.database.host,
	  user : global.database.user,
	  password: global.database.password,
	});   
	global.connect.connect();
	global.connect.query('use '+global.database.database);
	global.mysql = global.connect;
	
	global.paths =    config['common'];
	global.common =   config['common'];
	global.general = config['general'];
	global.paypal =   config['paypal'];
	global.captcha =  config['captcha'];
	global.language =  config['language'];
	global.customerio =  config['customerio'];
	global.card =  config['card'];
	global.facebook = config['facebook'];
	global.linkedin = config['linkedin'];

	global.surl = global.paths.url;
	global.port = global.paths.port;
	global.url  = global.surl+':'+global.port;
	global.title = global.common.title;
	global.path = global.paths.path;
	global.spath = global.url+'/';
	//data['surl'] += '/node/node1/penny/trunk/';
	global.dpath = global.spath;
	global.externalcss = global.spath+'css/';
	global.externaljs = global.spath+'js/';
	global.imgpath = global.url+'/uploads/';
	
	global.captachapublickey = global.captcha['publickey'];
	global.captachaprivatekey = global.captcha['privatekey'];
	global.referral_bonus = 20;
	global.language_identifier = JSON.parse(fs.readFileSync('./'+global.language['language']+'_language.json', 'utf-8'));
    console.log(global.language_identifier);
   return global;
}
