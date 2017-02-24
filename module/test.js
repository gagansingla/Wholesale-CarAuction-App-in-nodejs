var  util    = require('util');     
var q = require('q');
var products = require('./products');
var common = require('./common');
var url = require('url');

exports.bid = function(row,req,res,arr)
{
	$arr.projects = row;
  //console.log($arr.projects);
    $arr.loged = req.session;
  common.tplFile('test.tpl');
  common.headerSet(1);
  common.loadTemplateHeader(req,res,arr);
};     


exports.projects = function(mysql,callback)
{
  //q.fcall(products.homeProducts(mysql)).then(products.homeProducts(mysql)).then(console.log(1));
  q.all([products.homeProducts(mysql,q),products.futureProducts(mysql,q)]).then(function(results){
  	     data1 = results[0][0];
  	     data2 = results[1][0];

         req_data1 = products.shortDescribe(data1);
         req_data2 = products.shortDescribe(data2);
         odata = [];
	       odata['open_project'] = req_data1;
	       odata['feature_project'] = req_data2;
	     //console.log(odata);
         callback(odata);
        // Hint : your third query would go here
    });  
};    
