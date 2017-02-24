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
       <form action="{$config.url}/admincp/messages/save"  method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate>
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                               
                                <tbody>
                                 
                                  <tr>
                                        <td>To : <select name="users">{foreach $users as $key => $val}<option value="{$val.id}"> {$val.first_name} {$val.last_name} ({$val.email}) {/foreach}</select></td>
                                        
                                    </tr>
                                 
                                    
                                 <tr><td colspan="3">

                                
                                   <input type="hidden" value="0" name="r_id">
                                   <h2><input type="text" class="form-control" value="" name="subject" required></h2>
                                      <h2>
                           <textarea name="message" id="product_info" data-parsley-group="block1" required class="form-control" data-parsley-maxlength="500" data-parsley-length="[100, 500]" value="" onkeyup="limitlengths(this, 500,'product_info_label')"></textarea>                           
                        </h2>
                                  <input type="submit" value="Compose" class="btn btn-success" />


                                 
                                 </td></tr>
                                </tbody>

                            </table>
                        </div>
 </div>
                </div>
</form>   
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
