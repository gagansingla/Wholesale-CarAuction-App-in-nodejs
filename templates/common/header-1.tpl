<!DOCTYPE html>
<!--[if IE 8]> <html class="no-js lt-ie9 ie8" lang="en"> <![endif]-->
<!--[if IE 9]> <html class="ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
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
<title>{$config.title}</title>

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
  <link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}reset-min.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny_auction.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}dashboard.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}registration-form.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}ds-forms.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}wholesale.css" />
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


<!--<header class="pa_header">
  <div class="nav pa_nav">
    <div class="logo"> <a href="{$config.url}"><img src="{$config.url}/images/logo.png" class="img-responsive" alt="Auction Software" /></a></div>
    <div class="logo"> <img src="{$config.url}/images/penny_auction.png" class="img-responsive" alt="Auction Software" /></div>
    <div class="section">
      <div class="nbtn-group"> <span>{$_phrase.welcome}! </span> {if $loged.userid > 0} <span><a href="{$config.url}/dashboard/" title="{$loged.first_name}">{$loged.first_name}</a> |</span> <span><a href="{$config.url}/login/logout/" title="Logout">Logout</a></span> {else} <span><a data-toggle="modal" data-target="#myModal" href="javascript:void(0);">{$_phrase.register} |</a></span> <span> <a data-toggle="modal"  data-target="#login" href="javascript:void(0);">{$_phrase.log_in}</a></span> {/if}{if $loged.userid > 0}<h4 style="font-size:11px;margin-top:40px;color:#666;"> Available Balance : <span class="orange" style="font-size:11px;">${$userbalance.ledger}</span> &nbsp; Ledger Balance : <span class="orange" style="font-size:11px;">${$userbalance.balance}</span> </h4>{/if} </div>

    </div>
  
  </div>
  <div class="nav nav-bar">
    <ul class="menu_bar">
      {if $loged.userid > 0 and $pageofjs != '' and $pageofjs != '/'}
      <li class="{if $pageofjs == '/dashboard/'}active{/if}"><a href="{$config.url}/dashboard/" title="Home"> {$_phrase.dashboard}</a></li>
      {else}
      <li class="{if $pageofjs == '' or $pageofjs == '/'}active{/if}"><a href="{$config.url}" title="Home"> {$_phrase.home}</a></li>
      {/if}
      <li class="{if $pageofjs == '/live'}active{/if}"><a href="{$config.url}/live" title="Live Auctions"> {$_phrase.live} {$_phrase.auction}{$_phrase.s}</a></li>
      <li class="{if $pageofjs == '/future'}active{/if}"><a href="{$config.url}/future" title="Future Auctions"> {$_phrase.future} {$_phrase.auction}{$_phrase.s} </a></li>
      <li class="{if $pageofjs == '/closed'}active{/if}"><a href="{$config.url}/closed" title="Closed Auctions"> {$_phrase.closed} {$_phrase.auction}{$_phrase.s}</a></li>
      <li class="{if $pageofjs == '/shop'}active{/if}"><a href="{$config.url}/shop" title="Shop Now"> {$_phrase.buy_now}</a></li>
      <li class="{if $pageofjs == '/winner'}active{/if}"><a href="{$config.url}/winner" title="Winners"> {$_phrase.winner}{$_phrase.s}</a></li>
      <li  class="{if $pageofjs == '/blog'}active{/if}"><a href="{$config.url}/blog" title="Blogs">{$_phrase.blog}{$_phrase.s}</a></li>
      <li  class="{if $pageofjs == '/package'}active{/if}"><a href="{$config.url}/package" title="Buy Packages"> {$_phrase.deposit}</a></li>
    </ul>
  </div>
  <div class="category_box">
    <div class="cin_box">
      <div class="dropdown pull-left">
        <button class="btn btn-default category_sb dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"> {$_phrase.all_categories} <span class="caret"></span> </button>
        <ul class="dropdown-menu blue_box " role="menu" aria-labelledby="dropdownMenu1" >
          {foreach $category as $key => $val}
          <li><a role="menuitem" tabindex="-1" href="{$config.url}/search?cid={$val.id}&search=&page=live">{for $foo=1 to {$val.depth}} -- {/for}{$val.name}<i class="fa fa-caret-right"></i></a></li>
          {/foreach}
        </ul>
      </div>
      <label class="pull-left search_lbl">{$_phrase.search}</label>
      <div class="input-group em_search pull-left;">
        <select class="input-group-addon btn selc mdropdown" name="cid" id="cid_search" onchange="searchProject();">
          <option value="0"> {$_phrase.all_categories}</option>
          
          //{foreach $category as $key => $val}
          
          <option value="{$val.id}" {if $cid_search == $val.id} selected {/if}> {for $foo=1 to {$val.depth}} -- {/for}{$val.name}</option>
          
          //{/foreach}
        
                        
        </select>

        <form action="" id="user_search" name="user_search" method="post"  enctype="multipart/form-data">
          <input type="text" class="form-control selip" value="{$search_search}"  name="search" id="search" maxlength="300">
          <input type="hidden" value="{$ptitle}" name="page" />
          <span class="input-group-addon setting setting-icon"> <i class="fa fa-cog"   onclick="$('.checkbox-list').toggle()" aria-expanded="true"></i>     
             <ul class="checkbox-list dropdown-menu" role="menu" aria-labelledby="searchsetting">
              <li><label for="titlesonly"><input name="titlesonly" id="titlesonly" type="checkbox" value="1" {$titlesonly} class="checkbox"> Search titles only</label></li>
              <li><label for="imagesonly"><input name="images" id="imagesonly" type="checkbox" value="1" {$images_search} class="checkbox"> Show only with pictures</label></li>
                <li><label for="freeshipping"><input name="freeshipping" id="freeshipping" type="checkbox" {$freeshipping} value="1" class="checkbox"> Show only free shipping</label></li>
                <li><label for="projectid">Item Id</label></li>
                 <li><label for="projectid"><input name="projectid" id="projectid" type="text" value="{$pid_search}" class="form-control" placeholder="(eg:457)"></label></li>
             </ul> 
           </span><span class="input-group-addon btn btn-primary" onclick="searchProject();"> <i class="fa fa-search"></i> </span>
        </form>
      </div>
    </div>
  </div>
</header>-->


<header>
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container"> 
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
	      <a class="navbar-brand logo-brand" rel="WholeSale-Express.ca" href="#">
	      		<img src="images/logo.png" class="img-responsive" />
	      </a> 
	    </div>
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-left menu-bar">
	        <li> <a href="#">Technology</a> </li>
	        <li> <a href="#">About Us</a> </li>
	        <li class="active"> <a href="#">Contact Us</a> </li>
	        <li> <a href="#">FAQ</a> </li>
	      </ul>
	   
	    <div class="col-md-3 pull-right sign_up_block">
	    	<div class="col-md-9">
	    		<ul class="sign_block list-unstyled list-inline pull-right">
		    		<li class="signup"><a href="#">Sign Up</a></li>
		    		<li class="login"><a href="#">Log in</a></li>
	    		</ul>
	    	</div>
	    	<div class="col-md-12 search-tab">
	    		  <input type="text" placeholder="Find cars" class="form-control search-input"/>
	    		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
	    	</div>
	    </div>
	  </div>
	   </div>
	  <!-- /.navbar-collapse --> 
	  </div>
	  <!-- /.container --> 
	</nav>
</header>
<div class="container_fluid">