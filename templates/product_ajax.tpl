 <div class="detail_page_top_mid">
          <div class="detail_big_history">
            <h1>Bid Histories</h1>
          </div>
          <div class="bid_history"  style="" rel="0" name="344">
            
            <div class="detail_big_history_content">
              <p>{$bcnt} Bids Total</p>
            </div>
            <div class="detail_big_history_current_winning">
              <h1>Current winning Bidders</h1>
            </div>
            <div class="winning_list">
              {if $bcnt == 0}
              <ul>
                <li>
                  <p class="no_data">No Bids Yet</p>
                </li>
              </ul>
             {else}
              <div class="winning_list">
              {foreach $bids as $key => $val}
              <ul style="margin:0">
                <li style="margin:0;padding:3px 5px;">
                  <div class="winning_list_left"><h1>{$val.name}</h1></div>
                  <div class="winning_list_right"><span class="orange" style="font-size:13px;">${$val.proposed_amount}</span></div>
                </li>
              <ul>                
              {/foreach}
             
              </div>

             {/if} 
            </div>
          </div>
        </div>
        <div class="detail_page_top_right">
          <div class="hb_bg_mid">
            <ul class="clearfix">
              <li>
                <p><span>Highest Bidder :</span> <strong class="lastbidder">{if $bids|count == 0}No Bids Yet{else} {$bids[0]['name']} {/if}</strong></p>
              </li>
              <li>
                {if $projects.market_status == 'open' or $projects.market_status == 'draft'}<h3 class="countdown" id="my{$projects.id}">{$projects.day}</h3>
                <label style=" float:left;padding-left:72px;display:block;color:#666;"><span class="hrs">&nbsp;Days&nbsp;</span><span class="min">Hrs</span><span class="min">&nbsp;Min</span><span class="sec">&nbsp;Sec</span></label>{else} Auction Closed{/if}
              </li>
             {if $projects.market_status == 'open' and $projects.buynow} <li>
                <div class="hb_buy_now_right">
                  <div class="hb_buy_now_button">
                    <div class="hb_buy_now_button_left"> </div>
                    <div class="hb_buy_now_button_mid">
                      <p> <a href="{$config.url}/product/buy/{$projects.id}" title="Buy Now">Buy Now</a> </p>
                    </div>
                    <div class="hb_buy_now_button_right"> </div>
                  </div>
                </div>
                <div class="hb_buy_now_left">
                  
                         <h3 class="currentprice"><font class="">$</font> {$projects.bprice}</h3>
                 </div>
                
              </li>{/if}
              <li>
               
               <div class="hb_place_bid_button">
                      <div class="hb_place_bid_button_left"> </div>
                      <div class="hb_place_bid_button_mid">
                         
                  
                        {if $projects.market_status == 'open'}<p> <a href="{$config.url}/product/bid/{$projects.id}" name="" class="bid" rel=""  title="Place My Bid">Place My Bid</a> </p>{else} <p><a href="#" name="" class="bid" rel="">Auction Closed</a></p>{/if}
                      </div>
                      <div class="hb_place_bid_button_right"> </div>
                    </div>

                      <div class="hb_buy_now_left"> <h3 class="currentprice"><font class="">$</font> {$projects.wprice}</h3></div>
                 
                    
                  
               
              </li>
              <li class="border_none">
                <div class="hb_auction_header">
                  <p>With each bid, the auction</p>
                </div>
              </li>
              <li class="hb_li_padding_bottom_none">
                <div class="hb_buy_now_left">
                  <p class="hb_font_weight_normal">Price Increases by</p>
                </div>
                <div class="hb_buy_now_right hb_buy_now_right1"> <span class="hb_font_size_small">
                  <p class="bidamount"><font class="">$</font> {$projects.iprice}</p>
                  </span> </div>
              </li>
              <li class="hb_li_padding_bottom_none">
                <div class="hb_buy_now_left">
                  <p class="hb_font_weight_normal">Retail Price</p>
                </div>
                <div class="hb_buy_now_right hb_buy_now_right1">
                  <p class="hb_font_size_small"><font class="">$</font> {$projects.mprice}</p>
                </div>
              </li>
              <li class="hb_li_padding_bottom_none">
                <div class="hb_buy_now_left">
                  <p class="hb_font_weight_normal">Buynow Price</p>
                </div>
                <div class="hb_buy_now_right hb_buy_now_right1"> <span class="hb_font_size_small">
                  <p class="pricepaid"><font class="">$</font> {$projects.bprice}</p>
                  </span> </div>
              </li>
              <li class="border_none">
                <p class="save_over_text" style="padding-left:0px;">Save over <span class="saveover"><font class="">$</font> {$projects.mprice - $projects.bprice}</span></p>
                <p class="hb_font_weight_normal" style="padding-left:0px;"><b>from the normal retail price!!</b></p>
              </li>
            </ul>
          </div>
        </div>