<!DOCTYPE html>
<!--[if IE 8]> <html class="no-js lt-ie9 ie8" lang="en"> <![endif]-->
<!--[if IE 9]> <html class="ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<!-- Metas
	================================================== -->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, target-densitydpi=device-dpi"/>
	<meta name="description" content="telecom training" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	
	<!-- Page Title 
	================================================== -->
	<title>{$config.title} </title>
	
	<!-- Favicon 
	================================================== -->
	<link rel="shortcut icon" href="">
	
    <!-- Google fonts
	================================================== -->
	
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,600,700,800,300' rel='stylesheet' type='text/css' />
	
	<!-- bootstrap v3.0.2
	================================================== -->

	<link rel="stylesheet" href="{$config['externalcss']}bootstrap.css">
	
	<!--font-awesome
	================================================== -->
	<link rel="stylesheet" href="{$config['externalcss']}font-awesome.css">
	
	
	<!-- CSS Custom
	================================================== -->    
	<link rel="stylesheet" type="text/css" href="{$config['externalcss']}reset-min.css" />
	<link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny_auction.css" />
		<link rel="stylesheet" type="text/css" href="{$config['externalcss']}registration-form.css" />
	<link rel="stylesheet" type="text/css" href="{$config['externalcss']}ds-forms.css" />
	<script src="{$config.url}/socket.io/socket.io.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script>
var socket = io.connect();
</script>
	{foreach $external2css as $key => $val}
 <link rel="stylesheet" href="{$config['externalcss']}{$val}.css" type="text/css" />
{/foreach}
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
  <body>
     <header class="pa_header">
	   <div class="nav pa_nav">
	     <div class="logo"> <img src="{$config.url}/images/logo.png" class="img-responsive" alt="Auction Software" /></div>
		 <div class="logo"> <img src="{$config.url}/images/penny_auction.png" class="img-responsive" alt="Auction Software" /></div>
		  <div class="section">
		  <div class="nbtn-group">
			<span>Welcome! </span>
			{if $loged.userid > 0}
			  <span><a href="{$config.url}/product/my" title="{$loged.first_name}">{$loged.first_name}</a> |</span>
			  <span><a href="{$config.url}/login/logout/" title="Logout">Logout</a></span>
            {else}
			<span><a data-toggle="modal" data-target="#myModal" href="javascript:void(0);">Register |</a></span>
		   <span> <a data-toggle="modal"  data-target="#login" href="javascript:void(0);">Sign In</a></span>
		   {/if}
				 
				
				</div>
         </div><!-- end section --> 
	   </div>
	   <div class="nav nav-bar">
			<ul class="menu_bar">
				  <li class="{if $pageofjs == '' or $pageofjs == '/'}active{/if}"><a href="{$config.url}" title="Home"> Home</a></li>
			      <li class="{if $pageofjs == '/live'}active{/if}"><a href="{$config.url}/live" title="Live Auctions"> Live Auctions</a></li>
			      <li class="{if $pageofjs == '/future'}active{/if}"><a href="{$config.url}/future" title="Future Auctions"> Future Auctions </a></li>
			      <li class="{if $pageofjs == '/closed'}active{/if}"><a href="{$config.url}/closed" title="Closed Auctions"> Closed Auctions</a></li>
			      <li class="{if $pageofjs == '/shop'}active{/if}"><a href="{$config.url}/shop" title="Shop Now"> Shop Now</a></li>
			      <li class="{if $pageofjs == '/winner'}active{/if}"><a href="{$config.url}/winner" title="Winners"> Winners</a></li>
			      <li  class="{if $pageofjs == '/blog'}active{/if}"><a href="{$config.url}/blog" title="Blogs">Blogs</a></li>
			      <li  class="{if $pageofjs == '/package'}active{/if}"><a href="{$config.url}/package" title="Buy Packages"> Deposit</a></li>
			</ul>
	   </div>
	   <div class="category_box">
	     <div class="cin_box">
			<div class="dropdown pull-left">
				  <button class="btn btn-default category_sb dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					All Categories
					<span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu blue_box " role="menu" aria-labelledby="dropdownMenu1">
				   {foreach $category as $key => $val}	
					<li><a role="menuitem" tabindex="-1" href="#">{$val.name}<i class="fa fa-caret-right"></i></a></li>
				   {/foreach} 
				  </ul>
			</div>
			<label class="pull-left search_lbl">Search</label>
			<div class="input-group em_search pull-left;">
			
                        <select class="input-group-addon btn selc mdropdown" name="cid" id="cid_search" onchange="searchProject();">
          <option value="0"> All Categories</option>
          {foreach $category as $key => $val}
          <option value="{$val.id}" {if $cid_search == $val.id} selected {/if}>{$val.name}</option>
          {/foreach}
        
                        </select>
                    <!-- /btn-group -->
                    <form action="" id="user_search" name="user_search" method="post"  enctype="multipart/form-data">
                    <input type="text" class="form-control selip" value="{$search_search}"  name="search" id="search" maxlength="300">
                     <input type="hidden" value="{$ptitle}" name="page" />
                    <span class="input-group-addon setting">
                        <i class="fa fa-cog"></i>
                    </span>
                    <span class="input-group-addon btn btn-primary" onclick="searchProject();">
                        <i class="fa fa-search"></i>
                    </span>
                </form>
                </div>
		</div>
	   </div>
	 </header>
	<div class="main_container">