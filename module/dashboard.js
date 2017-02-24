var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
var q = require('q');
exports.show = function(mysql,callback)
{
   var row = [];	
   callback(row);
}

exports.saveaddress = function(req,mysql,q,doauction)
{
    $mysqli =  {};
	if(doauction == 'save')
	strQuery = mysqli.mysqli($mysqli,101); 
	if(doauction == 'update')
	strQuery = mysqli.mysqli($mysqli,103);    
    var defered = q.defer();
    var escape_data =  [req.body.name,
                       req.body.address1,
		    	       req.body.address2,
		    	       req.body.country,
		    	       req.body.state,
		    	       req.body.city,
		    	       req.body.zipcode,            
		    	       req.body.phone,
					   (typeof(req.session) !== 'undefined')  ? req.session.userid : 0,
					   req.body.type]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}

exports.getAddresses = function(req,mysql,q,Addtype)
{
    $mysqli =  {};
	strQuery = mysqli.mysqli($mysqli,102);     
    var defered = q.defer();
    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,Addtype]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	return defered.promise;
}


exports.getReferral = function(req,mysql,q,isadmin,count)
{
    $mysqli =  {};
	if(isadmin == 1)
	{
	if(count == 1)
	{
	strQuery = mysqli.mysqli($mysqli,120); 
	var escape_data =  [];	
	}
	else
	{
	strQuery = mysqli.mysqli($mysqli,118); 
	page = (req.body.page - 1) * 10;
	var escape_data =  [page];	
	}
	}
	else
	{
	strQuery = mysqli.mysqli($mysqli,105);  
	var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]     
	}
    var defered = q.defer();
   // var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	return defered.promise;
}

exports.getOpenProjects = function(req,mysql,q)
{
    datge = dateFormat(new Date(),"yyyy-mm-dd");
    $mysqli = {datge:datge};
	strQuery = mysqli.mysqli($mysqli,106);     
    var defered = q.defer();
    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	return defered.promise;
}


exports.saveAutobid = function(req,mysql,q)
{
    $mysqli =  {};
	strQuery = mysqli.mysqli($mysqli,107);    
    var defered = q.defer();
    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,
                       req.body.project_id,
		    	       req.body.start_amount,
		    	       req.body.amount,
		    	       req.body.amount,
		    	       dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss")]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}


exports.checkAutobid = function(req,mysql,q)
{
    $mysqli =  {};
	strQuery = mysqli.mysqli($mysqli,109);    
    var defered = q.defer();
    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,
                       req.body.project_id
		    	       ]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}

exports.fetchAutobidlist = function(req,mysql,q)
{
    $mysqli =  {};
	strQuery = mysqli.mysqli($mysqli,110);    
    var defered = q.defer();
    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]          
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}

exports.mybuynow = function(req,mysql,q,count)
{
    $mysqli =  {};
    cnt = 85;
    var escape_data =  [req.session.userid,req.body.page] 
    if(count == 1)
    {
    	cnt = 86;
    	var escape_data =  [req.session.userid] 
    }	
	strQuery = mysqli.mysqli($mysqli,cnt);    
    var defered = q.defer();
             
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
}

exports.updateReferralStatus = function(req,mysql,q,rid)
{
    $mysqli =  {};
	strQuery = mysqli.mysqli($mysqli,119);     
    var defered = q.defer();
    var escape_data =  [rid]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	return defered.promise;
}


exports.removeAddresses = function(req,mysql,q,Addtype)
{
    $mysqli =  {};
	strQuery = mysqli.mysqli($mysqli,121);     
    var defered = q.defer();
    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,Addtype]               
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	return defered.promise;
}


