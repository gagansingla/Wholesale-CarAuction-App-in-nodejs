{include file="/admincp/header.tpl" nocache}
<div class="container-fluid"> 
  
  <!-- Page Heading -->
  <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li class="active"> <i class="fa fa-sitemap"></i> Permisisons </li>
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
   <form action="{$config.url}/admincp/membership/permission-save-data" data-parsley-validate method="post">    
    <div class="col-md-6">
      <input type="hidden" name="id" value="{$id}" /> 
      {foreach $permission_set_data as $key => $val}
      <div class="form-group">
        <label>{$val.name}</label>
        {if $val.type == 'text'}
        <input type="text" class="form-control" value="{$val.value}" required name="permission[{$val.id}]" /> 
        {/if}
        {if $val.type == 'int'}
        <input type="number" class="form-control" value="{$val.value}" required name="permission[{$val.id}]" /> 
        {/if}
        {if $val.type == 'email'}
        <input type="email" class="form-control" value="{$val.value}" required name="permission[{$val.id}]" /> 
        {/if}
        {if $val.type == 'textarea'}
        <textarea class="form-control" required name="permission[{$val.id}]" /> {$val.value} </textarea>
        {/if}
        {if $val.type == 'radio'} 
        <input type="radio" class="" value="1" required name="permission[{$val.id}]" {if $val.value == 1} checked {/if} /> Yes 
        <input type="radio" class="" value="0" required name="permission[{$val.id}]" {if $val.value == 0} checked {/if} /> No 
        {/if}
        
      </div>
      {/foreach}
      <div class="form-group">
       <button name="submit" class="btn btn-success">Update Permission</button> 
      </div>  
    </div>
   </form>  
  </div> 
   

 </div> 
</div> 

{include file="/admincp/footer.tpl" nocache} 
