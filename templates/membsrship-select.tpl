{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">Setup Your Membership</h4>
      
      <div class="col-md-12 text-center m-top-20 font-12">Select Your Role : 
      <select type="membership">
        {foreach $membership as $key => $val}
          <option value="{$val.id}">{$val.name}</option> 
        {/foreach}
      </select>  
      </div>
      
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 