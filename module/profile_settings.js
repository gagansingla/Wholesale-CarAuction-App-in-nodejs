var common = require('./common');
var  util    = require('util');  
var session = require('express-session');  
var mysqli = require('./mysqli'); 
var q = require('q');
var fs = require('fs');
//var products = require('./products');
var common = require('./common');
var url = require('url');
var configure = require('../configure');
//default setters
var config = configure.app();

exports.profileDetails = function(req,mysql,q,fields)
{

    $mysqli = {};
    var defered = q.defer();
        
    strQuery = mysqli.mysqli($mysqli,25); 
    escape_fields = [fields,req.session.userid]
    //console.log(escape_fields);
	query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());

	return defered.promise;
}

exports.saveDetails = function(req,mysql,q)
{
	$mysqli = {};
	var defered = q.defer();
	var userdet = req.body; 
	q.all(this.profileDetails(req,config.mysql,q,['image','avatar'])).then(function(results){ 
	userdet.image = (typeof(req.files.profile_image) !== 'undefined') ? req.files.profile_image.name : results[0][0]['avatar'];
	userdet.avatar =(typeof(req.files.profile_image) !== 'undefined') ? req.files.profile_image.originalname : results[0][0]['image'];
	if(typeof(req.files.profile_image) !== 'undefined') 
	{
		fs.unlink(config.path+"public/uploads/profile/"+results[0][0]['avatar'], function (err) {
		if (!err)
		console.log('successfully deleted '+results[0][0]['avatar']);
	});
	}
    strQuery = mysqli.mysqli($mysqli,54); 
    escape_fields = [userdet.email,userdet.firstname,userdet.lastname,userdet.aboutme,userdet.image,userdet.avatar,userdet.address1,userdet.address2,userdet.country,userdet.state,userdet.city,userdet.zip,userdet.phone,req.session.userid]
 console.log(userdet);
	query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());
	req.session.email =  req.body.email;
	req.session.first_name =  req.body.firstname;
	req.session.last_name =  req.body.lastname;
	
});
	return defered.promise;
}

exports.managecategories = function(req,mysql,q,mcat)
{
    $mysqli = {};
	var defered = q.defer();

		q.all(this.checkProfilecategory(req,mysql,q,mcat)).then(function(results){ 
		if(results[0].length == 0)
		{			
			 strQuery = mysqli.mysqli($mysqli,116); 
		     escape_fields = [req.session.userid,mcat] 
			 query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());
		}
		
		});
	
	return defered.promise;
}

exports.checkProfilecategory = function(req,mysql,q,userCid)
{
    $mysqli = {};
	var defered = q.defer();
    strQuery = mysqli.mysqli($mysqli,114); 
    escape_fields = [req.session.userid,userCid] 
	query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());	
	return defered.promise;
}

exports.removeCategories = function(req,mysql,q)
{
     var cateArray = '';
	 if(typeof(req.body.categories) =='undefined')
	 implodeats = '0';
	 else
	 {
	 cateArray  = req.body.categories;
     implodeats = cateArray.join(',');
	 }
	 //	 console.log(33333333333);
	 $mysqli = {};
	 var defered = q.defer();
     strQuery = mysqli.mysqli($mysqli,115); 
     escape_fields = [req.session.userid,implodeats] 
	 query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());
	 return defered.promise;
}
exports.listUserCategories = function(req,mysql,q)
{
	 $mysqli = {};
	 var defered = q.defer();
     strQuery = mysqli.mysqli($mysqli,117); 
     escape_fields = [req.session.userid] 
	 query =  mysql.query(strQuery,escape_fields,defered.makeNodeResolver());
	 return defered.promise;
}