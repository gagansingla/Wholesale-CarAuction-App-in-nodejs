{include file="/admincp/header.tpl" nocache}
<div class="container-fluid"> 
  
  <!-- Page Heading -->
  <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li class="active"> <i class="fa fa-laptop"></i> Projects <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> {if $projects.id == 0 or $projects.id == ''} Add {else} Edit {/if}<i class="fa fa-hand-o-right"></i> {$projects.title} </li>
      </ol>
    </div>
  </div>
  <!-- /.row -->
  <div class="row">
    <div class="col-lg-12"> {if $error == 'saved'}
      <div class="alert alert-success"> <strong>Saved!</strong> {$users.first_name} profile was successfully changed. </div>
      {elseif $error != ''}
      <div class="alert alert-danger"> <strong>{$error}</strong> </div>
      {/if}</div>
      <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate name="add-product" id="add-product" action="/admincp/products/save">   
      <div class="col-lg-6">
   
     <input type="hidden" value="{$projects.id}" name="id" />  
      <div class="form-group">
        <label>Product Name</label>
        <input name="title" data-parsley-group="block1" required id="product_name" maxlength="99" value="{$projects.title}" onKeyUp="return limitlength(this,99,'info_label')" type="text" class="form-control">
      </div>
    
    <div class="form-group">
      <label>Catgeory</label>
      <select  class="form-control" name="cid" data-parsley-group="block1" required  style="width:270px; height:30px;" id="product_category">
        <option value="">Please Select Category</option>
        
      
      
      
                           {foreach $category as $key => $val}
                             
      
      
      
        <option value="{$val.id}" {if $projects.category_id == $val.id}selected{/if}>{$val.name}</option>
        
      
      
      
                           {/foreach}
                        
    
    
    
      </select>
    </div>
    <div class="form-group">
      <label>Tag</label>
      <input class="form-control" name="tags" id="tags" maxlength="100" value="{$projects.tags}" type="text" data-parsley-group="block1" required>
    </div>
    <div class="form-group">
      <label>Photo</label>
      <br />
      {foreach $image as $key2 => $val2}
      <div class="pro_image pro_image_{$val2.id}">
         <img src="{if $val2.avatar == '' or $val2.avatar == null} {$config['imgpath']}no_img.png {else if $val2.avatar != ''}{$config['imgpath']}product/{$val2.avatar}{/if}" width="82" title="{$projects.title}" height="83" alt="{$val2.title}">
         <input type="hidden" name="image_id[]" value="{$val2.id}" />
         <input type="hidden" name="image[]" value="{$val2.image}" />
         <input type="hidden" name="avatar[]" value="{$val2.avatar}" />
         <a href="javascript:void(0);" onclick="$('.pro_image_{$val2.id}').remove();"> Delete </a>
       </div>
      {/foreach}
      <div>
        <input name="product_image" type="file" class="file-upload" multiple>
      </div>
     </div> 
   </div>
   <div class="col-md-12">
      <div class="form-group">
        <label>Product Description</label>
        <textarea class="form-control count_numbers" name="description" id="product_info" data-parsley-group="block1" required  data-parsley-maxlength="500" data-parsley-minlength="100" style="height:300px;" value="" >{$projects.description}</textarea>
      </div>
   </div>
   <div class="col-md-6">   
      <div class="form-group">
        <label>Buynow price</label>
        <input name="bprice" id="bprice" class="form-control floatpoint" data-parsley-group="block1" required maxlength="20"  placeholder="0.00"  value="{$projects.bprice}" onchange="$('#mprice').attr('data-parsley-min',$(this).val())" type="text">
      </div>
      <div class="form-group">
        <label>Market price</label>
        <input name="mprice" id="mprice"  class="form-control floatpoint"  data-parsley-group="block1" required maxlength="20"  placeholder="0.00"  value="{$projects.mprice}" type="text" data-parsley-min="0">
      </div>
      <div class="form-group">
       <label>Enhancement</label>
       <div class="col-lg-12">
       <div class="col-lg-3"> 
        <input style="float:left;" name="buynow" id="buy" value="1" type="checkbox"  {if $projects.buynow} checked {/if} data-parsley-group="block1"  class=""> &nbsp;Buy Now
       </div> 
       
       <div class="col-lg-3">
        <input style="float:left;" name="feature" id="buy" value="1" type="checkbox"   {if $projects.feature} checked {/if} data-parsley-group="block1"  class=""> &nbsp;Featured
       </div> 
        </div>     
      </div>
      <div class="form-group m-top-10">
        <br />
        <label>Shipping Amount</label>
        <input name="shipping_fee" id="shipping_fee" class="form-control floatpoint"  data-parsley-group="block1" required maxlength="12" value="{$projects.shipping_price}" type="text">
      </div>
      <div class="form-group">
        <label>Shipping Information</label>
        <input name="shipping_description" class="form-control" id="shipping_info" value="{$projects.shipping_description}" data-parsley-group="block1" required maxlength="20"  type="text">
      </div>
      <div class="form-group">
        <label>Start Date</label>
       <input data-date-format="MM d, yyyy" name="date_added" id="date_added"  class="date-picker form-control" data-parsley-group="block1" required maxlength="20" value="{$projects.date_add}" type="text">
        
      </div>
      <div class="form-group" style="padding-bottom:200px;">
        <label>Ending Date</label>
        <input data-date-format="MM d, yyyy" name="date_closed" id="date_closed"  class="date-picker form-control" data-parsley-group="block1" required maxlength="20" value="{$projects.date_close}" type="text">
      </div>
      <input name="submit_user_profile" class="btn btn-warning" value="Reset" title="Reset" class="fl" type="reset">
      <input name="admin_product_add" class="btn btn-success" value="Add" title="Add" class="fl" type="submit">
    </div>
    </form>
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