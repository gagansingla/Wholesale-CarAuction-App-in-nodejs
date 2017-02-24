{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">My Messages</h4>
      <div class="message_wb">
        <div class="media">
          <div class="medi-body">
            <div class="mblue_txt">{$messages[0].subject} <span></span>
            <div class="pull-right">
             {if ($messages[0].from_id == $loged.userid and $messages[0].from_status == 'archive') or ($messages[0].to_id == $loged.userid and $messages[0].to_status == 'archive')} <a href="{$config.url}/dashboard/messages/unarchive/{$r_id}" class="mblue_txt">UnArchive</a> {else if($messages[0].from_id != $loged.userid or $messages[0].from_status != 'archive') or ($val.to_id != $loged.userid or $val.to_status != 'archive'} <a href="{$config.url}/dashboard/messages/archive/{$r_id}" class="mblue_txt">Move to Archive</a> {/if} 
            {if ($messages[0].from_id == $loged.userid and $messages[0].from_status == 'delete') or ($messages[0].to_id == $loged.userid and $messages[0].to_status == 'delete')} <a href="{$config.url}/dashboard/messages/undelete/{$r_id}" class="mblue_txt">Undelete</a> {else if($messages[0].from_id != $loged.userid or $messages[0].from_status != 'delete') or ($messages[0].to_id != $loged.userid or $messages[0].to_status != 'delete'} <a href="{$config.url}/dashboard/messages/delete/{$r_id}" class="mblue_txt">Delete</a> {/if} </div>
          </div>
          </div>
          
        </div>
        <div class="mwb_lbl padd20"> {foreach $messages as $key => $val}   
          
          
          <div class="row"> {$val.fname}{if $val.read == 0 and $val.to_id == $loged.userid} <span class="orange text text-danger">(New)</span>{/if}<br />
            {$val.message}<br />
            {$val.date_add} </div>
          {/foreach}
          
            <form action="{$config.url}/dashboard/messages/save"  method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate>
              <input type="hidden" value="{$r_id}" name="r_id">
             <div class="row"> 
              <div class="col-md-12">
                <textarea name="message" id="product_info" data-parsley-group="block1" required class="form-control" data-parsley-maxlength="500" data-parsley-length="[50, 500]" value="" onkeyup="limitlengths(this, 500,'product_info_label')"></textarea>
              </div>
             </div> 
              <div class="row">
              <div class="col-md-3  m-top-10 padding-20">
                <input type="submit" name="submit" value="Send" class="btn btn-blue1">
              </div>
             </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

{include file="common/footer-1.tpl" nocache} 