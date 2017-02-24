{include file="/admincp/header.tpl" nocache}
<div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Users <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> {if $users.id == 0 or $users.id == ''} Add {else} Edit {/if}<i class="fa fa-hand-o-right"></i> {$users.first_name} {$users.last_name} 
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                       <div class="col-lg-12">
                        {if $error == 'saved'}
                         <div class="alert alert-success">
                               <strong>Saved!</strong> {$users.first_name} profile was successfully changed.
                           </div>
                        {elseif $error != ''}   
                          <div class="alert alert-danger">
                               <strong>{$error}</strong> 
                           </div>
                        {/if}   
                        </div>
                        <form enctype="multipart/form-data" class="admin_form" data-parsley-validate method="post" enctype="multipart/form-data" action="{$config.url}/admincp/users/save">
                         <input type="hidden" value="{$users.id}" name="id" />	
                         <div class="col-lg-4">	

                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" name="email" type="email" value="{$users.email}" data-parsley-group="block1" required>
                               
                            </div>

                            <div class="form-group">
                                <label>Password <small>(leave empty to keep same)</small></label>
                                <input class="form-control" name="password" data-parsley-group="block1" >
                            </div>

                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input class="form-control" name="cpassword" data-parsley-group="block1" >
                            </div>

                            <div class="form-group">
                                <label>First Name</label>
                                <input class="form-control" placeholder="Enter First Name" value="{$users.first_name}" name="first_name" data-parsley-group="block1" required>
                            </div>

                         

                           
                            <div class="form-group">
                                <label>Last Name</label>
                                <input class="form-control" placeholder="Enter Last Name" value="{$users.last_name}" name="last_name" data-parsley-group="block1" required>
                            </div>

                            
        <div class="form-group">
          <label for="inputEmail">Address Line 1:</label>
        
            <input type="text" id="address_line1" name="address1" placeholder="Enter your address line1" class="form-control" value="{$users.address1}" title="Address Line 1" maxlength="50" required>
          
        </div>
    
        <div class="form-group">
          <label for="inputEmail"  >Address Line 2:</label>
         
            <input type="text" id="address_line2" name="address2" placeholder="Enter your address line2" class="form-control"  value="{$users.address2}" title="Address Line 2" maxlength="50">
          </div>
        
        <div class="form-group">
          <label for="inputEmail"  >Country:</label>
      
            <select name="country" id="country" class="form-control" required>
              <option value="" selected="selected">Select Country</option>
              <option value="AF">Afghanistan</option>
              <option value="AL">Albania</option>
              <option value="DZ">Algeria</option>
              <option value="AS">American Samoa</option>
              <option value="AD">Andorra</option>
              <option value="AO">Angola</option>
              <option value="AI">Anguilla</option>
              <option value="AQ">Antarctica</option>
              <option value="AG">Antigua and Barbuda</option>
              <option value="AR">Argentina</option>
              <option value="AM">Armenia</option>
              <option value="AW">Aruba</option>
              <option value="AU">Australia</option>
              <option value="AT">Austria</option>
              <option value="AZ">Azerbaijan</option>
              <option value="BS">Bahamas</option>
              <option value="BH">Bahrain</option>
              <option value="BD">Bangladesh</option>
              <option value="BB">Barbados</option>
              <option value="BY">Belarus</option>
              <option value="BE">Belgium</option>
              <option value="BZ">Belize</option>
              <option value="BJ">Benin</option>
              <option value="BM">Bermuda</option>
              <option value="BT">Bhutan</option>
              <option value="BO">Bolivia</option>
              <option value="BA">Bosnia and Herzegowina</option>
              <option value="BW">Botswana</option>
              <option value="BV">Bouvet Island</option>
              <option value="BR">Brazil</option>
              <option value="IO">British Indian Ocean Territory</option>
              <option value="BN">Brunei Darussalam</option>
              <option value="BG">Bulgaria</option>
              <option value="BF">Burkina Faso</option>
              <option value="BI">Burundi</option>
              <option value="KH">Cambodia</option>
              <option value="CM">Cameroon</option>
              <option value="CA">Canada</option>
              <option value="CV">Cape Verde</option>
              <option value="KY">Cayman Islands</option>
              <option value="CF">Central African Republic</option>
              <option value="TD">Chad</option>
              <option value="CL">Chile</option>
              <option value="CN">China</option>
              <option value="CX">Christmas Island</option>
              <option value="CC">Cocos (Keeling) Islands</option>
              <option value="CO">Colombia</option>
              <option value="KM">Comoros</option>
              <option value="CG">Congo</option>
              <option value="CK">Cook Islands</option>
              <option value="CR">Costa Rica</option>
              <option value="CI">Cote D'Ivoire</option>
              <option value="HR">Croatia</option>
              <option value="CU">Cuba</option>
              <option value="CY">Cyprus</option>
              <option value="CZ">Czech Republic</option>
              <option value="DK">Denmark</option>
              <option value="DJ">Djibouti</option>
              <option value="DM">Dominica</option>
              <option value="DO">Dominican Republic</option>
              <option value="TP">East Timor</option>
              <option value="EC">Ecuador</option>
              <option value="EG">Egypt</option>
              <option value="SV">El Salvador</option>
              <option value="GQ">Equatorial Guinea</option>
              <option value="ER">Eritrea</option>
              <option value="EE">Estonia</option>
              <option value="ET">Ethiopia</option>
              <option value="FK">Falkland Islands (Malvinas)</option>
              <option value="FO">Faroe Islands</option>
              <option value="FJ">Fiji</option>
              <option value="FI">Finland</option>
              <option value="FR">France</option>
              <option value="FX">France, Metropolitan</option>
              <option value="GF">French Guiana</option>
              <option value="PF">French Polynesia</option>
              <option value="TF">French Southern Territories</option>
              <option value="GA">Gabon</option>
              <option value="GM">Gambia</option>
              <option value="GE">Georgia</option>
              <option value="DE">Germany</option>
              <option value="GH">Ghana</option>
              <option value="GI">Gibraltar</option>
              <option value="GR">Greece</option>
              <option value="GL">Greenland</option>
              <option value="GD">Grenada</option>
              <option value="GP">Guadeloupe</option>
              <option value="GU">Guam</option>
              <option value="GT">Guatemala</option>
              <option value="GN">Guinea</option>
              <option value="GW">Guinea-bissau</option>
              <option value="GY">Guyana</option>
              <option value="HT">Haiti</option>
              <option value="HM">Heard and Mc Donald Islands</option>
              <option value="HN">Honduras</option>
              <option value="HK">Hong Kong</option>
              <option value="HU">Hungary</option>
              <option value="IS">Iceland</option>
              <option value="IN">India</option>
              <option value="ID">Indonesia</option>
              <option value="IR">Iran (Islamic Republic of)</option>
              <option value="IQ">Iraq</option>
              <option value="IE">Ireland</option>
              <option value="IL">Israel</option>
              <option value="IT">Italy</option>
              <option value="JM">Jamaica</option>
              <option value="JP">Japan</option>
              <option value="JO">Jordan</option>
              <option value="KZ">Kazakhstan</option>
              <option value="KE">Kenya</option>
              <option value="KI">Kiribati</option>
              <option value="KP">North Korea</option>
              <option value="KR">Korea, Republic of</option>
              <option value="KW">Kuwait</option>
              <option value="KG">Kyrgyzstan</option>
              <option value="LA">Lao People's Democratic Republic</option>
              <option value="LV">Latvia</option>
              <option value="LB">Lebanon</option>
              <option value="LS">Lesotho</option>
              <option value="LR">Liberia</option>
              <option value="LY">Libyan Arab Jamahiriya</option>
              <option value="LI">Liechtenstein</option>
              <option value="LT">Lithuania</option>
              <option value="LU">Luxembourg</option>
              <option value="MO">Macau</option>
              <option value="MK">Macedonia</option>
              <option value="MG">Madagascar</option>
              <option value="MW">Malawi</option>
              <option value="MY">Malaysia</option>
              <option value="MV">Maldives</option>
              <option value="ML">Mali</option>
              <option value="MT">Malta</option>
              <option value="MH">Marshall Islands</option>
              <option value="MQ">Martinique</option>
              <option value="MR">Mauritania</option>
              <option value="MU">Mauritius</option>
              <option value="YT">Mayotte</option>
              <option value="MX">Mexico</option>
              <option value="FM">Micronesia, Federated States of</option>
              <option value="MD">Moldova, Republic of</option>
              <option value="MC">Monaco</option>
              <option value="MN">Mongolia</option>
              <option value="MS">Montserrat</option>
              <option value="MA">Morocco</option>
              <option value="MZ">Mozambique</option>
              <option value="MM">Myanmar</option>
              <option value="NA">Namibia</option>
              <option value="NR">Nauru</option>
              <option value="NP">Nepal</option>
              <option value="NL">Netherlands</option>
              <option value="AN">Netherlands Antilles</option>
              <option value="NC">New Caledonia</option>
              <option value="NZ">New Zealand</option>
              <option value="NI">Nicaragua</option>
              <option value="NE">Niger</option>
              <option value="NG">Nigeria</option>
              <option value="NU">Niue</option>
              <option value="NF">Norfolk Island</option>
              <option value="MP">Northern Mariana Islands</option>
              <option value="NO">Norway</option>
              <option value="OM">Oman</option>
              <option value="PK">Pakistan</option>
              <option value="PW">Palau</option>
              <option value="PA">Panama</option>
              <option value="PG">Papua New Guinea</option>
              <option value="PY">Paraguay</option>
              <option value="PE">Peru</option>
              <option value="PH">Philippines</option>
              <option value="PN">Pitcairn</option>
              <option value="PL">Poland</option>
              <option value="PT">Portugal</option>
              <option value="PR">Puerto Rico</option>
              <option value="QA">Qatar</option>
              <option value="RE">Reunion</option>
              <option value="RO">Romania</option>
              <option value="RU">Russian Federation</option>
              <option value="RW">Rwanda</option>
              <option value="KN">Saint Kitts and Nevis</option>
              <option value="LC">Saint Lucia</option>
              <option value="VC">Saint Vincent and the Grenadines</option>
              <option value="WS">Samoa</option>
              <option value="SM">San Marino</option>
              <option value="ST">Sao Tome and Principe</option>
              <option value="SA">Saudi Arabia</option>
              <option value="SN">Senegal</option>
              <option value="SC">Seychelles</option>
              <option value="SL">Sierra Leone</option>
              <option value="SG">Singapore</option>
              <option value="SK">Slovak Republic</option>
              <option value="SI">Slovenia</option>
              <option value="SB">Solomon Islands</option>
              <option value="SO">Somalia</option>
              <option value="ZA">South Africa</option>
              <option value="GS">South Georgia &amp; South Sandwich Islands</option>
              <option value="ES">Spain</option>
              <option value="LK">Sri Lanka</option>
              <option value="SH">St. Helena</option>
              <option value="PM">St. Pierre and Miquelon</option>
              <option value="SD">Sudan</option>
              <option value="SR">Suriname</option>
              <option value="SJ">Svalbard and Jan Mayen Islands</option>
              <option value="SZ">Swaziland</option>
              <option value="SE">Sweden</option>
              <option value="CH">Switzerland</option>
              <option value="SY">Syrian Arab Republic</option>
              <option value="TW">Taiwan</option>
              <option value="TJ">Tajikistan</option>
              <option value="TZ">Tanzania, United Republic of</option>
              <option value="TH">Thailand</option>
              <option value="TG">Togo</option>
              <option value="TK">Tokelau</option>
              <option value="TO">Tonga</option>
              <option value="TT">Trinidad and Tobago</option>
              <option value="TN">Tunisia</option>
              <option value="TR">Turkey</option>
              <option value="TM">Turkmenistan</option>
              <option value="TC">Turks and Caicos Islands</option>
              <option value="TV">Tuvalu</option>
              <option value="UG">Uganda</option>
              <option value="UA">Ukraine</option>
              <option value="AE">United Arab Emirates</option>
              <option value="GB">United Kingdom</option>
              <option value="US">United States</option>
              <option value="UM">United States Minor Outlying Islands</option>
              <option value="UY">Uruguay</option>
              <option value="UZ">Uzbekistan</option>
              <option value="VU">Vanuatu</option>
              <option value="VA">Vatican City State (Holy See)</option>
              <option value="VE">Venezuela</option>
              <option value="VN">Viet Nam</option>
              <option value="VG">Virgin Islands (British)</option>
              <option value="VI">Virgin Islands (U.S.)</option>
              <option value="WF">Wallis and Futuna Islands</option>
              <option value="EH">Western Sahara</option>
              <option value="YE">Yemen</option>
              <option value="YU">Yugoslavia</option>
              <option value="CD">Democratic Republic of Congo</option>
              <option value="ZM">Zambia</option>
              <option value="ZW">Zimbabwe</option>
            </select>
          </div>
        
        <div class="form-group">
          <label for="inputEmail" >State:</label>
         
            <input type="text" id="state" name="state" placeholder="Enter state" class="form-control" value="{$users.state}" title="State" maxlength="20" required>
          </div>
        
      
        <div class="form-group">
          <label for="inputEmail"  >City:</label>
        
            <input type="text" id="town" name="city" placeholder="Enter city" class="form-control" value="{$users.city}" title="city" maxlength="20" required>
          </div>
        
     

                            

                            <button type="submit" class="btn btn-success"> <i class="fa fa-save"></i> Submit</button>
                           </div>
                           <div class="col-lg-2"></div>	
                           <div class="col-lg-4">	
                              <div class="form-group">

                                <label>Profile Pic</label>
                                <div class="pro_image"><img src="{if $users.avatar == ''} {$config['imgpath']}no_img.png {else if $users.avatar != ''}{$config['imgpath']}profile/{$users.avatar}{/if}" width="82" title="{$users.first_name}" height="83" alt="{$val.title}"></a> </div>
                                <br />
                                <input type="file" name="profile_image">
                            </div>

                            <div class="form-group">
                                <label>About me</label>
                                <textarea class="form-control" rows="3"  name="aboutme" data-parsley-group="block1" required>{$users.aboutme}</textarea>
                            </div>
                            
       <div class="form-group">
          <label for="inputEmail"  >Phone Number:</label>
         
            <input type="text" id="phone" name="phone" placeholder="Eg: 0123123456, +919874563210" class="form-control"  value="{$users.phone}" title="Phone Number" maxlength="20" required>
          </div>
       
        <div class="form-group">
          <label for="inputEmail"  >Select Categories you are interested:</label>
        
            {foreach $category as $key => $val} <span class="w-100">
            <input type="checkbox"  name="categories[]" value="{$val.id}"  class="m-left-6" />
            <span class="p-left-5">{$val.name} </span> </span> {/foreach} 
        </div>
                           
        <div class="form-group">
          <label for="inputEmail"  >Zipcode:</label>
          
            <input type="text" id="zipcode" name="zip" placeholder="Enter zipcode" class="form-control" value="{$users.zip}" title="Zipcode" maxlength="10" required>
          </div>
       

        

                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control" name="status" data-parsley-group="block1" required>
                                    <option value="active" {if $users.status == 'active'} selected {/if}>Active</option>
                                    <option value="moderate" {if $users.status == 'moderate'} selected {/if}>Moderate</option>
                                    <option value="deactivate" {if $users.status == 'deactivate'} selected {/if}>Deactivate</option>
                                    <option value="unsubscribe" {if $users.status == 'unsubscribe'} selected {/if}>Unsubscribe</option>
                                    <option value="unverified" {if $users.status == 'unverified'} selected {/if}>Unverified</option>
                                </select>
                            </div>

                           </div>	
                        </form>

                    

                </div>	
                

               
                <!-- /.row -->
</div>
           
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

var initValues = '{$mcats}';
//alert(initValues);
$(':checkbox[name^="categories"]').each(function () {
    
    //alert($.inArray($(this).val(), initValues));
                    $(this).prop("checked", ($.inArray($(this).val(), initValues) != -1));
                });

$(function()
{
    var ctry = '{$users.country}';
    if(ctry !='')
    $('#country').val(ctry);

    
});
</script>