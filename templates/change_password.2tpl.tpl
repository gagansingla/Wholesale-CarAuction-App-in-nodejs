{include file="common/header-1.tpl" nocache}
<div class="row dashboard">
  <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
  <div class="col-md-9">
    <h4 class="ds_brd">My Watchlist</h4>
  
      {if $save}
        <div class="row">
             <div class="bg bg-success padding-20">  
                <i class="fa fa-warning"></i>
                 Watchlist Successfully Deleted!.
             </div>
        </div>  

      {/if}
      <div class="row mblue_box">
            <div class="col-md-3">Image  </div>     
            <div class="col-md-3">   Title   </div>          
            <div class="col-md-4"> End Time    </div>     
            <div class="col-md-2">Delete</div>
          </div>

           {if $mywatchlist|count <=  0}
            <div class="row mblue_box1">
              <div class="col-md-12">
                 No Watchlist Items Found
              </div>   
           </div>
           {else}
              {foreach $mywatchlist as $key => $val}
                <div class="row mblue_box1">
                  <div class="col-md-3"><a href="{$config['url']}/product/view/{$val.id}"><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"></a></div>     
                  <div class="col-md-3"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.title}</a></div>           
                  <div class="col-md-4">{$val.date_closed}</div>     
                  <div class="col-md-2"><a href="{$config.url}/dashboard/watchlist/{$val.id}" class="deleteicon" title="Delete"></a></div>
                </div>
              {/foreach}
               <div class="row mblue_box1">
                  <div class="col-md-12">
                    {$pagination_html}
                  </div>
               </div>
            {/if}   

  </div>
</div>
{include file="common/footer-1.tpl" nocache} 
{literal}
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
</script>
{/literal}
