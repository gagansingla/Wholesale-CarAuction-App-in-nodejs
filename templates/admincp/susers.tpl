{include file="/admincp/header.tpl" nocache}
<div class="container-fluid">

                <!-- Page Heading -->
                
                <div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Users <i class="fa fa-hand-o-right"></i> <i class="fa fa-search"></i> Search
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                   <form enctype="multipart/form-data" class="admin_form" data-parsley-validate method="get" enctype="multipart/form-data" action="{$config.url}/admincp/users/search">
                        
                         <div class="col-lg-4"> 

                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" name="email" value="{$search.email}">
                               
                            </div>
                             <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="status">
                                    <option value="" {if $search.status == ''} selected {/if}>All</option>
                                    <option value="active"  {if $search.status == 'active'} selected {/if}>Active</option>
                                    <option value="moderate"  {if $search.status == 'moderate'} selected {/if}>Moderate</option>
                                    <option value="deactivate"  {if $search.status == 'deactivate'} selected {/if}>Deactivate</option>
                                    <option value="unsubscribe"  {if $search.status == 'unsubscribe'} selected {/if}>Unsubscribe</option>
                                    <option value="unverified"  {if $search.status == 'unverified'} selected {/if}>Unverified</option>
                                </select>
                            </div>
                         </div>   
                          <div class="col-lg-4">   
                            <div class="form-group">
                                <label>First Name</label>
                                <input class="form-control" placeholder="Enter First Name" value="{$search.first_name}" name="first_name">
                            </div>

                         

                           
                            <div class="form-group">
                                <label>Last Name</label>
                                <input class="form-control" placeholder="Enter Last Name" value="{$search.last_name}" name="last_name">
                            </div>

                           

                          </div>   
                          <div class="col-lg-4">   
                            <br /> <br /><br /><br /><br />
                            <div class="form-group">
                              <button type="submit" class="btn btn-success"> <i class="fa fa-search"></i> Search</button>
                           </div>

                         </div>
                           

                             
                        </form>
                 
                </div>    
                
                {include file="/admincp/user-list.tpl" nocache}

               
                <!-- /.row -->
</div>
           
{include file="/admincp/footer.tpl" nocache}
