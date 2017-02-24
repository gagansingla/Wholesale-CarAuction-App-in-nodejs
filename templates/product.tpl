{include file="common/header-1.tpl" nocache} 
<script src="{$config.url}/js/countdown.js"></script> 
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>
<div class="row">
  <div class="col-md-2 left_col">
    <div class="white_box">
      <div class="whead">Welcome</div>
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
    <div class="reg_try"> <img src="{$config.url}/images/reg_try.png" alt=""> </div>
  </div>
  <div class="col-md-10">
    
    {if $highbid}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-40"> <i class="fa fa-warning"></i> Congratulations! You are the highest bidder of this project. </div>
    </div>
    {/if}
    {if $winbid}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-40"> <i class="fa fa-warning"></i> Congratulations! You won this project successfully. </div>
    </div>
    {/if}
    {if $soldhim}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-40"> <i class="fa fa-warning"></i> Congratulations! You bought this project successfully. </div>
    </div>
    {/if}
    {if $placedbid}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-40"> <i class="fa fa-warning"></i> Your Bid amount ${$placedbidamount} was Sucessfully Submitted. </div>
    </div>
    {/if}
    <div class="watch_list"><a href="javascript:void(0);" onclick="addtowatchlist({$projects.id})"><i class="fa fa-eye"></i>&nbsp;+&nbsp;Watchlist</a></div>
    <div class="row proc_r">
      <div class="col-md-4">
       
        <div><ul class="owl-carousel main-preview" id="owl-images"> {foreach $images as $key => $val}
             <li class="item"><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" width="240" height="240" alt="1"></li>
        {/foreach}</ul></div>
        
        <div class="proc_title">{$projects.title}</div>
      </div>
      <div class="col-md-8 rblue_box"> {include file="product_ajax_view.tpl" nocache} </div>
    </div>
    <div class="lgr_box">
      <div class="row gray_txt">
        <div class="col-md-4">
          <div>AUCTIONS DETAILS</div>
          <div>Auction ID : {$projects.id}</div>
          <div>Auction type(s) : Beginner</div>
        </div>
        <div class="col-md-4 bdr">
          <div>PRICE DETAILS</div>
          <div>Price Starting From : $ {$projects.sprice} </div>
          <div>Start time : {$projects.stime}</div>
          <div>End time :  {$projects.ctime}</div>
        </div>
        <div class="col-md-4">
          <div>SHIPPING DETAILS</div>
          <div>Shipping Fee :$ {$projects.shipping_price}</div>
          <div>Shipping information : {$projects.shipping_description}</div>
        </div>
      </div>
      <div class="row gray_txt spd_desc">
        <div>Product Description</div>
        <p> {$projects.description} </p>
      </div>
    </div>
  </div>
</div>
<div class="modal confirmbid  fade" id="buybid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
        <div class="modal-body">
          <div class="confirmbid_header">Confirm Your Buy Now</div>
          <div class="proc_title">{$projects.title}</div>
          <div><img src="{$config.url}images/sam_product.png" alt=""></div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Time Left :</div>
            <div class="pull-left"> {if $projects.market_status == 'open' or $projects.market_status == 'draft'}
              <h3 class="countdown" id="my{$projects.id}">{$projects.day}</h3>
              {else} Auction Closed{/if}</div>
          </div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Bid History :</div>
            <div class="pull-left sbid"><font class="sbid">{$bcnt}</font> Bids</div>
          </div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Quantity :</div>
            <div class="pull-left">1 ( 1 Left)</div>
          </div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Buy Now Price :</div>
            <div class="pull-left max_bid">
              <div>${$projects.bprice}</div>
            </div>
          </div>
          <button class="btn bid_now" data-toggle="modal" data-target="#buybid " onclick="window.location = '{$config['url']}/product/buy/{$projects.id}'">Buy Now</button>
        </div>
      
    </div>
  </div>
</div>
<div class="modal confirmbid  fade" id="confirmbid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <form action="/product/confirm/" method="post" enctype="multipart/form-data">
        <input type="hidden" name="wsprice" value="{$projects.wsprice}" />
        <input type="hidden" name="id" value="{$projects.id}" />
        <div class="modal-body">
          <div class="confirmbid_header">Confirm Your Bid</div>
          <div class="proc_title">{$projects.title}</div>
          <div><img src="{$config.url}images/sam_product.png" alt=""></div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Time Left :</div>
            <div class="pull-left"> {if $projects.market_status == 'open' or $projects.market_status == 'draft'}
              <h3 class="countdown" id="my{$projects.id}">{$projects.day}</h3>
              {else} Auction Closed{/if}</div>
          </div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Bid History :</div>
            <div class="pull-left "><font class="sbid">{$bcnt}</font> Bids</div>
          </div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Quantity :</div>
            <div class="pull-left">1 ( 1 Left)</div>
          </div>
          <div class="clearfix pro_row">
            <div class="pull-left ctxt_lbl">Your Max Bid :</div>
            <div class="pull-left max_bid">
              <div>$<font class="bamount">{$projects.wsprice}</font></div>
            </div>
          </div>
          <button class="btn bid_now" data-toggle="modal" data-target="#confirmbid ">Confirm Bid</button>
        </div>
      </form>
    </div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache}

<script> 

function meee(id,dateee,price)
  {  
 // id = '126';
 // alert(dateee);
   clearInterval(clearvar[id]);
    clock[id] = document.getElementById('my'+id)
    , targetDate[id] = new Date(dateee); // Jan 1, 2050;
 
  clock[id].innerHTML = countdown(targetDate[id]).toString();
  clearvar[id] =  setInterval(function(){
     if(targetDate['{$projects.id}']>new Date())
    clock[id].innerHTML = countdown(targetDate[id]).toString();
  else
  clock[id].innerHTML = 'Closed';
  
    
  }, 1000);
    
  }
  
    clock['{$projects.id}'] = document.getElementById('my{$projects.id}')
    , targetDate['{$projects.id}'] = new Date('{$projects.closed}'); 
 
  clock['{$projects.id}'].innerHTML = countdown(targetDate['{$projects.id}']).toString();
 clearvar['{$projects.id}'] =  setInterval(function(){
   if(targetDate['{$val.id}']>new Date())
    clock['{$projects.id}'].innerHTML = countdown(targetDate['{$projects.id}']).toString();
  else
  clock['{$projects.id}'].innerHTML = 'Closed';
    
  }, 1000);
  </script> 
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
      var pid = '{$projects.id}';
      var dt = '{$projects.closed}';
       var resultss = {
            id: pid,
            date: dt,
            price:'{$projects.wprice}',
      pric_l : $('.pric_l').html(),
      bid_history :  $('.bid_history').html()    
        }
    console.log(resultss);
    socket.on('bidAddtime', function(msg){    
    // meee(msg.id,msg.date);

    $('.pric_l').html(msg.pric_l);
    $('.bid_history').html(msg.bid_history);
    $('.sbid').html($('.lcntbid').html());
    $('.bamount').html(parseFloat(parseFloat($('.pric_l .rtext').html().replace('$',''))+parseFloat({$config['general']['bidincrement']})).toFixed(2));
    meee(msg.id,msg.date,msg.price);
    });

    socket.emit('bidAddtime', resultss);  
     </script> 
<script type="text/javascript">
$(function()
{
  projectLoad();
   var sync1 = $(".main-preview");
        
       
        sync1.owlCarousel({
          singleItem : true,
          slideSpeed : 500,
          navigation: true,
          navigationText: ['<i class="fa fa-chevron-left"></i>','<i class="fa fa-chevron-right"></i>'],
          pagination:false,          
          responsiveRefreshRate : 200,
        });
       
        
       
        
});</script>
{if $bidshow}
<script type="text/javascript">
$(function()
{
  $('#confirmbid').modal();
});</script>
{/if}
{if $buyshow}
<script type="text/javascript">
$(function()
{
  $('#buybid').modal();
});</script>
{/if}
