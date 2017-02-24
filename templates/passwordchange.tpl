{include file="common/header-1.tpl" nocache}
<div class="row dashboard">
  <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
  <div class="col-md-9">
    <h4 class="ds_brd">Change Password</h4>
   <form action="/dashboard/changepassword" method="post" id="change_password" name="change_password" accept-charset="utf-8" data-parsley-validate>
      {if $save}
        <div class="row">
             <div class="bg bg-success padding-20">  
                <i class="fa fa-warning"></i>
                 Password Successfully Changed!.
             </div>
        </div>  

      {/if}
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Old Password:</label>
          <div class="col-md-8">
            <input type="password" id="old_password" name="old_password" title="Old Password"  class="form-control" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >New Password:</label>
          <div class="col-md-8">
           <input type="password" id="new_password" name="new_password" title="New Password" maxlength="20" required class="form-control">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Confirm Password :</label>
          <div class="col-md-8">
           <input type="password" id="new_password" name="confirm_password" title="Confirm Password" maxlength="20" required data-parsley-equalto="#new_password" class="form-control">
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2">
          <button class="btn save_btn">Save</button>
        </div>
      </div>
    </form>
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 
{literal}
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
</script>
{/literal}
