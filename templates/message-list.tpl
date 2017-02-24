<div class="row mblue_box">
  <div class="col-md-3">Name</div>
  <div class="col-md-2">Subject</div>
  <div class="col-md-5">Message</div>
  <div class="col-md-2">Delete</div>
</div>
 {foreach $messages as $key => $val}
 <div class="row mblue_box1">
  <div class="col-md-3">{if $loged.userid == $val.from_id} {$val.tname} {else if $loged.userid != $val.from_id} {$val.fname}{/if}</div>
  <div class="col-md-2"><a href="{$config.url}/dashboard/messages/view/{$val.r_id}">{$val.subject}</a></div>
  <div class="col-md-5">{$val.message_short}..({$val.date_add})</div>
  <div class="col-md-2">{if ($val.from_id == $loged.userid and $val.from_status == 'delete') or ($val.to_id == $loged.userid and $val.to_status == 'delete')}<a href="{$config.url}/dashboard/messages/undelete/{$val.r_id}"><i class="fa fa-undo"></i></a>{else if ($val.from_id == $loged.userid and $val.from_status != 'delete') or ($val.to_id == $loged.userid and $val.to_status != 'delete')} <a href="{$config.url}/dashboard/messages/delete/{$val.r_id}"><i class="fa fa-trash"></i></a>{/if}</div>
</div>   
   
 {/foreach}
{$pagination_html}
                        