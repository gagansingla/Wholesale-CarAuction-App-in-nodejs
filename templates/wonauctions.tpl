{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">Penny Won Auctions</h4>
      <div class="row mblue_box">
        <div class="col-md-3">Image</div>
        <div class="col-md-2">Title</div>
        <div class="col-md-3">End Time </div>
        <div class="col-md-2"> Amount </div>
        <div class="col-md-2"> Status</div>
      </div>
      {if $mybids|count <=  0}
        <div class="col-md-12 text-center m-top-20 font-12">No Results found Found</div>
              {else}
      {foreach $mybids as $key => $val}
      <div class="row mblue_box1">
        <div class="col-md-3"><a href=""><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"></a></div>
        <div class="col-md-2"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.title}</a></div>
        <div class="col-md-3">{$val.date_closed}</div>
        <div class="col-md-2">{$val.proposed_amount}</div>
        <div class="col-md-2">{$val.status}</div>
      </div>
      {/foreach} 
      {/if} {$pagination_html} </div>
  </div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 