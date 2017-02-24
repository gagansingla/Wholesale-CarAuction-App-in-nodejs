var  util    = require('util');
     
var q = require('q');
var mysqli = require('./mysqli');
var common = require('./common');
var url = require('url');
exports.userInfo = function(req,mysql,q,id,field)
{
  if(id == 0)
  {
    id = (typeof(req.session) !== 'undefined' )  ? req.session.userid : 0;
  }  
  if(field == '')
  {
    field = '*';
  } 
  
  $mysqli =  {};
  strQuery = mysqli.mysqli($mysqli,25); 
  var escape_data = [field,id];
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
  
}
exports.getTotalProduct = function(req,mysql,q,id)
{
  $mysqli =  {};
  strQuery = mysqli.mysqli($mysqli,206); 
  var dated = new Date();
  var y = dated.getFullYear();
  var m = dated.getMonth();
  var escape_data = [y,m,id];
  
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
}
exports.getTotalBid = function(req,mysql,q,id)
{
  $mysqli =  {};
  strQuery = mysqli.mysqli($mysqli,207); 
  var dated = new Date();
  console.log(dated);
  var y = dated.getFullYear();
  var m = dated.getMonth();
  var escape_data = [y,m,id];
  console.log(escape_data);
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
}