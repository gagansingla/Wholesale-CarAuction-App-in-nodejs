{include file="common/header-1.tpl" nocache} 
<!--<div class="row">
<div class="col-md-2 left_col">
  <div class="white_box">
    <div class="whead">{$_phrase.welcome}</div>
    <div class="b_lbl">We Support below Types in our Release 1</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is Penny Auction?</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is  Peak Auction?</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reserve Bidding</div>
  </div>
  <div class="white_box">
    <div class="whead">Bidding Type</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Beginner</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Penny Auction</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Peak Auction</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reverse Auction</div>
  </div>
  <div class="reg_try"> <img src="{$config.url}/images/reg_try.png" alt="" /> </div>
</div>
<div class="col-md-10">
<div class="banner">
  <div class="bann_rht">
    <div class="rb_head">Own Your Penny Auction at Auction Software.com</div>
    <div class="rb_shead">Our penny auction product runs on NODE.JS</div>
    <div class="clearfix">
      <div class="pull-left"><img src="{$config.url}/images/node_js.png" alt="" /></div>
      <div class="pull-right"><img src="{$config.url}/images/buy_now.png" alt="" /></div>
    </div>
  </div>
</div>
<div class="today_auctions">
  <div class="clearfix">
    <div class="pull-left td_act">Recent Auctions</div>
    <div class="pull-right"><a href="{$config.url}/live" class="vall orng_txt">View All</a></div>
  </div>
  {assign var="proj" value=$projects.open_project}

  {include file="projects-new.tpl" nocache} </div>
  </div>
  </div>
<div class="node_jsb">
  <div class="pull-left njsb">
    <div class="pbld">Product build <span>via</span></div>
  </div>
  <div class="pull-left left_nj">
    <p>After detailed research we built in Node.Js.</p>
    <p>Problem</p>
    <p> 1. Bidding in Php delay in response from Server. As you grow to million of users server slown down in PHP
</p>
<p>Solution</p>
    <p>1. In Node.Js server responds back in milliseconds.</p>
    <p>2. Have you ever worked with real time events? If so, (Node.js penny auction by AuctionSoftware.com) is the best solution.</p>
    <p>3. What would you plan to use for storing real-time bidding while processing it server –> client and reverse (MySql or other database/storage)? We're talking about millisecond events here that can be accomplished only via Node.Js developed by AuctionSoftware.com.</p>
  </div>


</div>

<script> 

 function meee(id,dateee,price)
  {  

   clearInterval(clearvar[id]);
    clock[id] = document.getElementById('my'+id)
    , targetDate[id] = new Date(dateee); // Jan 1, 2050;
 
  clock[id].innerHTML = countdown(targetDate[id]).toString();
  document.getElementById('price'+id).innerHTML = price;
  clearvar[id] =  setInterval(function(){
	
	if(targetDate[id]>new Date())
    clock[id].innerHTML = countdown(targetDate[id]).toString();
	else
	clock[id].innerHTML = 'Closed';  
    }, 1000);
    
  }
     
     socket.on('bidAddtime', function(msg){   
     meee(msg.id,msg.date,msg.price);

     });

</script> -->

<section>
	<div class="container-fluid">
		<div class="row block_1">
			<div class="col-md-12 image_banner_1 no_pad">
				<img src="images/banner_1.png" alt="Banner 1" class="col-md-12 no_pad img-responsive"/>
		    </div>
		</div>
		<div class="row block_2">
			<div class="col-md-9 image_banner_2 no_pad float-center">
				<img src="images/banner_2.jpg" alt="Banner 2" class="col-md-12 no_pad img-responsive"/>
		    </div>
		</div>
		<div class="row block_3">
			<div class="col-md-12 image_banner_3 no_pad">
				<img src="images/banner_3.jpg" alt="Banner 3" class="col-md-12 no_pad img-responsive"/>
		    </div>
		</div>
		<div class="row block_4">
			<div class="col-md-12 text-center">
				<h1>How it works</h1>
			</div>
			<div class="col-md-12 no_pad">			     
            	<div class="bs-wizard" style="border-bottom:0;">
         
	                <div class="col-xs-2 bs-wizard-step complete">
	                  <div class="text-center bs-wizard-stepnum">Step 1</div>
	                  <div class="progress"><div class="progress-bar"></div></div>
	                  <a href="#" class="bs-wizard-dot"></a>
	                  <div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet, consectetur</div>
	                </div>
	                
	                <div class="col-xs-2 bs-wizard-step active"><!-- complete -->
	                  <div class="text-center bs-wizard-stepnum">Step 2</div>
	                  <div class="progress"><div class="progress-bar"></div></div>
	                  <a href="#" class="bs-wizard-dot"></a>
	                  <div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet, consectetur</div>
	                </div>
	                
	                <div class="col-xs-2 bs-wizard-step complete"><!-- complete -->
	                  <div class="text-center bs-wizard-stepnum">Step 3</div>
	                  <div class="progress"><div class="progress-bar"></div></div>
	                  <a href="#" class="bs-wizard-dot"></a>
	                  <div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet, consectetur</div>
	                </div>
	                
	                <div class="col-xs-2 bs-wizard-step complete"><!-- active -->
	                  <div class="text-center bs-wizard-stepnum">Step 4</div>
	                  <div class="progress"><div class="progress-bar"></div></div>
	                  <a href="#" class="bs-wizard-dot"></a>
	                  <div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet, consectetur</div>
	                </div>

	                <div class="col-xs-2 bs-wizard-step complete"><!-- active -->
	                  <div class="text-center bs-wizard-stepnum">Step 5</div>
	                  <div class="progress"><div class="progress-bar"></div></div>
	                  <a href="#" class="bs-wizard-dot"></a>
	                  <div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet, consectetur</div>
	                </div>

				</div>
		    </div>
		</div>

		 <div class="row block_5">
			<div class="col-md-12 text-center no_pad">
				<h1>Testimonials</h1>
				<h3>When you're happy with the number, close the deal! </h3>
			</div>
		</div>

		<div class="row block_6">
			<div class="carousel slide col-md-11 float-center" id="myCarousel" data-ride="carousel">
		
			      <div class="carousel-inner" role="listbox">
				   
			        <div class="item active">
			          <div class="container">
			            <div class="carousel-caption1 col-md-8">
						 <p><span> " </span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod dolor sit amet hendrerit malesuada. Maecenas porttitor pretium justo, a fringilla velit viverra quis<span> " </span> </p>
			            </div>
			            <div class="col-md-2">
			            	<img src="images/user_pic.png" alt="Banner 2" class="img-responsive"/>
						</div>

			          </div>
			        </div>
			        
			        <div class="item">
			          <div class="container">
			            <div class="carousel-caption1 col-md-8">
						 <p><span> " </span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod dolor sit amet hendrerit malesuada. Maecenas porttitor pretium justo, a fringilla velit viverra quis<span> " </span> </p>
			            </div>
			            <div class="col-md-2 user_image">
			            	<img src="images/user_pic.png" alt="Banner 2" class="img-responsive"/>
						</div>
			          </div>
			        </div>
					
			      </div>

			      <a data-slide="prev" href="#myCarousel" class="left carousel-control">
			    	<span class="left_coursel"></span>
			  	  </a>
				  <a data-slide="next" href="#myCarousel" class="right carousel-control">
				    <span class="left_coursel right_coursel"></span>
				  </a>

			</div>

		</div>

	</div>
</section>

<footer>
	<div class="container-fluid footer_block_1">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1>Have you questions?</h1>
				<h3>We will get back to your shortly! </h3>
			</div>
		</div>
		<div class="row button_block">
			<div class="col-md-4 float-center footer_buttons">
				<div class="call_now pull-left">Call Us Now</div>
				<div class="send_msg pull-left">Send a Message</div>
			</div>
		</div>
		<div class="row social_block">
			<div class="col-md-2 float-center social_buttons">
				<img src="images/fb_icon.png" alt="Facebook" class="img-responsive pull-left"/>
				<img src="images/twitter_icon.png" alt="Twitter" class="img-responsive pull-left"/>
				<img src="images/google_icon.png" alt="Google" class="img-responsive pull-left"/>
				<img src="images/blog_icon.png" alt="Blog" class="img-responsive pull-left"/>
			</div>
		</div>
	</div>
</footer>

{include file="common/footer-1.tpl" nocache}