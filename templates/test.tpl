{include file="common/header.tpl" nocache}
<div class="container">
  <div class="slice2">
    <div class="today_head">
      <div class="today_head_lft">
        <h2 title="TODAY  AUCTION">Today  Auctions</h2>
      </div>
      <div class="arrow_one"></div>
      <div class="today_head_rgt">
        <p><a href="live.html" title="View All">View All</a></p>
      </div>
    </div>
    <div class="subslice2"> {assign var="proj" value=$projects.open_project}
      {include file="projects.tpl" nocache} </div>
  </div>
</div>
</div>
        

<script> 
 socket.on('bidAddtime', function(msg){		
       $(msg).html(msg);
 });
 
 var resultss = {
            id: "126",
            date: "2/30/2015"           
        }
	socket.emit('bidAddtime', resultss);	
	
	
function bidme(ProjectId,addsecs)
{
	
	 var resultss = {
            id: "126",
            date: "dfsdfsd"           
        }
	socket.emit('bidAddtime', resultss);	
	/*var t = new Date(addsecs);
   $('#my'+ProjectId).countdowntimer({
                                        dateAndTime : t
	 });
		*/								
										
 
}

</script> 


{include file="common/footer.tpl" nocache}