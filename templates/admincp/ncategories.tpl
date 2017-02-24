{include file="/admincp/header.tpl" nocache}
<div class="container-fluid"> 
  
  <!-- Page Heading -->
  <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li class="active"> <i class="fa fa-sitemap"></i> Categories <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> {if $categories.id == 0 or $categories.id == ''} Add {else} Edit {/if}<i class="fa fa-hand-o-right"></i> {$projects.title} </li>
      </ol>
    </div>
  </div>
  <!-- /.row -->
  <div class="row">
    <div class="col-lg-12"> {if $error == 'saved'}
      <div class="alert alert-success"> <strong>Saved!</strong> {$categories.name} categories was successfully changed. </div>
      {elseif $error != ''}
      <div class="alert alert-danger"> <strong>{$error}</strong> </div>
      {/if}</div>
      <div class="col-lg-6">
   <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate name="add-product" id="add-product" action="/admincp/categories/save">   
     <input type="hidden" value="{$categories.id}" name="id" />  
      <div class="form-group">
        <label>Categories title</label>
        <input name="title" data-parsley-group="block1" required id="product_name" maxlength="99" value="{$categories.name}" onKeyUp="return limitlength(this,99,'info_label')" type="text" class="form-control">
      </div>
    {if $categories.id == 0  or $categories.id == ''}
     <div class="form-group">
        <label>Parent Category</label>
        <select name="categories" class="form-control">
               <option value="0">- Select Parent -</option> 
            {foreach $pcategories as $key => $val}
               <option value="{$val.id}"  >{for $foo=1 to {$val.depth}} -- {/for}{$val.name}</option> 
            {/foreach}
        </select> 
      </div>
     {/if}
      <div class="form-group">
        <label>Product Description</label>
        <textarea class="form-control" name="description" id="product_info" data-parsley-group="block1" required  data-parsley-maxlength="500" data-parsley-length="[100, 500]" value="" onkeyup="limitlengths(this, 500,'product_info_label')">{$categories.description}
        </textarea>
      </div>
      
      <input name="submit_user_profile" class="btn btn-warning" value="Reset" title="Reset" class="fl" type="reset">
      <input name="admin_product_add" class="btn btn-success" value="Save" title="Add" class="fl" type="submit">
    </form>
    </div>
    
  </div>
 </div> 

{include file="/admincp/footer.tpl" nocache} 
<script language="javascript" type="text/javascript">

$(function()
{
   Date.dayNames = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    Date.format = 'mm/dd/yyyy';
    $("#date_added").datePicker({ clickInput: false, 
        createButton: false, 
        showYearNavigation: false, 
        showHeader:2
    }).bind(
        'focus click keydown',
        function()
        {
          $("#date_added").dpRerenderCalendar();
          $("#date_added").dpSetStartDate($("#date_added").val());
            //$(obj).dpSetStartDate($("#funddater_"+curid).val());
            $("#date_added").dpDisplay();
      }
   );
   
    $("#date_closed").datePicker({ clickInput: false, 
        createButton: false, 
        showYearNavigation: false, 
        showHeader:2
    }).bind(
        'focus click keydown',
        function()
        {
          $("#date_closed").dpRerenderCalendar();
          $("#date_closed").dpSetStartDate($("#date_added").val());
            //$(obj).dpSetStartDate($("#funddater_"+curid).val());
            $("#date_closed").dpDisplay();
      }
   );
   
});
     </script>