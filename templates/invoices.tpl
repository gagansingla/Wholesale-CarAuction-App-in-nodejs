{include file="common/header.tpl" nocache}
<div class="container">
  <div class="dash_heads">
    <ul>
      <li><a href="#" title="Home">Home</a></li>
      <li><a><img src="{$config['dpath']}images/arr_bg.png" width="13" height="11" alt="Arrow"></a></li>
    </ul>
  </div>
  {include file="left-nav.tpl" nocache}
  <div class="my_message_right" id="mybids_page">
    <div class="message_common_border">
      <h1 title="MY PRODUCTS">My Bids</h1>
      <p>&nbsp;</p>
    </div>
    <div class="buton_green">
      
      <div class="message_common">
        <div class="form_cont_top"> </div>
        <div class="forms_common">
          <div class="title_cont_watchilist">
            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="table-top">
              <thead>
                <tr>
                  <th  align="center"> <b>Description</b> </th>
                  <th  align="center"> <b>Type</b> </th>
                  <th  align="center"> <b>Amount</b> </th>
                  <th  align="center"> <b>Date Added</b> </th> 
                  <th  align="center"> <b>Gateway</b> </th>       
                  <th  align="center"> <b> Status</b> </th>
                </tr>
              </thead>
              <tbody>
              
              {if $transaction|count <=  0}
              <tr>
                <td colspan="8" align="center">No Bids Found</td>
              </tr>
              {else}
              {foreach $transaction as $key => $val}
              <tr>
               
                <td align="center"><a href="{$config['url']}/dashboard/invoices/{$val.id}"> {$val.description}</a></td>
                <td align="center"><h2>{$val.type}</h2></td>     
                
                
                <td align="center">${$val.amount}</td>
                <td align="center">{$val.date_added}</td> 
                <td align="center">{$val.gateway}</td> 
                <td align="center">{$val.status}</td>
              </tr>
              {/foreach}
              {/if}
                </tbody>
            </table>
          </div>
          
        </div>
        {$pagination_html} </div>
    </div>
  </div>
</div>
{include file="common/footer.tpl" nocache} 
<script language="javascript" type="text/javascript">
          $(function() { $('.wu').addClass('act_class'); } );
     </script> 
<script type="text/javascript">
$(function()
{
  projectLoad();
});</script>