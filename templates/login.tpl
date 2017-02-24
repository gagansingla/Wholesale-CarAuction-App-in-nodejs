{include file="common/header-1.tpl" nocache}
<div class="row">
 
  <!-- LOGIN STARTS!-->
  
  <div class="login_middle  m-top-50">
    <div class="login_lft">
      <form action="{$config['url']}/login/save" method="post"  enctype="multipart/form-data"  >
        <div class="login_form">
          <div class="log_fields">
            <p>User Name <span class="red">*</span>:</p>
            <input type="text" id="username" name="username" placeholder="Enter username"  class="textbox">
          </div>
          <span class="red fl"></span>
          <div class="log_fields">
            <p>Password <span class="red">*</span>:</p>
            <input type="password" id="password" name="password" value=""  class="textbox">
          </div>
        </div>
        <span class="red fl"></span>
        <div class="login_check">
          <input type="checkbox" name="remember" value="1">
          <p class="remeber">Remember me</p>
          <label><a href="{$config['url']}/login/forgot_password" title="Forgot password">Forgot password?</a></label>
        </div>
      
            <input type="submit" name="login" value="Signin" class="btn save_btn" title="SIGNIN">
         
        <div style="padding-top: 10px; float:left"> <span class="Loading_Img" style="display:none">
          <p style="width:195px; padding-left: 0px; color:black;font: bold 13px/16px arial;"> <img src="http://unieauction.com/platinum-demo/public/white/images/ajax-loader.gif" alt="loading"> <strong class="pls_wit" style="padding-top:0px; float:right; margin: -14px 90px;"> Processing... </strong> </p>
          </span> </div>
      </form>
    </div>
    <div class="login_rgt">
      <!--<div class="login-social">
        <p>Login With</p>
      </div>
      <div class="login_net">
        <ul>
          <li><a href="#" title="Login with facebook"><img src="{$config['dpath']}images/f_connect.png" alt="Login with facebook"></a></li>
          <li><a href="#" title="Twitt-connect"><img src="{$config['dpath']}images/twitt_connect.png" alt="Twitt-connect"></a> </li>
        </ul>
      </div>
      <span class="other">
      <label>(OR)</label>
      </span>-->
      <div class="login_account">
        <h2>Don't have an account</h2>
        <p>Register now to bid, buy, or sell on any Auction site worldwide. It's easy and FREE. Already registered</p>
        <p>If you want to sign in, you'll need to register first.</p>
        <p>Registration is fast and FREE.</p>
       <a href="{$config.url}/register" title="Register" class="btn save_btn">Register</a>
      </div>
    </div>
  </div>
  <!-- LOGIN ENDS!--> 
  
</div>

{include file="common/footer-1.tpl" nocache}