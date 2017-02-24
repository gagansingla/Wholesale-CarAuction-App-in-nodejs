{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <form name="setautobid" action="/dashboard/autobid" method="post" data-parsley-validate required>
        <h4 class="ds_brd">Auto Bid</h4>
        <div class="row"> 
          <!--<div class="form-group">
            <label for="inputEmail" class="col-md-4" >Auction Types* :</label>
            <div class="col-md-8">
              <select class="form-control">
                <option>Select Auction Type</option>
                <option>Penny Auction</option>
                <option>Peak Auction</option>
              </select>
            </div>
          </div>--> 
        </div>
        <div class="row">
          <div class="form-group">
            <label for="inputEmail" class="col-md-4" >Product Name* :</label>
            <div class="col-md-8">
              <select name="project_id" class="form-control" id="loadmake" required>
                <option value="">Select Product</option>
                
                
                                
                         {foreach $project as $val}
                
                
                
                <option value="{$val.id}">{$val.title}</option>
                
                
                
                         {/foreach}
              
              
              
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="form-group">
            <label for="inputEmail" class="col-md-4" >AutoBid Amount :</label>
            <div class="col-md-8">
              <input type="text" id="autobid_amt" name="amount" placeholder="Enter your Amount" value="" maxlength="20" class="form-control" required>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="form-group">
            <label for="inputEmail" class="col-md-4" >Autobid Start* :</label>
            <div class="col-md-8">
              <input type="text" id="autobid_start_amount" name="start_amount" placeholder="Enter your Autobid start product price" value="" maxlength="20" class="form-control" required>
              <div class="abid_lbl">Auto bid start bid when reach your product current price</div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4"></div>
          <div class="col-md-8">
            <button class="btn save_btn" type="submit">Set AutoBid</button>
            <!--<div class="abid_lbl">No Autobid products at the moment</div>-->
          </div>
        </div>
      </form>
      <div class="row mblue_box">
      <div class="col-md-3">Image</div>
      <div class="col-md-3">Title</div>
      <div class="col-md-2">End Time </div>
      <div class="col-md-2">Balance </div>
      <div class="col-md-2"> Options</div>
    </div>
    {if $Autobids|count <=  0}
    <div class="col-md-12 text-center m-top-20 font-12">No Results Found</div>
    {else}
    {foreach $Autobids as $key => $alist}
    <div class="row mblue_box1">
      <div class="col-md-3"><a href=""><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"></a></div>
      <div class="col-md-3"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$alist.title}</a></div>
      <div class="col-md-2">{$alist.closedon}</div>
      <div class="col-md-2">{$alist.balance}</div>
      <div class="col-md-2"><a title="View" href="{$config['url']}/product/view/{$alist.id}">View</a></div>
    </div>
    {/foreach}
    {/if}
    </div>
     </div>
</div>
{include file="common/footer-1.tpl" nocache} 