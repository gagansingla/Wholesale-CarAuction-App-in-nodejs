{include file="common/header.tpl" nocache}
<script type="text/javascript">
        var RecaptchaOptions = {
           theme : 'clean',
           lang  : 'en'
        };
    </script>
<div class="container">
   <div class="login_head">
      <ul>
         <li><a href="{$config.url}/" title="Home">Home</a></li>
         <li><a><img src="{$config['dpath']}images/arr_bg.png" alt="Arrow" height="11" width="13"></a></li>
         <li class="active"><a href="#" title="Login">Register</a></li>
      </ul>
   </div>
   <div class="login-part">
      <h2 title="LOGIN">Register</h2>
      <span class="red">{$error}</span>
   </div>
   <!-- REGISTER STARTS!-->
   <div class="signup_middle">
      <div class="signup_lft">
         <div class="signup_form block1">
            <form action="/register/save" method="POST" data-parsley-validate  id="registerform" enctype="multipart/form-data" onsubmit="return checkTerms();">
            <input type="hidden" name="r_id" value="{$r_id}" />
               <div class="">
                  <div class="log_fields">
                     <div class="colm1_width fl">
                        <p>Email <span class="red">*</span>:</p>
                     </div>
                     <input id="email" name="email" placeholder="Enter your email" maxlength="30" data-parsley-group="block1" required class="textbox" type="email">         
                  </div>
                  <label style="width:250px;"><span class="red"></span></label>
               </div>
               <div class="">
                  <div class="log_fields">
                     <div class="colm1_width fl">
                        <p>Password <span class="red">*</span>:</p>
                     </div>
                     <input id="password" name="password" placeholder="Enter the password" maxlength="20"  data-parsley-group="block1" required class="textbox" type="password">         
                  </div>
                  <label style="width:205px;"><span class="red"></span></label>
               </div>
               <div class="">
                  <div class="log_fields">
                     <div class="colm1_width fl">
                        <p>Retype Password  <span class="red">*</span>:</p>
                     </div>
                     <input id="repassword" name="repassword" placeholder="Repeat the password" maxlength="20" data-parsley-group="block1" required class="textbox" type="password" data-parsley-equalto="#password">            
                  </div>
                  <span class="red"></span>
               </div>
               <div class="">
                  <div class="log_fields">
                     <div class="colm1_width fl">
                        <p>First Name  <span class="red">*</span>:</p>
                     </div>
                     <input id="firstname" name="first_name" placeholder="Enter your firstname" maxlength="20" class="textbox"  data-parsley-group="block1" required type="text">           
                  </div>
                  <span class="red"></span>
               </div>
               <div class="" style="float:left;">
                  <div class="log_fields">
                     <div class="colm1_width fl" style="clear:both;width:100%;">
                        <p>Last Name:</p>
                     </div>
                     <input id="lastname" name="last_name" placeholder="Enter your lastname" maxlength="20" data-parsley-group="block1" required class="textbox" type="text">            
                  </div>
                  <span class="red"></span>
               </div>
               <div>     
               </div>
               <div>
                  <div class="sign_box">
                     
                     <div>
                             
                        {$captchahtml}
                        <p style="color:red;width:100%;float:left;clear:both;"></p>
                     </div>
                  </div>
               </div>
               <div class="sign_check">
                  
                  <div class="check_opt">
                     <input name="agree" value="1" type="checkbox"  id="agree" data-parsley-mincheck="1">          
                     <p class="remeber1">I have read and accept the Terms and Conditions and privacy policy and I am over 
                        18 years of age.<a href="# " title="Terms and Conditions"></a>
                     </p>
                  </div>
                  <p style="color:red;width:100%;float:left;clear:both;"></p>
               </div>
               <div class="sign_button">
                  <div class="sign_button_lft"></div>
                  <div class="sign_button_midd"><input name="signup" value="Sign up" title="Sign up" type="submit"></div>
                  <div class="sign_button_rgt"></div>
               </div>
            </form>
         </div>
      </div>
      <div class="sign_rgt">
         <h2>Already a member?</h2>
         <p>If so you may want to </p>
         <div class="sign_register">
            <div class="signreg_lft"></div>
            <div class="signreg_midd"><a href="{$config.url}/login" title="Sign in">Sign in»</a></div>
            <div class="signreg_rgt"></div>
         </div>
      </div>
   </div>
</div>
<!-- REGISTER ENDS!-->
{include file="common/footer.tpl" nocache}
<script src='https://www.google.com/recaptcha/api.js'></script>