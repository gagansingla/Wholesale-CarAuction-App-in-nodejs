var stripe = require('stripe-api')(global.card.stripekey);
var self = require('./payment');
var stripes = require('./stripe');
exports.createCustomerPayment =  function(results,req,uid,self)
{
  //console.log(req);
  stripe.customers.retrieve(uid, 
    function(err, response) {
      payment = false;
      payment1 = false;
      console.log(JSON.stringify(response));
      console.log(JSON.stringify(err));
      if(typeof(err) === 'undefined' || err === null)
      {
        payment = true;
          
      }
      else
      {
         
         if(err.error.message == 'No such customer: '+uid)
         {
            payment1 = true;
              
         }
         else
         {  
            page = '';
            self.errorTrigger(err.error.message,'');
        }
      }
      if(payment1)
      {
        //console.log('phase1');
              
            stripes.addCustomer(results,req);
                  
            
          
             
      }
      else if(payment)
      {
                   //console.log(as);
                   stripes.addCard(results,req);

        }               

      
    });
   
}
exports.addCustomer = function(results,req)
{
   
    stripe.customers.create(
                  {
                            description: 'A simple test profile',
                            id: uid,
                            email: results.email
                           
                  },
                  function(err, resp) {
                   //JSON.stringify(err);
                   console.log(JSON.stringify(resp));
                   console.log(JSON.stringify(err));
                      if(typeof(err) === 'undefined' || err === null)
                           {  
                              //console.log('phase3');
                            //console.log(resp);
                            self.customerid = resp.id;
                            stripes.addCard(results,req);

                       }
                       else
                       {
                          self.errorTrigger(err.error.message,'');
                       } 
          });

}

exports.doStripePayment = function(selfes,callback)
{
       common = require('./common');
       k = self.amount;
       //console.log(common.currencyConverter(k.replace('.','')));
       stripe.charges.create({
          amount: common.currencyConverter(k).replace('.',''),
          currency: "usd",
          customer: self.customerid, // obtained with Stripe.js
          description: self.name
        }, function(err, charge) {
             console.log(JSON.stringify(charge));
             console.log(JSON.stringify(err));
             if(typeof(err) === 'undefined' || err === null)
                {            
                   self.transactionid = charge.id;
                   callback();
                }
                else
                {
                   self.errorTrigger(err.error.message);
                }
       });
    
}

exports.addCard = function(results,req)
{
  //console.log(req);
   stripe.tokens.create({
                          card:{
                            "number": req.body.creditCardNumber,
                            "cvc": req.body.cvv2Number,
                            "exp_month": (req.body.expDateMonth > 10) ? req.body.expDateMonth : req.body.expDateMonth.replace('0',''),
                            "exp_year":req.body.expDateYear.replace('20','')
                          }
                        }, 
                        function(err,tkn)
                        {
                            //JSON.stringify(err);
                            console.log(JSON.stringify(tkn));
                            console.log(JSON.stringify(err));
                            if(typeof(err) === 'undefined' || err === null)
                            {
                              self.paymentid = tkn.id;
                               stripe.cards.create(
                                      self.customerid,
                                      {card: tkn.id},
                                      function(err, card) {
                                         if(typeof(err) === 'undefined' || err === null)
                                         {
                                              
                                              //console.log(self);
                                              self.executeUserData(results.id,self.doPayment);
                                         }
                                         else
                                         {
                                              self.errorTrigger(err.error.message,'');
                                         } 
                                      }
                                    );
                            }
                            else
                            {
                                self.errorTrigger(err.error.message,'');
                            }  
                         
                        }); 
}

