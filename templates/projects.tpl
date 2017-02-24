<script src="js/countdown.js"></script>
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>
{if $proj|count <=  0}
<div class="today_head_lft">No Projects Found</div>
{else}
{foreach $proj as $key => $val}
      <div class="slicebox">
        <div class="slicelabel"> </div>
        <div class="slicelft"> <a href="{$config['url']}/product/view/{$val.id}"><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" width="82" title="{$val.title}" height="83" alt="{$val.title}"></a> </div>
        <div class="slicergt">
         <a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> <label><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.ptitle} </label></a>
          <ul>
            <li> Bid to beat: </li>
            <li> <span class="orange">${($val.rprice)}</span><!-- {$val.id} --> </li>
            <li></li>
            <li> Bid : <span class="orange">${($val.sprice)}</span> </li>
          </ul>
          <!--<p>{$val.day}</p>-->  
          <p id="my{$val.id}">{$val.day}</p> 
		  <script>   clock['{$val.id}'] = document.getElementById('my{$val.id}')
    , targetDate['{$val.id}'] = new Date('{$val.closed}'); 
 
  clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
 clearvar['{$val.id}'] =  setInterval(function(){
    clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
  }, 1000);
  </script>
        </div>
        <div class="slicebottt">
          <div class="slicebottlft">
            <div class="sliders"> <a ><img src="{$config['dpath']}images/head_top2_bg.png" width="18" height="18" alt="Beginner" title="Beginner"></a> </div>
            <a onclick="addtowatchlist({$val.id})" href="javascript:void(0);" title="+ Add to Watchlist" rel="727" class="addwatchlist" name="#"><img src="{$config['dpath']}images/plus_bg.png" width="24" height="25" alt="+ Add to Watchlist"></a> </div>
          <div class="slicebottrgt" style="margin:0 10px 0 0;">
            <div class="bidme">
              <div class="bidnow_lft"></div>
              <div class="bidnow_mid">
                <p> <a href="{$config['url']}/product/bid/{$val.id}">BID ME</a></p>
              </div>
              <div class="bidnow_rgt"></div>
            </div>
          </div>
        </div>
      </div>
      {/foreach}
      {/if}