var fs = require('fs');
var configure =  require('../configure');
config = configure.app();
exports.save = function(obj,req,res)
{  
     

    /*var isupload = false;
       
	if(obj == 'product' && typeof(req.files.product_image) !== 'undefined')
	{	
	 
	 var file = req.files.product_image;	
	 var path = config.path+'/uploads/'+file.name;
	 var dest = config.path+'/uploads/product/'+file.name;
	 var isupload = true;     
    }
	file = '';
	if(typeof(req.files.product_image) !== 'undefined')
	{
	 var file = req.files.product_image;
	}
	if(typeof(req.files.profile_image) !== 'undefined')
	{
	 var file = req.files.profile_image;
	}	
	if(typeof(req.files.blog_image) !== 'undefined')
	{
	 var file = req.files.blog_image;
	}
	if(file != '')
	{	
		 var path = config.path+'/uploads/'+file.name;
		 var dest = config.path+'/public/uploads/'+obj+'/'+file.name;
		 var isupload = true; 
	    if(isupload)
	    {
	    	fs.rename(path,dest, function(err){
	   
		    });
	    }
	}*/
	 
    
	
}
