var  util    = require('util');
var dateFormat = require('dateformat');     
var q = require('q');
var mysqli = require('./mysqli');
var common = require('./common');
var url = require('url');
exports.reviewAdd = function(req,mysql,q)
{
  
  
  $mysqli =  {};
  strQuery = mysqli.mysqli($mysqli,91); 
  var escape_data = [req.session.userid,dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss"),req.body.subject,req.body.message,req.body.rating,0];
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
  
}

