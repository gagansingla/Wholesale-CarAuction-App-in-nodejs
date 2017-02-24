{include file="common/header.tpl" nocache}
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
<div class="container">

 
  <div class="slice2">  <img src="{$config['dpath']}images/01.jpg" align="center" style="margin:0px 90px">
    <div class="today_head">
      <div class="today_head_lft">
        <h2 title="TODAY  AUCTION">{$pagetitle}</h2>
      </div>
      <div class="arrow_one"></div>
      
    </div>
    <div class="subslice2">
      
      {assign var="proj" value=$projects.project}
      {include file="projects.tpl" nocache}
      </div>
      
      
    </div>
  </div>
</div>


{include file="common/footer.tpl" nocache}