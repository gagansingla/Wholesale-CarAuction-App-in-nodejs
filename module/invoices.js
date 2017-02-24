var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
exports.mytransactions = function(req,mysql,q)
{
    $mysqli = {};
	strQuery = mysqli.mysqli($mysqli,41); 
    //console.log(strQuery);
    var defered = q.defer();
     var page =  req.body.page;
        page = (page > 0) ? (page-1)*10 : 0;
    var escape_data = [req.session.userid,page];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
    console.log(escape_data);
	return defered.promise;
};
exports.totalmytransactions = function(req,mysql,q)
{
    $mysqli = {};
	strQuery = mysqli.mysqli($mysqli,42); 
    //console.log(strQuery);
    var defered = q.defer();
    var escape_data = [req.session.userid];
	query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

	return defered.promise;
};
exports.viewTransactions = function(req,mysql,q)
{
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli,43);
    var defered = q.defer();
    var escape_data = [req.session.userid];
    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
}