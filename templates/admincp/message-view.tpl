{include file="/admincp/header.tpl" nocache}
<div class="container-fluid">

                   
                <div class="row">
                  <div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th colspan="4">Messages</th>
                                       
                                       
                                      
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                    <tr>
                                        <td colspan="4">

                                        <div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" {if $action == ''} class="active" {/if}><a href="{$config.url}/admincp/messages/" >All</a></li>
    <li role="presentation" {if $action == 'inbox'} class="active" {/if}><a href="{$config.url}/admincp/messages/inbox">Inbox</a></li>
    <li role="presentation" {if $action == 'sent'} class="active" {/if}><a href="{$config.url}/admincp/messages/sent">Sent</a></li>
    <li role="presentation" {if $action == 'archive'} class="active" {/if}><a href="{$config.url}/admincp/messages/archive">Archive</a></li>
    <li role="presentation" {if $action == 'delete'} class="active" {/if}><a href="{$config.url}/admincp/messages/delete">Delete</a></li>
    <li role="presentation" {if $action == 'compose'} class="active" {/if}><a href="{$config.url}/admincp/messages/compose">Compose</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home"><div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                               
                                <tbody>
                                 {foreach $messages as $key => $val}   
                                 {if $key == 0}
                                  <tr>
                                        <td><b>{$val.subject}</b><br />
                                         {if ($val.from_id == $loged.userid and $val.from_status == 'archive') or ($val.to_id == $loged.userid and $val.to_status == 'archive')} 
                                          
                                           <a href="{$config.url}/admincp/messages/unarchive/{$r_id}">UnArchive</a>
                                         {else if($val.from_id != $loged.userid or $val.from_status != 'archive') or ($val.to_id != $loged.userid or $val.to_status != 'archive'}   
                                         <a href="{$config.url}/admincp/messages/archive/{$r_id}">Move to Archive</a>
                                          
                                         {/if} 
                                          {if ($val.from_id == $loged.userid and $val.from_status == 'delete') or ($val.to_id == $loged.userid and $val.to_status == 'delete')}  
                                          <a href="{$config.url}/admincp/messages/undelete/{$r_id}">Undelete</a>
                                         {else if($val.from_id != $loged.userid or $val.from_status != 'delete') or ($val.to_id != $loged.userid or $val.to_status != 'delete'}
                                           
                                          <a href="{$config.url}/admincp/messages/delete/{$r_id}">Delete</a>
                                         {/if}
                                        </td>
                                        
                                    </tr>
                                 {/if}
                                    <tr>
                                        <td>{$val.fname}{if $val.read == 0 and $val.to_id == $loged.userid} <span class="orange text text-danger">(New)</span>{/if}<br />
                                             {$val.message}<br />{$val.date_add}</td>
                                        
                                    </tr>
                                 {/foreach}
                                 <tr><td colspan="3">

                                 <form action="{$config.url}/admincp/messages/save"  method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate>
                                   <input type="hidden" value="{$r_id}" name="r_id">
                                      <h2>
                           <textarea name="message" id="product_info" data-parsley-group="block1" required class="form-control" data-parsley-maxlength="500" data-parsley-length="[100, 500]" value="" onkeyup="limitlengths(this, 500,'product_info_label')"></textarea>                           
                        </h2>
                                  <input type="submit" value="Reply" class="btn btn-success" />


                                 </form>   
                                 </td></tr>
                                </tbody>

                            </table>
                        </div>
 </div>
                </div>

                </div>
    
  </div>

</div>
                                      </td>
                                         
                                       
                                    </tr>
                                 
                                </tbody>
                            </table>
                        </div>
 </div>
                </div>
               
                <!-- /.row -->
</div>
           
{include file="/admincp/footer.tpl" nocache}
