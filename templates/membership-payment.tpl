{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">Setup Your Membership</h4>
      <form name="setautobid" action="/membership/payment" method="post" data-parsley-validate required>
      <div class="col-md-12  m-top-20 font-12">Membership Payment : {$data.name} </div>
      <div class="col-md-12  m-top-20 font-12">Membership Amount : {$data.amount} </div>       
     
       <div class="col-md-12 m-top-20"><button type="submit" value="Pay" class="btn btn-success">Pay</button></div>
      </form>
      </div>

      
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 

<script type="text/javascript">
$(function() {
     $("select[name='plan']").attr('disabled',true);
     $("select[name='membership']").change(function()
     {
        $("select[name='plan'] option").hide();
        $("select[name='plan'] .roles_"+$(this).val()).show();
        $("select[name='plan'] .roles_"+$(this).val()+":first").attr('selected',true);
        $(".amnt").html($('select[name="plan"] option[selected="selected"]').attr('amount'));
        $("select[name='plan']").attr('disabled',false);

     });
     $("select[name='plan']").change(function()
     {
         $(".amnt").html($('select[name="plan"] option[selected="selected"]').attr('amount'));
     });
});
</script>