var q = require('q');
var mysqli = require('./mysqli');
var common = require('./common');
exports.show = function(req,mysql,q)
{  
    $mysqli = {};
    var defered = q.defer();
    
	strQuery = mysqli.mysqli($mysqli,26); 
    
    escape_fields = [];	
	query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());

	return defered.promise;
}
exports.getPackageInfo = function(req,mysql,q,id)
{  
    $mysqli = {};
    var defered = q.defer();
    
	strQuery = mysqli.mysqli($mysqli,29); 
    
    escape_fields = [id];	
	query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());

	return defered.promise;
}