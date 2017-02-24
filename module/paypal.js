var ipn = require('paypal-ipn');
var q = require('q');
exports.paymentPaypal = function(params,req,mysql,res)
{  
	ipn.verify(params,{'allow_sandbox': (global.paypal.sandbox == 'yes') ? true : false}, function callback(err, msg) {
		console.log(params);
	  if (err) {
	    console.error(err);
	  } else {
	    // Do stuff with original params here
	     console.error('Hi');
	    if (params.payment_status == 'Completed' || params.payment_status == 'Pending') {
	    	console.log('WoW!');
	    	var s = params.custom;
	    	var split = s.split('|');
	    	var payment = require('./payment');
            var user = require('./user');
            var packages = require('./packages');
	        q.all(user.userInfo(req,mysql,q,split[1],['email','id','first_name','last_name'])).then(function(results)
	        {
	        	 q.all(packages.getPackageInfo(req,mysql,q,split[2])).then(function(result)
	        	 { 
	        	 	q.all(payment.getInvoice(mysql,q,params.txn_id)).then(function(txn)
	        	    {
	        	    	console.log(txn);
	        	       if(txn[0].length > 0)
	        	       {
	        	       	res.writeHead(200);
	                     res.end("hello world\n");
	        	       }	
				       console.log(result[0][0]); 
				       payment.amount = result[0][0]['price'];
				       payment.payid = result[0][0]['id'];
				       payment.name = result[0][0]['name'];
				       payment.point = result[0][0]['points'];
		                  //payment = require('./payment');
		                  if(split[0] == 'package')
		                  {
		                  	payment.type = 'package';
		                  }
		                 results[0][0]['userid'] = results[0][0]['id'];
		                 payment.req = []; 
	                     payment.sessionsdata =  payment.req.session =  results[0][0];
	                     payment.gateway = 'paypal';
	                     payment.transactionid = params.txn_id;
	                     payment.increaseBalance();
	                     res.writeHead(200);
	                     res.end("hello world\n");
	                 });
	            });

	        });
	    	

	      // Payment has been confirmed as completed
	    }
	    else
	    {
	    	res.writeHead(200);
            res.end("hello world\n");
	    }	
	  }
	});
}
