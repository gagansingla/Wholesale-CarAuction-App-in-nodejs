app.post('/login/save', function(req,res)
{
  var login = require('./module/login');
  function processObject(row)
  {
    //console.log(row);
    if(row.length > 0)
    {
      req.session.email = row[0].email;
      req.session.userid = row[0].id;
      $arr.session = req.session;
      console.log(req.session);
      //app.use(session({user: row}));
      //$arr.session = req.session.get(row);
      login.saved(req,res,$arr);
    }  
    else
    {
      login.login(req,res,$arr);
    }  
  } 
  var userprocess = login.process(req,config.mysql,processObject);  
  
 
});


//login router
app.get('/login', function(req,res)
{
   var login = require('./module/login');
   login.login(req,res,$arr);

});