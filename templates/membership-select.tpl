{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">Setup Your Membership</h4>
      <form name="setautobid" action="/membership/package" method="post" data-parsley-validate required>
      <div class="col-md-12  m-top-20 font-12">{if $membership_id > 0} {else} Select {/if}Your Role : 
        {if $membership_id > 0}
          {foreach $membership as $key => $val}
          {if $membership_id == $val.id}  {$val.name} {/if}
          {/foreach}
           <select name="membership" style="display;none;">
            {foreach $membership as $key => $val}
              <option value="{$val.id}" {if $membership_id == $val.id} selected {/if}>{$val.name}</option> 
            {/foreach}
          </select>  
        {else}
      <select name="membership">
         <option value="">Please select Role</option>
        {foreach $membership as $key => $val}
          <option value="{$val.id}" {if $membership_id == $val.id} selected {/if}>{$val.name}</option> 
        {/foreach}
      </select>  
      {/if}
      </div>
      <div class="col-md-12  m-top-20 font-12">Select Your Package : 
      <select name="plan">
         <option value="">Please select package</option>
         {foreach $plans as $key => $val}
          <option value="{$val.id}" class="roles_{$val.membership_id}" amount="{if $val.amount > 0} $ {$val.amount}{else if $val.amount <= 0} Free {/if}">{$val.name}</option> 
        {/foreach}
        
      </select>  
      </div>

       <div class="col-md-12  m-top-20 font-12">Amount : <span class="amnt">Please select package</span>
       <div class="col-md-12 m-top-20"><button type="submit" value="Pay" class="btn btn-success">Pay</button></div>
      </form>
      </div>

      
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 
{if $membership_id > 0}
<script type="text/javascript">
$(function() {
        var val =$("select[name='membership']").val();
        $("select[name='plan'] option").hide();
        $("select[name='plan'] .roles_"+val).show();
        $("select[name='plan'] .roles_"+$(this).val()+":first").attr('selected',true);
        $(".amnt").html($('select[name="plan"] option:selected').attr('amount'));
        $("select[name='plan']").attr('disabled',false);
        $("select[name='plan'] option:first").show();
         $("select[name='plan']").change(function()
         {
           //console.log(3);
             $(".amnt").html($('select[name="plan"] option:selected').attr('amount'));
         });

});
</script>
{else}
<script type="text/javascript">
$(function() {
     $("select[name='plan']").attr('disabled',true);
     $("select[name='membership']").change(function()
     {
        $("select[name='plan'] option").hide();
        $("select[name='plan'] .roles_"+$(this).val()).show();
        $("select[name='plan'] .roles_"+$(this).val()+":first").attr('selected',true);
        $(".amnt").html($('select[name="plan"] option:selected').attr('amount'));
        $("select[name='plan']").attr('disabled',false);
        $("select[name='plan'] option:first").show();

     });
     $("select[name='plan']").change(function()
     {
         $(".amnt").html($('select[name="plan"] option:selected').attr('amount'));
     });
});
</script>
{/if}