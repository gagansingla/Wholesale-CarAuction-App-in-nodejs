//installed js
var http = require('http');
var express = require('express');
var session = require('express-session');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var multer = require('multer');
    




//require runner
var app = express();
app.use(multer({dest: __dirname+"/uploads/"}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(cookieParser());
app.use(session({secret: '1234567890QWERTY', cookie:{maxAge:60000000}}));
app.use(express.static(path.join(__dirname, 'public')));

var index = require('./routes/index'),
    login = require('./routes/login'),
    register = require('./routes/register'),
    product = require('./routes/product'),
    packages = require('./routes/packages');
	  test = require('./routes/test'),
    dashboard = require('./routes/dashboard'),
	  profile_settings = require('./routes/profile_settings')
    admincp = require('./routes/admincp/index');

app.use('/',index);
app.use('/login',login);
app.use('/register',register);
app.use('/product',product);
app.use('/package',packages);
app.use('/dashboard',dashboard);
app.use('/test',test);
app.use('/profile_settings',profile_settings);
app.use('/admincp',admincp);
//$arr.categories = module.categories(config.mysql);

//index router









    


// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    console.log(err.message);
    next(err);
});


    

// error handlers

// development error handler
// will print stacktrace



module.exports = app;
var server = http.createServer(app);

server.listen(3030); 

// use socket.io
var io = require('socket.io').listen(server);
//turn off debug
io.set('log level', 1);
// define interactions with client
io.sockets.on('connection', function(socket){    //send data to client

    setInterval(function(){
        socket.emit('date', {'date':getDateTime()});
    }, 1000);
	
	
	
	socket.on('bidAddtime', function(msg){
		//console.log(msg);
     io.sockets.emit('bidAddtime',  msg);
	 //console.log('#my'+msg);
	 });
   
});

function getDateTime() {
  var date = new Date();
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  var sec  = date.getSeconds();
  sec = (sec < 10 ? "0" : "") + sec;
  var strTime = hours + ':' + minutes + ':' +sec+ ' ' + ampm;
  return strTime;
}

