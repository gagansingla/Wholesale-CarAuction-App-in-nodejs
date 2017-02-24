<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$config['title']}</title>
<link rel="stylesheet" href="{$config['dpath']}css/style.css" type="text/css" />
{foreach $external2css as $key => $val}
 <link rel="stylesheet" href="{$config['externalcss']}{$val}.css" type="text/css" />
{/foreach}
<style></style>
<script src="/socket.io/socket.io.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script>
var socket = io.connect();
</script>
</head>

<body >
<header>  
<div id="header">
  <div class="header_inner">
    <div class="header_lft">
      <p>Bidding Type   :</p>
      <ul>
        <li style="background:none;"><img src="{$config['dpath']}/images/head_top1_bg.png" width="18" height="18" alt="Beginner"><a title="Beginner">Beginner</a></li>
        <li><img src="{$config['dpath']}/images/head_top2_bg.png" width="18" height="18" alt="Penny auction"><a title="Penny Auction">Penny Auction</a></li>
        <li><img src="{$config['dpath']}/images/head_top3_bg.png" width="18" height="18" alt="Peak auction"><a title="Peak Auction">Peak Auction</a></li>
        <li><img src="{$config['dpath']}/images/reserve_icon1.png" width="17" height="17" alt="Reserve auction"><a title="Reserve auction">Reserve auction</a></li>
      </ul>
    </div>
    <div class="header_rgt">
      <div class="header_right">
        <ul>
          {if $loged.userid > 0}
           <li><a href="{$config.url}/product/my" title="Sign in">{$loged.email}</a></li>
           <li><a href="{$config.url}/login/logout/" title="Sign in">Logout</a></li>
          {else}
           <li><a href="{$config.url}/login/" title="Sign in">Sign in</a></li>
           <li class="active"><a href="{$config.url}/register" title="Register">Register</a></li>
          {/if}
          
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="header2">
  <div class="header2_lft">
    <h1 title="Penny Auction"> <a href="{$config.url}" title="" class="fl"> <img src="{$config['dpath']}/images/logo1.png" alt="penny auction" title="" class="hlogo"> </a> </h1>
  </div>
  <div class="header2_rgt">
    <div class="dash_rgt">
      <ul>
        
        <li>
          <div class="search_total">
            <div class="search_total_lft"> </div>
            <div class="search_total_midd">
              <div class="search_lft">
                <div class="search_icon"></div>
                <form action="" id="user_search" name="user_search" method="post"  enctype="multipart/form-data">
                  <input type="text" placeholder="Search Products..." name="search" class="fl"  id="search" maxlength="300">
                  <input type="hidden" value="{$ptitle}" name="page" />
                </form>
              </div>
              <div class="search_rgt">
                <div class="search_button">
                  <div class="search_button_lft"></div>
                  <div class="search_button_mid" style="cursor:pointer;">
                    <p style="cursor:pointer;"><a class="fl" onclick="searchProject();" title="SEARCH">SEARCH</a></p>
                  </div>
                  <div class="search_button_rgt"></div>
                </div>
              </div>
            </div>
            <div class="search_total_rgt"></div>
          </div>
        </li>
        {if $loged.userid > 0}<li style="text-align:right;width:100%;"><h4 style="font-size:11px;margin-top:10px;"> Available Balance : <span class="orange" style="font-size:11px;">${$userbalance.ledger}</span> &nbsp; Ledger Balance : <span class="orange" style="font-size:11px;">${$userbalance.balance}</span> </h4> </li>{/if}
      </ul>
    </div>
  </div>
</div>
<div id="header_menu">
  <div class="header_menu_inner">
    <ul>
      <li>
        <select class="mdropdown" onchange="searchProject();">
          <option value="" disabled selected>Select Category</option>
          <option value="0"> ALL CATEGORIES</option>
          {foreach $category as $key => $val}
          <option value="{$val.id}">{$val.name}</option>
          {/foreach}
        </select>
      </li>
      <li  > <a href="{$config.url}" title="Home"> Home</a></li>
      <li  ><a href="{$config.url}/live" title="Live Auctions"> Live Auctions</a></li>
      <li ><a href="{$config.url}/future" title="Future Auctions"> Future Auctions </a></li>
      <li   ><a href="{$config.url}/closed" title="Closed Auctions"> Closed Auctions</a></li>
      <li ><a href="{$config.url}/shop" title="Shop Now"> Shop Now</a></li>
      <li><a href="{$config.url}/winner" title="Winners"> Winners</a></li>
      <li ><a href="news.html" title="News"> News</a></li>
      <li  ><a href="{$config.url}/package" title="Buy Packages"> Buy Packages</a></li>
    </ul>
  </div>
</div>
</header>

