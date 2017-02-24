var  util    = require('util');
     
var q = require('q');
var products = require('./products');
var common = require('./common');
var mysqli = require('./mysqli');
var url = require('url');
exports.blog = function(req,mysql)
{

     req.body.search = (typeof(req.param('search')) !== 'undefined') ? req.param('search') : '';
     $mysqli =  {'search':req.body.search};
     strQuery = mysqli.mysqli($mysqli,151);
     page = 0
    
     var escape_data =  [page]; 
     
     var defered = q.defer();
      
      
          
    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
    
    return defered.promise;
}
exports.recentblog = function(req,mysql)
{


     $mysqli =  {};
     strQuery = mysqli.mysqli($mysqli,167);
     page = 0
     var escape_data =  []; 
     
     var defered = q.defer();
      
      
          
    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
    
    return defered.promise;
}
exports.showblog = function(req,mysql)
{
  

     $mysqli =  {};
     strQuery = mysqli.mysqli($mysqli,97);
     
     var escape_data =  [req.body.id]; 
     
     var defered = q.defer();
      
      
          
    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
    return defered.promise;
}