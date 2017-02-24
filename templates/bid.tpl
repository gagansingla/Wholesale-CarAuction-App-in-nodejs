{include file="common/header-1.tpl" nocache}
<div class="container">
  <div class="auction_item" id="auction_403" name="http://unieauction.com/buy-sell-demo/auctions/process">
    <div class="auction_type" data-auctiontype="25"></div>
    <div class="banner_inner" id="detail_page">
      <div class="dash_heads">
        <ul>
          <li><a href="http://unieauction.com/buy-sell-demo/" title="Home">Home</a></li>
          <li><a href="#" title="arr_bg"><img src="http://unieauction.com/buy-sell-demo/public/white/images/arr_bg.png" width="13" height="11" alt="Arrow"></a></li>
          <li class="active"><a href="#" title="{$projects.title}">{$projects.title}</a></li>
        </ul>
      </div>
      
      <!--detail page start-->
      
      <div class="detail_page_top">
        <h1 class="detail_title">{$projects.title}</h1>
        <div class="detail_page_top_left"> 
          
          <!---<ul>
            <li> <a> <img src="public/images/bag_img.png" width="353" height="297" alt="img" /> </a> </li>
            
            </ul>--> 
          <!---slide_show-->
          <div id="slide_container">
            <div id="slide_content">
              <div id="slider" style="width: 353px; height: 297px; overflow: hidden;">
                <ul style="width: 353px; margin-left: 0px;">
                  <li style="float: left;"><a href="#" title="{$projects.title}"> <img src="{if $projects.avatar == ''} {$config['imgpath']}no_img.png {else if $projects.avatar != ''}{$config['imgpath']}product/{$projects.avatar}{/if}" width="353" height="297" alt="1"></a></li>
                </ul>
              </div>
              
            </div>
          </div>
          
          <!--slide_show-->
          
          <div class="detail_feature_bott_lft">
            <div class="sliders"> <span class="beginner_white"></span> </div>
            <a title="+ Add to Watchlist" onclick="addtowatchlist({$projects.id})" href="javascript:void(0);" rel="403" class="addwatchlist" name="http://unieauction.com/buy-sell-demo/auctions/addwatchlist"><img src="http://unieauction.com/buy-sell-demo/public/white/images/plus_bg.png" width="24" height="25" alt="+ Add to Watchlist"></a> </div>
          
        </div>
        <div class="detail_page_top_mid" style="width:580px;">
          
          <div class="bid_history" style="" rel="0" name="344">

            <h3>Are you sure you want to bid this item for price ${$projects.wsprice}?</h3>
            <form action="/product/confirm/" method="post" enctype="multipart/form-data">
               <input type="hidden" name="wsprice" value="{$projects.wsprice}" />
               <input type="hidden" name="id" value="{$projects.id}" />
               <input type="submit" name="submit" value="Confirm Bid" />
            </form> 

          </div>
        </div>
       
      </div>
      
      <div class="detail_bottom_outer">
        <div class="detail_bottom_outer_top">
          <div class="detail-action_detail">
            <h1>Auctions Details</h1>
            <div class="detail-action_detail_lef">
              <h2>Auction ID : </h2>
             
            </div>
            <div class="detail-action_detail_rgt">
              <p>{$projects.id}</p>
             
            </div>
          </div>
          <div class="detail-action_detail">
            <h1>Price Details</h1>
            <div class="detail-action_detail_lef">
              <h2> Price Starting From :</h2>
              <h2>Start time : </h2>
              <h2>End time :</h2>
            </div>
            <div class="detail-action_detail_rgt">
              <p><font class="">$</font> {$projects.sprice} </p>
              <p>{$projects.stime}</p>
              <p>{$projects.ctime} </p>
            </div>
          </div>
          <div class="detail-action_detail detail_last-bgnone">
            <h1>Shipping Details</h1>
            <div class="detail-action_detail_lef">
              <h2>Shipping Fee :</h2>
              <h2>Shipping information :</h2>
            </div>
            <div class="detail-action_detail_rgt">
              <p><font class="">$</font> {$projects.shipping_fee}</p>
              <p>{$projects.description}</p>
            </div>
          </div>
        </div>
        <div class="detail_product_description">
          <h1>Product Description</h1>
          <p>{$projects.description}</p>
        </div>
      </div>
      
      <!--detail end--> 
    </div>
  </div>
</div>

{include file="common/footer-1.tpl" nocache} 
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
     </script> 
<script type="text/javascript">
$(function()
{
  projectLoad();
});</script>