var  util    = require('util'),
     nsmarty = require('nsmarty');
var md5 = require('MD5');
var mysqli = require('./mysqli');
var common = require('./common');
exports.process = function(req,mysql,callback)
{
	$mysqli = {username:req.param('username')};
	strQuery = mysqli.mysqli($mysqli,0);  
    
	query =  mysql.query(strQuery, function (error, results, fields){
		if(results.length > 0)
		{
			result = results[0]; 
			result.password = md5(md5(req.param('password'))+result['password_salt']);
			console.log(result.password);
	        if(result.password == result.password_hash)
	        {	
	         callback(results);
	        }
	        else
	        {
	        	callback('');
	        } 
        }
        else
        {
        	callback('');
        }
	});
	  
}
exports.saved = function(req,res,arr)
{
  common.tplFile('saved.tpl');
  common.headerSet(1);
  common.loadTemplateHeader(req,res,arr);
};
exports.login = function(req,res,arr)
{
  common.tplFile('login.tpl');
  common.headerSet(1);
  common.loadTemplateHeader(req,res,arr);
};