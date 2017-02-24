{include file="/admincp/header.tpl" nocache}
<div class="container-fluid"> 
  
  <!-- Page Heading -->
  <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li class="active"> <i class="fa fa-sitemap"></i> Roles </li>
      </ol>
    </div>
  </div>
  <!-- /.row -->
  <div class="row">
   <div class="col-lg-12">  
    {if $saved}
      <div class="alert alert-success"> <strong>Saved!</strong> </div>
    {/if}
   </div> 
   <form action="{$config.url}/admincp/membership/roles-create" data-parsley-validate method="post">    
    <div class="col-md-6">
      <input type="hidden" name="id" value="{$id}" /> 
      <div class="form-group">
        <label>Role Name</label>
        <input type="text" class="form-control" value="{$name}" required name="name" /> 
      </div>
      <div class="form-group">
        <label>Description</label>
        <textarea class="form-control" value="" required name="description">{$description}</textarea> 
      </div>
      <div class="form-group">
       <button name="submit" class="btn btn-success">{if $id == 0} Create New {else} Update {/if} Roles</button> 
      </div>  
    </div>
   </form>  
  </div> 
   
   <div class="table-responsive">
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
         <th>Name</th>
         <th>Description</th>
         <th>Action</th>            
        </tr>
      </thead>
      <tbody>
       {foreach $plans as $key => $val}
         <tr>
          <td>{$val.name}</td>
          <td>{$val.description}</td>
          <td><a href="{$config.url}/admincp/membership/roles-edit/{$val.id}">Edit</a></td>            
         </tr>       
       {/foreach}
      </tbody>
    </table>     
  </div>
 </div> 
</div> 

{include file="/admincp/footer.tpl" nocache} 
