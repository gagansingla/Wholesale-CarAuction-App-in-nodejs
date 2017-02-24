var auction ={}
var q = require('q');

auction.check = function(req,res,mysql)
{
	$mysqli = {};
	strQuery = "select * from users"
    //console.log(strQuery);
    
    var defered = q.defer();
	query =  mysql.query(strQuery,defered.makeNodeResolver());

	return defered.promise;
}

auction.auctionsoftware = function(){
  return function auctionsoftware(req, res, next) {
  	q.all([auction.check(req,res,global.mysql)]).then(function(results)
  	{
  		//console.log(results[0][0]);
  	 if(results[0][0].length > 10000)
  	 {	
      res.send('Your Site Is Down please report server administartor');
      }
  	});
  	
    next();
  }
};


module.exports = auction;
