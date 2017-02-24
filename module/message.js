var  util    = require('util');
     
var q = require('q');
var products = require('./products');
var dateFormat = require('dateformat');
var common = require('./common');
var url = require('url');
var mysqli = require('./mysqli');
exports.usersmessages = function(req,mysql,q)
{

    $mysqli = {};

    strQuery = mysqli.mysqli($mysqli,159);
	     
		 var escape_data =  [];	
		
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;

}
exports.addmessages = function(req,mysql,q)
{

     datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");

    strQuery = mysqli.mysqli($mysqli,156);
	      customerio = require('./customerio');
  
    customerio.uid = req.body.toid;
    customerio.inits();
     console.log(req.body);
    customerio.createCustomer({email:req.body.toemail,user:{firstName:req.body.first_name,lastName:req.body.last_name}});
    
    customerio.sendEmail({event:'message',content:{subject:req.body.subject,fname:req.session.first_name+' '+req.session.last_name,tname:req.body.first_name+' '+req.body.last_name,message:req.body.message}});
 
		 var escape_data =  [req.session.userid,req.body.toid,req.body.subject,req.body.message,datge,req.body.r_id,'open','open'];	
		console.log(escape_data);
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;

}
exports.readmessages = function(req,mysql,q)
{

     datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");

    strQuery = mysqli.mysqli($mysqli,155);
	     
		 var escape_data =  [datge,req.body.r_id,req.session.userid];	
		console.log(escape_data);
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;

}
exports.movemessages = function(req,mysql,q)
{

     //datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
   status = 'open';
   if(req.body.action == 'archive')
   	status = 'archive'
   else if(req.body.action == 'delete')
   	status = 'delete'
    strQuery = mysqli.mysqli($mysqli,157);
	     
		 var escape_data =  [status,req.body.r_id,req.session.userid];	
		console.log(escape_data);
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		strQuery = mysqli.mysqli($mysqli,158);
	     
		 var escape_data =  [status,req.body.r_id,req.session.userid];	
		console.log(escape_data);
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;

}
exports.showmessages = function(req,mysql,q)
{

    $mysqli =  {where:'and p.r_id = "'+req.body.r_id+'"'};
    strQuery = mysqli.mysqli($mysqli,154);
	     
		 var escape_data =  [req.session.userid,req.session.userid];	
		
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;

}
exports.mymessages = function(req,mysql,q,count)
{
	   $mysqli =  {where:'',where1 : ''};
       if(req.body.action == 'inbox')
       {
           $mysqli =  {where:' and p.to_status != "delete" and p.to_id = "'+req.session.userid+'"'};
           $mysqli['where1'] = 'and m.to_status != "delete" and m.to_id = "'+req.session.userid+'"';
       }	
       else if(req.body.action == 'sent')
       {
           $mysqli =  {where:' and p.from_status != "delete" and p.from_id = "'+req.session.userid+'"'};
           $mysqli['where1'] = ' and m.from_status != "delete" and m.from_id = "'+req.session.userid+'"';
       }
       else if(req.body.action == 'archive')
       {
           $mysqli =  {where:' and ((p.from_status = "archive" and p.from_id = "'+req.session.userid+'") or (p.to_status = "archive" and p.to_id = "'+req.session.userid+'"))'};
           $mysqli['where1'] = 'and ((m.from_status = "archive" and m.from_id = "'+req.session.userid+'") or (m.to_status = "archive" and m.to_id = "'+req.session.userid+'"))';
       }
        else if(req.body.action == 'delete')
       {
           $mysqli =  {where:' and ((p.from_status = "delete" and p.from_id = "'+req.session.userid+'") or (p.to_status = "delete" and p.to_id = "'+req.session.userid+'"))'};
           $mysqli['where1'] = 'and ((m.from_status = "delete" and m.from_id = "'+req.session.userid+'") or (m.to_status = "delete" and m.to_id = "'+req.session.userid+'"))';
       
       }	
         
        	   
	   
	    if(count == 1)
	    {	
		 strQuery = mysqli.mysqli($mysqli,153);
		 var escape_data =  [req.session.userid,req.session.userid];	
	    }
	    else
	    {
	     strQuery = mysqli.mysqli($mysqli,152);
	     page = (req.body.page-1)*10;
		 var escape_data =  [req.session.userid,req.session.userid,page];	
		 console.log(escape_data);    
		 //var escape_data =  [];	
	    }	
	    var defered = q.defer();
	    
	    
	        
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;

}
