<div class="pric_l">
  <div class="rtext">${$projects.wprice}</div>
  <div class="gray_txt">{if $projects.market_status == 'open' or $projects.market_status == 'draft'}<h3 class="countdown" id="my{$projects.id}">{$projects.day}</h3>{else} Auction Closed{/if}</div>
  <div class="proc_title">{$projects.title}</div>
  {if $projects.market_status == 'open'}<button class="btn bid_now" data-toggle="modal" data-target="#confirmbid ">BID NOW</button>{/if}
  <div class="gray_txt">
    <div>Value Price ${$projects.mprice}</div>
    <div>Bids Credit ${$config.general['eachbidpay']}</div>
  </div>
  {if $projects.market_status == 'open' and $projects.buynow}<div class="dashed_sep"></div>
 <button class="btn btn-primary" data-toggle="modal" data-target="#buybid ">Buy Now ${$projects.bprice}</button>{/if}
</div>
<div class="bid_history">
  <div class="bid_hh">BID HISTORY</div>
  <div class="bid_his"> {if $bcnt == 0}
    <ul>
      <li>
        <p class="no_data proc_title">No Bids Yet</p>
      </li>
    </ul>
    {else}
    {foreach $bids as $key => $val}
    <div>{$val.name} <!--2014-12-17 03:29:39--> ${$val.proposed_amount}</div>
    {/foreach}
    <div class="total_bids">Total Bids : <span class="lcntbid">{$bcnt}</span> <span class="pull-right"><a href=""><i class="fa fa-chevron-right"></i></a></span></div>
    {/if} </div>
</div>