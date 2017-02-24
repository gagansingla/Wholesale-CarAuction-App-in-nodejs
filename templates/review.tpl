{include file="common/header-1.tpl" nocache}
<div class="container">
   <div class="dash_heads">
      <ul>
         <li><a href="#" title="Home">Home</a></li>
         <li><a><img src="{$config['dpath']}images/arr_bg.png" width="13" height="11" alt="Arrow"></a></li>
      </ul>
   </div>

   {include file="left-nav.tpl" nocache}
   
   <div class="my_message_right">
      <div class="message_common_border">
         <h1 style="width:168px;" title="Add Product">Add Reviews</h1>
         
      </div>
      <div class="message_common">
      {if $reviewaction} Review Submited {/if}
      <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate name="add-product" id="add-product" action="/dashboard/review">
         <input id="input-27" class="rating"  name="rating">
            
            <div class="login_middle_common_profil">
               <div class="user_name_common">
         <p>Subject<span class="red">*</span>  :</p>
                  <div class="text_feeld">
                     <h2>
                        <input name="subject" data-parsley-group="block1" required id="subject" maxlength="99" value="" onkeyup="return limitlength(this,99,'info_label')" type="text" style="height:35;">
                     </h2>
                  </div>  
          <p>Message<span class="red">*</span>  :</p>
                  <div class="text_feeld">
                     <h2>
                        <textarea name="message" id="message" class="resizetextarea"></textarea>
                     </h2>
                  </div>   </div>  
                  <div class="profil_butoon" style="padding-left:10px;">
                        <div class="res_left"></div>
                        <div class="res_mid"><a><input name="admin_product_add" value="Add" title="Add" class="fl" type="submit"></a></div>
                        <div class="res_right"></div>
                     </div>     
      </form>
   </div>
</div>
{include file="common/footer-1.tpl" nocache}
 
   
<script type="text/javascript">
$(function()
{
  $("#input-27").on("rating.change", function(event, value, caption) {
            $("#input-27").rating("refresh", {disabled:true, showClear:false});
            $("#input-27").val(value);
        });
});</script>