var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
var self = require('./payment');
var q = require('q');

var dateFormat = require('dateformat');
var configure = require('../configure');
var sessionsdata = [];
//default setters
var config = configure.app();
var customerid = 0;
var paymentprofileid = 0;
var transactionid = 0;
var gateway = 'authorize';
var amount = 0.00;
var payid = 0;
var name = '';
var point = 0;
var req ='';
var res = '';
var type = '';
exports.increaseBalance = function()
{
      q.all([self.updateBalance(self.req.session.userid),self.insertInvoice()]).then(function(results){ 
              
              self.res.writeHead(302, {
               'Location':  (typeof(self.req.session.page) === 'undefined') ?  '/product/my' : self.req.session.page
              });
              self.res.end();return false;
        });
}
exports.executeUserData = function(result,callback)
{
	q.all(this.setupPayment(result)).then(function(results){ 
        callback(result);
	});
}
exports.doPayment = function(result)
{  //console.log(self.gateway);
   
    
    if(self.gateway == 'authorize')
    {  
     authorize = require('./authorize');
     authorize.doAuthorizePayment(self,self.increaseBalance);
    }
    else
    {
     stripe = require('./stripe');
     stripe.doStripePayment(self,self.increaseBalance);
    } 

}
exports.insertInvoice = function()
{
  $mysqli =  {};
  mysql = config.mysql; 
  strQuery = mysqli.mysqli($mysqli,31); 
  status = 'debit';
  //console.log(status);
  //console.log(self);
  if(self.type == 'sold')
  {
     status = 'credit';
  }  
  if(self.type == 'holded' || self.type == 'declined')
  {
     status = self.type;
  }
  if(self.type == 'winner' || self.type == 'bought')
  {
    
    customerio = require('./customerio');
    //console.log(self.sessionsdata);
    customerio.uid = self.sessionsdata.userid;
    customerio.inits();
     
    customerio.createCustomer({email:self.sessionsdata.email,user:{firstName:self.sessionsdata.first_name,lastName:self.sessionsdata.last_name}});
    
    customerio.sendEmail({event:'won_product',content:{user:self.sessionsdata.first_name+' '+self.sessionsdata.last_name,price: self.amount,title: self.sessionsdata.title,url:self.sessionsdata.url}});
  }

  if(self.type == 'sold')
  {
    customerio = require('./customerio');
  
    customerio.uid = self.sessionsdata.userid;
    customerio.inits();
     
    customerio.createCustomer({email:self.sessionsdata.email,user:{firstName:self.sessionsdata.first_name,lastName:self.sessionsdata.last_name}});
    
    customerio.sendEmail({event:'item_sold',content:{user:self.sessionsdata.first_name+' '+self.sessionsdata.last_name,price: self.amount,title: self.sessionsdata.title,url:self.sessionsdata.url}});
  }
  if(self.type == 'package')
  {
  customerio = require('./customerio');
  
  customerio.uid = self.sessionsdata.userid;
  customerio.inits();
   
  customerio.createCustomer({email:self.sessionsdata.email,user:{firstName:self.sessionsdata.first_name,lastName:self.sessionsdata.last_name}});
  
  customerio.sendEmail({event:'package_bought',content:{user:self.sessionsdata.first_name+' '+self.sessionsdata.last_name,price: self.amount}});
  }
  
  var escape_data = [self.transactionid,self.gateway,dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss"),self.sessionsdata.userid,self.payid,self.type,self.name,self.amount,'paid',status];
  console.log(escape_data);

  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
}
exports.updateBalance= function(result)
{
	$mysqli =  {};
  mysql = config.mysql;	
  strQuery = mysqli.mysqli($mysqli,28); 
  var escape_data = [self.amount,result];
  ////console.log(escape_data);
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
}
exports.setupPayment= function(result)
{
	$mysqli =  {};
  mysql = config.mysql;	
  strQuery = mysqli.mysqli($mysqli,27); 
  ////console.log(result);
  var escape_data = [self.customerid,self.paymentid,self.gateway,result];
  //console.log(escape_data);
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
}
exports.payAuthorize = function(req,results)
{
	  self.sessionsdata = req.session;
    self.gateway =  req.body.payment;
    if(results.payAuthorize == self.gateway)
    {
      this.customerid = (results.customerid == '' || results.customerid == 0) ? results.id : results.customerid;
      this.paymentid = (results.paymentid == ''  || results.customerid == 0) ? 0 : results.paymentid;
    }
    else
    {
      this.customerid = results.id;
      this.paymentid = 0;
    }  
  	
   
    uid = this.customerid;
    if(self.gateway == 'authorize')
    {  
     authorize = require('./authorize');
     authorize.createCustomerPayment(results,req,uid,self);
    }
    else
    {
     stripe = require('./stripe');
     stripe.createCustomerPayment(results,req,uid,self);
    } 
  
 
}
exports.getInvoice = function(mysql,q,id)
{
  $mysqli =  {};
  mysql = config.mysql; 
  strQuery = mysqli.mysqli($mysqli,58); 
  var escape_data = [id];
  //console.log(escape_data);

  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
  //console.log(1);
  return defered.promise;
}
exports.errorTrigger = function(error,page)
{
  self.res.writeHead(302, {
	             'Location': '/package/buy/'+self.payid+'/'+encodeURIComponent(error)
	            });
	            self.res.end();return false;
}
