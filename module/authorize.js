var Authorize = require('auth-net-types')
  , _AuthorizeCIM = require('auth-net-cim')
  , AuthorizeCIM = new _AuthorizeCIM({
    api: global.card.authorizeapi,
    key: global.card.authorizekey,
    sandbox: (global.card.authorizesandbox == 'yes') ? true : false // false
  });
exports.doAuthorizePayment = function(self,callback)
{  
	console.log(self);
  var transaction = {
          amount: self.amount,
           tax: {
            amount: 0,
            name: '',
            description: ''
          },
          shipping:  {
            amount: 0,
            name: '',
            description: ''
          },
          duty: {
            amount: 0,
            name: '',
            description: ''
          },
          lineItems: {
          	itemId : self.payid,
          	name : self.name,
          	description:self.name,
          	quantity:1,
          	unitPrice:self.amount,
          	taxable:false
          },
          customerProfileId: self.customerid,
          customerPaymentProfileId: self.paymentid          
        };

        AuthorizeCIM.createCustomerProfileTransaction('AuthCapture', transaction, function(err, res) {
        	if(typeof(err) === 'undefined' || err === null)
          {          	 
             self.transactionid = 0
             callback();
          }
          else
          {
         	self.errorTrigger(err);
          }
        });
 }
exports.createCustomerPayment = function(results,req,uid,self)
{
 AuthorizeCIM.getCustomerProfile(uid, 
  	function(err, response) {
  		payment = false;
  		payment1 = false;
  		//console.log(response+'response-'+18);
  		//console.log(err+'error-'+19);
  		if(typeof(err) === 'undefined' || err === null)
  		{
  			payment = true;
  		    
  		}
  		else
  		{
         console.log(err);
  		   if(err.code == 'E0040' || err.code == 'E00040')
  		   {
            payment1 = true;
              
  		   }
  		   else
  		   {	
            page = '';
  			    self.errorTrigger(err.message,page,req);
  		  }
  		}
  		if(payment1)
  		{
  			//console.log('phase1');

                                       
                                   AuthorizeCIM.createCustomerProfile({customerProfile: {
                                                                        description: 'A simple test profile',
                                                                        email: results.email,
                                                                        customerProfileId:uid
                                                                        }}, function(err, resp) {
                                                                          console.log(err);
                                                                            if(typeof(err) === 'undefined' || err === null)
                                                                                 {  
                                                                                  
                                                                                  //console.log(resp);
                                                                                    self.customerid = resp.customerProfileId;
                                                                                      var options = {
                                                                                        customerType: 'individual',
                                                                                        
                                                                                        payment: {
                                                                                          creditCard: {
                                                                                             cardNumber: req.param('creditCardNumber'),
                                                                                             expirationDate: req.param('expDateYear')+'-'+req.param('expDateMonth')
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                 
                                                                                 //console.log(options);
                                                                                   AuthorizeCIM.createCustomerPaymentProfile({
                                                                                   customerProfileId: self.customerid,
                                                                                   paymentProfile: options
                                                                                  }, function(err, response) {
                                                                                    console.log(err);
                                                                                      if(typeof(err) === 'undefined' || err === null)
                                                                                      {                

                                                                                        self.paymentid = response.customerPaymentProfileId;
                                                                                        self.executeUserData(results.id,self.doPayment);
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        self.errorTrigger(err);
                                                                                      }
                                                                                  });
                                                                             }
                                                                             else
                                                                             {
                                                                                self.errorTrigger(err);
                                                                             } 
                                                                    
                                                                   });  
                              
                            
                  
  		        
                  
						
					
  		       
  		}
  		else if(payment)
  		{
  			           //console.log(req.param('creditCardNumber')+'-'+req.param('expDateYear')+'-'+req.param('expDateMonth'));
                   var options = {
                      					  customerType: 'individual',
                                            customerPaymentProfileId: self.paymentid,
                      					  payment: {
                      					    creditCard: {
                      					        cardNumber: req.param('creditCardNumber'),
                                        expirationDate: req.param('expDateYear')+'-'+req.param('expDateMonth')
                      					    }
                      					  }
                      					}
              //console.log(options);
					    AuthorizeCIM.updateCustomerPaymentProfile({
							  customerProfileId: self.customerid,
							  paymentProfile: options
							}, function(err, response) {
								             if(typeof(err) === 'undefined' || err === null)
					  		             {		             	
					  		             	self.executeUserData(results.id,self.doPayment);
					  		             }
					  		             else
					  		             {
					  		             	self.errorTrigger(err);
					  		             }
					  		         });
  		  }	
  		
  	});
}