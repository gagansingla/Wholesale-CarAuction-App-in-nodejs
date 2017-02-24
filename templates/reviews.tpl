{include file="/common/header-1.tpl" nocache}
<div class="row">
            <div class="col-md-2 lef_col ">
                 <div class="white_box">
    <div class="whead">{$_phrase.welcome}</div>
    <div class="b_lbl">We Support below Types in our Release 1</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is Penny Auction?</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is  Peak Auction?</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reserve Bidding</div>
  </div>
  <div class="white_box">
    <div class="whead">Bidding Type</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Beginner</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Penny Auction</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Peak Auction</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reverse Auction</div>
  </div>
  <div class="reg_try"> <img src="{$config.url}/images/reg_try.png" alt="" /> </div>
            </div>
            <div class="col-md-6">
                <h3 class="rev_head">Reviews</h3>
               
                    {foreach $review as $key => $val} 
                     <div class="m-top-20">  
                    <div class="clearfix">
                        <div class="pull-left rhead">{$val.subject}</div>
                        <div class="pull-right rating">
                         {if $val.rating == .5} 
                            <img src="{$config.">url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Very Bad"</span>
                           {elseif $val.rating == 1} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Bad"</span>
                            {elseif $val.rating == 1.5} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Bad"</span>
                           {elseif $val.rating == 2} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Bad"</span>
                            {elseif $val.rating == '2.5'} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Normal"</span>
                           {elseif $val.rating == 3} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Average"</span>
                            {elseif $val.rating == '3.5'} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Average"</span>
                           {elseif $val.rating == 4} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Excellent"</span>
                            {elseif $val.rating == '4.5'} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/wstar.png" alt=""><br /><span>"Excellent"</span>
                           {elseif $val.rating == 5} 
                            <img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><img src="{$config.url}/images/gstar.png" alt=""><br /><span>"Good"</span>  
                           {/if} 
                        </div>
                    </div>
                    <p class="rev_txt">
                        {$val.message}.
                    </p>
                    <div class="customer_name">
                        - {$val.first_name} {$val.last_name}
                    </div></div>
                    {/foreach}
                    {$pagination_html}
            </div>

            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Write a Review
                    </div>
                    <div class="panel-body">
                        <div>
                            Dear User or Visitor,
                        </div>
                        <div>
                            We encourage all of our customers to share their thoughts, so if you'd like to be featured in one of our customer review posts and tell us what's on your mind!
                        </div>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#review_form">Click here to Review</button>
                    </div>
                </div>
                    <div class="panel panel-default">
                    <div class="panel-heading">Contact Support</div>
                    <div class="panel-body">
                        Got a question? We've got answers. For simple solutions, check out our easy-to-access Help section. For stickier situations, please email us at
                        <a href="">support@auctionsoftware.com </a>
                    </div>
                    </div>
                </div>
            
            </div>
    <div class="ds modal fade fcorn-register reg" id="review_form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header csgray_box">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close_buttons_register">x</button>
                <h4 class="modal-title blue_txt">Write Your Review</h4>
         </div>

          <form method="post" data-validate="parsley" enctype="multipart/form-data" id="review-form" action="{$config.url}/dashboard/review/">
            <div class="form-wrapper"> 
                    
                    <div class="row">
                        <div class="col-md-6">Review Headline (if you colud say it in once sentence, what would you say?)</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6"><input name="subject"  data-parsley-group="block1" required id="subject" maxlength="99" value="" onkeyup="return limitlength(this,99,'info_label')" type="text" class="gui-input"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">Write Your Review (minimum 120 charecters)</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <textarea name="message" id="message" class="gui-input"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Rate our service</div>
                        <div class="ratings col-md-3">
                                   <input id="input-27" class="rating"  name="rating">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-3"><input type="submit" class="btn btn-primary" value="Submit"></div>
                       
                    </div>
            </div>
          </form>
</div>       
{include file="/common/footer-1.tpl" nocache}

<script type="text/javascript">
$(function(){
    $('.main_container').addClass('review');
})

</script>
<script type="text/javascript">
$(function()
{
  $("#input-27").on("rating.change", function(event, value, caption) {
            $("#input-27").rating("refresh", {disabled:true, showClear:false});
            $("#input-27").val(value);
        });
});</script>