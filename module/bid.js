
var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
exports.mybids = function(req,mysql,q)
{
        $mysqli =  {};
        var page = req.body.page;
        page = (page > 0) ? (page-1)*10 : 0;	   
	    
		strQuery = mysqli.mysqli($mysqli,37);	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.session.userid,page];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.makeBought = function(req,mysql,q,bprice)
{
        $mysqli =  {};
        var id = req.param('id');
        
	    
		strQuery = mysqli.mysqli($mysqli,83);	    
	    var defered = q.defer();
	    datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
	    var escape_data =  [id,req.session.userid,bprice,datge];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.reduceBalance = function(req,mysql,q,bprice)
{
        $mysqli =  {};
        var id = req.param('id');
        
	    
		strQuery = mysqli.mysqli($mysqli,84);	    
	    var defered = q.defer();
	    datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
	    var escape_data =  [bprice,req.session.userid];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.totalmybids = function(req,mysql,q)
{
        $mysqli =  {};
        page = req.body.page;
		strQuery = mysqli.mysqli($mysqli,38); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.session.userid];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.mywonauctions = function(req,mysql,q)
{
        $mysqli =  {};
        var page =  req.body.page;
        page = (page > 0) ? (page-1)*10 : 0;
		strQuery = mysqli.mysqli($mysqli,39); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.session.userid,page];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.totalmywonauctions = function(req,mysql,q)
{
        $mysqli =  {};
        page = req.body.page;
		strQuery = mysqli.mysqli($mysqli,40); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.session.userid];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.placeBid = function(req,mysql,q,reserve)
{
  
    
	datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
    $mysqli =  {};
    var defered = q.defer();
    if(reserve)
    {
    	strQuery = mysqli.mysqli($mysqli,45); 
    
        
    
        var escape_data =  [req.body.id,
	                       (typeof(req.session.userid) !== 'undefined' )  ? req.session.userid : '0',
	                       datge,
	                       req.body.wsprice,
	                       datge
	                       ]  
    }	
    else
    {
    	strQuery = mysqli.mysqli($mysqli,20); 
    
        
    
        var escape_data =  [req.body.id,
	                       (typeof(req.session.userid) !== 'undefined' )  ? req.session.userid : '0',
	                       datge,
	                       req.body.wsprice
	                       ]  
    }	
    	
   
                                    
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

    
    return defered.promise;
}

exports.updateBid = function(req,mysql,q)
{
	
		var totalSec = global.general.bidincreaseseconds;
		var hours = parseInt( totalSec / 3600 ) % 24;
		var minutes = parseInt( totalSec / 60 ) % 60;
		var seconds = totalSec % 60;
        
        var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);
		$mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,21); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.body.wsprice,result,req.body.id]
	    //console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
	
}

exports.reduceReserve = function(req,mysql,q)
{
	    delete payments;
		payments = require('./payment');
        payments.type = 'declined';

        payments.amount = req.body.amt;
        payments.sessionsdata = {};
        payments.sessionsdata = req.session;
        payments.transactionid = 0;
        payments.gateway = 'account';
        payments.sessionsdata = {};
        payments.sessionsdata.userid = req.body.buid;
        payments.payid = req.body.id;
        payments.name = 'Decline holded amount for '+req.body.title;
        
        payments.insertInvoice();

		$mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,47); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.body.amt,req.body.buid]
	    //console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());




		return defered.promise;
	
	
}
exports.removeBidReserve = function(req,mysql,q)
{
	
		
		$mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,68); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.body.bid]
	    //console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
	
	
}
exports.releaseAmount = function(req,mysql,q,bid,pid)
{
	     $mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,48); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [bid.proposed_amount,bid.proposed_amount,bid.user_id]
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.addAmount = function(req,mysql,q,bid,pid)
{
	     $mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,28); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [bid.proposed_amount,pid.id]
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.addReserve = function(req,mysql,q)
{
	
	    delete payments;
		payments = require('./payment');
        payments.type = 'holded';
        payments.amount = req.body.wssprice;
        payments.sessionsdata = req.session;
        payments.payid = req.body.id;
        payments.name = 'Holded amount for '+req.body.title;
        //console.log(payments);
        payments.insertInvoice(); 
		$mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,44); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.body.wssprice,req.session.userid]
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		
		return defered.promise;
	
	
}
exports.selectAwardBid = function(req,mysql,q)
{
        $mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,32); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.param('id')];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}

exports.makeAwardBid = function(req,mysql,q,id)
{
        $mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,35); 
	    
	    var defered = q.defer();
	    var dateFormat = require('dateformat');
        //var date = require('date-utils');
        datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
	    var escape_data =  [datenow,id]
	    //console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.addBidInvoice = function(req,mysql,q)
{
	    delete payments;
	    var payments = require('./payment');
	        payments.transactionid = 0;
            payments.gateway = 'account';
            payments.sessionsdata = {};
            payments.sessionsdata.title = req.body.title;
            payments.sessionsdata.email = req.session.email;
            payments.sessionsdata.userid = req.session.userid;
            payments.sessionsdata.first_name = req.session.first_name;
            payments.sessionsdata.last_name = req.session.last_name;
            payments.payid = req.body.placebid;
            payments.type = 'bid';
            payments.name = req.body.title;
            payments.amount = req.body.placeamt;
            payments.insertInvoice();
}
exports.reducePoint = function(req,mysql,q)
{

		
	    
	    this.addBidInvoice(req,mysql,q);
	    $mysqli =  {};
        var escape_data =  [global.general.eachbidpay,req.session.userid]
	    console.log(escape_data);
		strQuery = mysqli.mysqli($mysqli,30); 
		var defered = q.defer();
	    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	    console.log(2);
	    return defered.promise;             
		
}
exports.bidHistory = function(req,mysql,q,id)
{

        $mysqli =  {};
        sql = 24;
        if(id == 1)
        {
           sql = 33;
        }	
        var escape_data =  [req.param('id')]
	   
		strQuery = mysqli.mysqli($mysqli,sql); 
	    
	    var defered = q.defer();
	    
	                 
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.checkbidPlaced = function(req,mysql,q)
{
	    $mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,22); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.body.id,req.session.userid]
	    //console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
	
}
exports.maxcheckbidPlaced = function(req,mysql,q)
{
	    $mysqli =  {};
		strQuery = mysqli.mysqli($mysqli,46); 
	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.body.id]
	    //console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
	
}