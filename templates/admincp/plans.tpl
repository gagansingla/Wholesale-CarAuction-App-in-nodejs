{include file="/admincp/header.tpl" nocache}
<div class="container-fluid"> 
  
  <!-- Page Heading -->
  <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li class="active"> <i class="fa fa-sitemap"></i> Plans </li>
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
   <form action="{$config.url}/admincp/membership/plan-create" data-parsley-validate method="post">    
    <div class="col-md-6">
      <input type="hidden" name="id" value="{$id}" /> 
      <div class="form-group">
        <label>Plan Name</label>
        <input type="text" class="form-control" value="{$name}" required name="name" /> 
      </div>
      <div class="form-group">
        <label>Description</label>
        <textarea class="form-control" value="" required name="description">{$description}</textarea> 
      </div>
      <div class="form-group">
        <label>Amount</label>
        <input type="text" class="form-control floatingpoint" value="{$amount}" required name="amount" /> 
      </div>
      <div class="form-group">
        <label>Length</label>
        <input type="text" class="form-control numbers" value="{$length}" required name="length" /> 
      </div>
      <div class="form-group">
        <label>Length Type</label>
        <select class="form-control" name="type">
          <option value="D" {if $format == 'D'}selected{/if} >Days</option>
          <option value="M" {if $format == 'M'}selected{/if}>Months</option>
          <option value="Y" {if $format == 'Y'}selected{/if}>Years</option>
        </select>  
      </div>
      <div class="form-group">
        <label>Plan</label>
        <select class="form-control" name="plan">
          {foreach $roles as $key=>$val}
            <option value="{$val.id}" {if $plan == $val.id} selected {/if}>{$val.name}</option>
          {/foreach}  
        </select>  
      </div>
      <div class="form-group">
        <label>Permission</label>
        <select class="form-control" name="permission">
          {foreach $permission as $key=>$val}
            <option value="{$val.id}" {if $permissions == $val.id} selected {/if}>{$val.name}</option>
          {/foreach}  
        </select>  
      </div>
      <div class="form-group">
       <button name="submit" class="btn btn-success">Create New Plan</button> 
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
         <th>Amount</th>
         <th>Plan Duration</th>
         <th>Action</th>            
        </tr>
      </thead>
      <tbody>
       {foreach $plans as $key => $val}
         <tr>
          <td>{$val.name}</td>
          <td>{$val.description}</td>
          <td>{$val.amount}</td>
          <td>{$val.length} {$val.type}</td>
          <td><a href="{$config.url}/admincp/membership/plan-edit/{$val.id}">Edit</a></td>            
         </tr>       
       {/foreach}
      </tbody>
    </table>     
  </div>
 </div> 
</div> 

{include file="/admincp/footer.tpl" nocache} 
