
var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
exports.mywithdraw = function(req,mysql,q)
{
        $mysqli =  {};
       
		strQuery = mysqli.mysqli($mysqli,170);	    
	    var defered = q.defer();
	    
	    var escape_data =  [req.session.userid];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}
exports.addWithdraw = function(req,mysql,q)
{
        $mysqli =  {};
       
		strQuery = mysqli.mysqli($mysqli,171);	    
	    var defered = q.defer();
	    
	    datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
	    var escape_data =  [req.session.userid,req.body.amount,datge,req.body.paydetails,req.body.paymethod];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}

