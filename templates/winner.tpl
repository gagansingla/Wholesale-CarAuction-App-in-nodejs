{include file="common/header-1.tpl" nocache}
    <div class="row">
      <div class="col-md-2 left_col">
        <div class="white_box">
          <div class="whead">Welcome</div>
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
        <div class="reg_try">
          <img src="{$config.url}/images/reg_try.png" alt="" />
        </div>
      </div>
      <div class="col-md-10">
        <div class="banner">
          <div class="bann_rht">
            <div class="rb_head">Own Your Penny Auction at Auction Software.com</div>
            <div class="rb_shead">Our penny auction product runs on NODE.JS</div>
            <div class="clearfix">
              <div class="pull-left"><img src="{$config.url}/images/node_js.png" alt="" /></div>
              <div class="pull-right"><img src="{$config.url}/images/buy_now.png" alt="" /></div>
            </div>
          </div>
        </div>
        <div class="winners">winners</div>
        {foreach $projects as $key => $val} 
        <div class="panel panel-primary bb_box">
          <div class="panel-body">
            <div class="wp_left">
              <div class="media">
                <div class="pull-left media-object blue_bck">
                  <img src="{if $val.uavatar == ''} {$config['imgpath']}no_img.png {else if $val.uavatar != ''}{$config['imgpath']}profile/{$val.uavatar}{/if}" width="100" height="100" alt="{$val.title}" title="{$val.title}" border="0"></div>
               
                {assign var="percentage" value=($val.mprice*100/$val.wprice}
                <div class="media-body">
                  <div>{$val.title}</div>
                  <div>Bought For Only:{$val.wprice}</div>
                  <div>Price:{$val.mprice}</div>
                  <div>Auction closed on:{$val.date_closed}</div>
                </div>
              </div>
              <div class="wpro_btm">
                <div class="con_lbl pblue_txt">Winner:{$val.name}</div>
                <div class="con_lbl pred_txt">Location:{$val.state}</div>
                <div class="con_lbl pred_txt">{$val.country}</div>
                <!--<div class="con_lbl pblue_txt">Profile:{$val.profile}</div>-->
              </div>
            </div>
            <div class="wp_right">
              <div class="green_ribbon">You Saved  {$percentage}%</div>
              <div>
                <img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" width="122" height="122" alt="{$val.title}" title="{$val.title}" border="0"></div>
                
            </div>
          </div>
        </div>
        {/foreach}
      </div>
    </div>
    <div class="node_jsb">
    <div class="pull-left njsb">
      <div class="pbld">Product build <span>via</span></div>
    </div>
    <div class="pull-left left_nj">
    <p>After detailed research we built in Node.Js. Problem is in bidding for penny auction in Php other softwares when 2-3 bidders bid there is a delay in response. In Node.Js server responds back in milliseconds and has data for</p>

    <p>1). Have you ever worked with real time events? If so, (Node.js penny auction by AuctionSoftware.com) is the best solution.</p>

    <p>2). What would you plan to use for storing real-time bidding while processing it server –> client and reverse (MySql or other database/storage)? We're talking about millisecond events here that can be accomplished only via Node.Js software for penny developed by AuctionSoftware.com</p>
    </div>
    </div>

{include file="common/footer-1.tpl" nocache} 
