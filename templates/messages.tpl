{include file="common/header-1.tpl" nocache}
<div class="main_container">
<div class="row dashboard">
<div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
<div class="col-md-9">
<div class="row ds_brd">
  <div class="col-md-8">
    <h4>My Messages</h4>
  </div>
  <div class="col-md-3">
    <button class="btn btn-blue"><a href="{$config.url}/dashboard/messages/compose">Compose</a></button>
  </div>
</div>

<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" {if $action == ''} class="active" {/if}><a href="{$config.url}/dashboard/messages/" >All</a></li>
  <li role="presentation" {if $action == 'inbox'} class="active" {/if}><a href="{$config.url}/dashboard/messages/inbox">Inbox</a></li>
  <li role="presentation" {if $action == 'sent'} class="active" {/if}><a href="{$config.url}/dashboard/messages/sent">Sent</a></li>
  <li role="presentation" {if $action == 'archive'} class="active" {/if}><a href="{$config.url}/dashboard/messages/archive">Archive</a></li>
  <li role="presentation" {if $action == 'delete'} class="active" {/if}><a href="{$config.url}/dashboard/messages/delete">Delete</a></li>
  <li role="presentation" {if $action == 'compose'} class="active" {/if}><a href="{$config.url}/dashboard/messages/compose">Compose</a></li>
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="home"> {include file="message-list.tpl" nocache} </div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 