var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
var q = require('q');
var cryptos =  require('./crypto');


//required js
var configure = require('../configure');

//default setters
var config = configure.app();

$arr = {
  config : config
}


exports.show = function(mysql,callback)
{
   var row = [];	
   callback(row);
}
exports.loadPage = function(req,res,$arr,config)
{
	//console.log(req.param('id'));
	 if(typeof(req.param('id')) !='undefined')
	 $arr.r_id = req.param('id');
	 $arr.register_fail = true;
	 $arr.register_error = req.param('error');
	 $arr.externaljs = ['register'];
	 Recaptcha = require('recaptcha').Recaptcha; 

     var PUBLIC_KEY  = config.captachapublickey,
         PRIVATE_KEY = config.captachaprivatekey;
         console.log(PUBLIC_KEY+'&&'+PRIVATE_KEY);
	 var recaptcha = new Recaptcha(PUBLIC_KEY, PRIVATE_KEY);
	 $arr.captchahtml = recaptcha.toHTML();


  
  function processIndex(row)
  {
    common.tplFile('index.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req,res,$arr);
  }
   this.show(config.mysql,processIndex);
}
exports.checkemail = function(mysql,req)
{
  $mysqli = {
    	       email:req.body.email
    	       
    	    };
    
	strQuery = mysqli.mysqli($mysqli,12); 
    
    

    var defered = q.defer();

	query =  mysql.query(strQuery,defered.makeNodeResolver());

	return defered.promise;
}
exports.save = function(mysql,req,res)
{
	var self = this;
	q.all([self.dosave(mysql,req)]).then(function(results){ 
	     result = results[0][0];
		 console.log(result);
     customerio = require('./customerio');     
     customerio.uid = result.insertId;
	 //referral update
	 if(typeof(req.body.r_id) !== 'undefined' &&  req.body.r_id != '' && result.insertId>0)
	 {
	 	self.referral(mysql,req,result.insertId,self);
	 }	
	 
	 console.log(1);
     customerio.inits();     
     customerio.createCustomer({email:req.body.email,user:{firstName:req.body.first_name,lastName:req.body.last_name}});
     customerio.sendEmail({event:'Signed Up',content:{user:req.body.first_name+' '+req.body.last_name}});
		 req.session.userid = result.insertId;
     req.session.email = req.body.email;
     req.session.first_name = req.body.first_name;
     req.session.last_name = req.body.last_name;
	    if(typeof(req.body.fid) !== 'undefined')
	    {
	        self.updateFid(mysql,req,res,result.insertId);
	    } 
	    if(typeof(req.body.lid) !== 'undefined')
	    {
	        self.updateLid(mysql,req,res,result.insertId);
	    } 
     console.log(2);
		 res.writeHead(302, {
	       'Location': '/'
	        //add other headers here...
	      });
	 res.end();
	 return false;

		  
    });
}
exports.random = function(high,low) 
{

    return Math.random() * (high - low) + low;

}
exports.updateFid = function(mysql,req,res,uid)
{
	$mysqli = {};
    
	strQuery = mysqli.mysqli($mysqli,87); 

    var defered = q.defer();
    escape_data = [req.body.fid,req.body.fid_json,uid];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}
exports.checkfid = function(mysql,req)
{
	$mysqli = {};
    
	strQuery = mysqli.mysqli($mysqli,88); 

    var defered = q.defer();
    escape_data = [req.body.fid];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}
exports.updateLid = function(mysql,req,res,uid)
{
	$mysqli = {};
    
	strQuery = mysqli.mysqli($mysqli,89); 

    var defered = q.defer();
    escape_data = [req.body.lid,req.body.lid_json,uid];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}
exports.checklid = function(mysql,req)
{
	$mysqli = {};
    
	strQuery = mysqli.mysqli($mysqli,90); 

    var defered = q.defer();
    escape_data = [req.body.lid];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}
exports.dosave = function(mysql,data)
{

	datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
	var md5 = require('MD5');
	var password_salt = '12345'
	var password = md5(md5(data.body.password)+password_salt);
	//console.log(data.body);
    $mysqli = {
    	       email:data.body.email,
    	       role:1,    	       
    	       created_at:datge,
    	       password_hash:password,
    	       password_salt:password_salt,
    	      };
    
	strQuery = mysqli.mysqli($mysqli,11); 
    
    

  var defered = q.defer();
  escape_data = [data.body.first_name,data.body.last_name];
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

   return defered.promise;
}

exports.referral = function(mysql,data,ref_id,self)
{
    $mysqli = {}; 
    console.log(0);
	var from_ref = cryptos.decrypt(data.body.r_id); 
	console.log(from_ref);  
	strQuery = mysqli.mysqli($mysqli,104); 
    var defered = q.defer(mysql,data);
    escape_data = [from_ref,ref_id,dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss"),''];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	//self.addbalance(mysql,data,from_ref);
	return defered.promise;
}

exports.addbalance = function(mysql,req,from_ref)
{
    $mysqli = {}; 
	strQuery = mysqli.mysqli($mysqli,28); 
    var defered = q.defer();
    escape_data = [config.referral_bonus,from_ref];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	return defered.promise;
}


