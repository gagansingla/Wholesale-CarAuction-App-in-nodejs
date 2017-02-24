{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <div class="row"><div class="col-md-6"><button class="btn btn-success" value="Add product" onClick="location.href='{$config.url}/product/post'">Add product</button></div> </div> 
      <h4 class="ds_brd">My Projects</h4>

      <div class="row mblue_box">
        <div class="col-md-3">Image</div>
        <div class="col-md-2">Title</div>
        <div class="col-md-2">End Time </div>
        <div class="col-md-2">Action</div>
        <div class="col-md-2">Status</div>
        <!--<div class="col-md-3"> Amount </div>-->
      </div>
     {if $projects|count <=  0}
      <div class="row mblue_box1"> No Bids Found </div>
      {else}
      {foreach $projects as $key => $val}
      <div class="row mblue_box1">
        <div class="col-md-3"><a href=""><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"></a></div>
        <div class="col-md-2"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.title}</a></div>
        <div class="col-md-2">{$val.date_closed}</div>
        <div class="col-md-2" style="text-align:center;"><a href="/product/remove/{$val.id}"  title="Delete"><i class="fa fa-remove"></i></a></div>
        <!--<div class="col-md-3">{$val.proposed_amount}</div>-->
       
                <div class="col-md-2">{if $val.status == 1} Active {else $val.status != 1} Inactive{/if}</div>
        
      </div>
      {/foreach}
      {/if} 
      
      {$pagination_html} </div>
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