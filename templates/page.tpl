{include file="common/header-1.tpl" nocache} 
<script type="text/javascript">
function update(obj) {
  var date = new Date()

  var hours = date.getHours();
  if (hours < 10) hours = '0'+hours
  document.getElementById('hour').innerHTML = hours

  var minutes = date.getMinutes()
  if (minutes < 10) minutes = '0'+minutes
  document.getElementById('min').innerHTML = minutes

  var seconds = date.getSeconds()
  if (seconds < 10) seconds = '0'+seconds
  document.getElementById('sec').innerHTML = seconds
}
</script>
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
  <div class="reg_try"> <img src="{$config.url}/images/reg_try.png" alt="" /> </div>
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
<div class="today_auctions">
  <div class="clearfix">
    <div class="pull-left td_act">{$pagetitle}</div>
  </div>
  {assign var="proj" value=$projects.project}
  {include file="projects-new.tpl" nocache} </div>
  </div>
  </div>
<div class="node_jsb">
  <div class="pull-left njsb">
    <div class="pbld">Product build <span>via</span></div>
  </div>
  <div class="pull-left left_nj">
    <p>After detailed research we built in Node.Js.</p>
    <p>Problem</p>
    <p> 1. Bidding in Php delay in response from Server. As you grow to million of users server slown down in PHP
</p>
<p>Solution</p>
    <p>1. In Node.Js server responds back in milliseconds.</p>
    <p>2. Have you ever worked with real time events? If so, (Node.js penny auction by AuctionSoftware.com) is the best solution.</p>
    <p>3. What would you plan to use for storing real-time bidding while processing it server –> client and reverse (MySql or other database/storage)? We're talking about millisecond events here that can be accomplished only via Node.Js developed by AuctionSoftware.com.</p>
  </div>


</div>
<script> 

 function meee(id,dateee)
  {  

   clearInterval(clearvar[id]);
    clock[id] = document.getElementById('my'+id)
    , targetDate[id] = new Date(dateee); // Jan 1, 2050;
 
  clock[id].innerHTML = countdown(targetDate[id]).toString();
  clearvar[id] =  setInterval(function(){
    clock[id].innerHTML = countdown(targetDate[id]).toString();
  }, 1000);
    
  }
      socket.on('date', function(data){
        $('#txtdate').text(data.date);
    
    });
     socket.on('bidAddtime', function(msg){   
     meee(msg.id,msg.date);

     });

</script> 
{include file="common/footer-1.tpl" nocache}