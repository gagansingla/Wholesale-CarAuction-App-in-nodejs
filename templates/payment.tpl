{include file="common/header-1.tpl" nocache}
<div class="row">
  <div class="banner_inner">
    <div class="wrapper_outer">
      <div class="wrapper_inner">
        <div class="wrapper">
          <div class="auctions_black_authorize_top_bg">
            <div class="auctions_black_authorize_top_left"></div>
            <div class="auctions_black_authorize_top_mid">
              <h2>Authorize Authentication</h2>
            </div>
            <div class="auctions_black_authorize_top_right"></div>
          </div>
          <div class="actions_black_autorize_mid_bg" id="authrize_payment_page">
            <div class="white_theme_tot_aut">
              <form method="POST" name="authorize_form" action="/package/pay" data-parsley-validate >
                <input type="hidden" name="id" value="{$id}" />
                <div class="card_detail">
                  <label>Pay Type:</label>
                  <select type="payment" name="payment">
                    <option value="paypal">Paypal</option>
                    <option value="authorize">Authorize</option>
                    <option value="stripe">Stripe</option>
                  </select>
                </div>
                <div id="cardPayments" style="display:none;">
                  <div class="card_detail">
                    <label>Card Type:</label>
                    <div class="select_card_type">
                      <div class="top_select">
                        <select name="creditCardType" class="select" title="select_card_type">
                          <option value="Visa" selected="">Visa</option>
                          <option value="MasterCard">MasterCard</option>
                          <option value="Discover">Discover</option>
                          <option value="Amex">American Express</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="card_detail">
                    <label>Card Number:</label>
                    <div class="select_card_type">
                      <input type="text" maxlength="19" name="creditCardNumber" title="Card Number" value="" data-parsley-group="block1" required>
                      <span>Eg: 654344545465455</span> <span style="float:left;clear:both;width:100%;font:bold 11px Arial, Helvetica, sans-serif;color:#f00;float:left;width:100%;clear:both;"> </span> </div>
                  </div>
                  <div class="card_detail">
                    <label>Expiration Date:</label>
                    <div class="month">
                      <div class="month_select">
                        <select class="select" name="expDateMonth" title="Month" style="">
                          <option value="01">01</option>
                          <option value="02">02</option>
                          <option value="03">03</option>
                          <option value="04">04</option>
                          <option value="05">05</option>
                          <option value="06">06</option>
                          <option value="07">07</option>
                          <option value="08">08</option>
                          <option value="09">09</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                        </select>
                      </div>
                      <span>Ex: 08</span> </div>
                    <div class="year">
                      <div class="year_select">
                        <select name="expDateYear" class="select" title="Year" >
                          <option value="2011">2011</option>
                          <option value="2012" selected="">2012</option>
                          <option value="2013">2013</option>
                          <option value="2014">2014</option>
                          <option value="2015">2015</option>
                          <option value="2016">2016</option>
                          <option value="2017">2017</option>
                          <option value="2018">2018</option>
                          <option value="2019">2019</option>
                          <option value="2020">2020</option>
                        </select>
                      </div>
                      <span>Ex: 2013</span> </div>
                  </div>
                  <div class="card_detail">
                    <label>CVV:</label>
                    <div class="select_card_type">
                      <input type="text" maxlength="4" name="cvv2Number" title="CVV" value="" data-parsley-group="block1" required>
                      <span>Eg: 455</span> <span style="font:bold 11px Arial, Helvetica, sans-serif;color:#f00;float:left;clear:both;width:100%;"> </span> </div>
                  </div>
                  <input name="authorize_pay_submit" type="Submit" value="PAY NOW">
                </div>
              </form>
              {$config.title}{$config.paypal}
              <div id="paypalDetails">
                <form target="paypal" action="{if $config['paypal']['sandbox'] == 'yes'} https://www.sandbox.paypal.com/cgi-bin/webscr {else} https://www.paypal.com/cgi-bin/webscr {/if}" method="post">
                  <input type="hidden" name="cmd" value="_cart">
                  <input type="hidden" name="upload" value="1">
                  <input type="hidden" name="business" value="{$config['paypal']['address']}">
                  <!-- Begin First Item -->
                  <input type="hidden" name="quantity_1" value="1">
                  <input type="hidden" name="item_name_1" value="Buying {$package} Package">
                  <input type="hidden" name="item_number_1" value="{$id}">
                  <input type="hidden" name="amount_1" value="{$amount}">
                  <input type="hidden" name="custom" value="package|{$loged.userid}|{$id}">
                  <input type="hidden" name="notify_url" value="{$config.dpath}package/paypal">
                  <!-- End Third Item -->
                  <input type="hidden" name="currency_code" value="USD">
                  <!--<input type="hidden" name="tax_cart" value="5.13"> -->
                  <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_cart_SM.gif" border="0" name="upload" alt="Make payments with PayPal - it's fast, free and secure!" width="87" height="23">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache}
<script type="text/javascript">
$(function()
{
   $('select[name="payment"]').on('change',function()
   {    
        //console.log(2);
        if($(this).val() == 'paypal')
        {
          $('#cardPayments').hide();
          $('#paypalDetails').show();
        }   
        else
        {
          $('#cardPayments').show();
          $('#paypalDetails').hide();
        }  
   });
});
</script>