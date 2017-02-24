{include file="/common/header-1.tpl" nocache}
<div class="row">
            <div class="col-md-9">
                <div class="news_head">Blogspot</div>
                <div class="news_posth"><h3>{$blog.title}</h3></div>
                  <div><img src="{$config.url}/images/note.png" alt="" /><span class="post-date">{$val.date_add}</span> Posted by {$val.first_name} {$val.last_name}  0 Replies</div>
                    {if $blog.image != ''}<div class="blog_img"><img src="{$config.url}/uploads/blog/{$blog.avatar}" style="max-width:100%;" /> </div>{/if} 
                                           
                                            


                                            <p>{$blog.description}</p>
                        </div>
                        <div class="col-md-3">
    <div class="sidebar">
      <div id="search-2" class="widget widget_search">
        <form class="search" id="blogsearch" method="get" action="{$config.url}/blog/">
          <fieldset>
            <div class="input-group">
              <input class="form-control" placeholder="Type &amp; Enter" type="text" name="search">
              <span class="input-group-addon" onclick="$('#blogsearch').submit();"><i class="fa fa-search"></i></span> </div>
          </fieldset>
        </form>
      </div>
      <div id="recent-posts-2" class="widget widget_recent_entries">
        <h4 class="widget-title">Recent Posts</h4>
        <ul>
          {foreach $rblog as $key => $val}
          
          <li> <a href="{$config.url}/blog/{$val.id}">{$val.title}</a> </li>
   
          {/foreach}
         </ul>
      </div>
      <!--<div id="recent-comments-2" class="widget widget_recent_comments">
        <h4 class="widget-title">Recent Comments</h4>
        <ul id="recentcomments">
        </ul>
      </div>
      <div id="archives-2" class="widget widget_archive"><h4 class="widget-title">Archives</h4>       <ul>
    <li><a>November 2014</a></li>
    <li><a>October 2014</a></li>
    <li><a>September 2014</a></li>
        </ul>
</div>--> 
      
    </div>
 </div>
   
           
{include file="/common/footer-1.tpl" nocache}
<script type="text/javascript">
$(function(){
    $('.main_container').addClass('review');
})
</script>
