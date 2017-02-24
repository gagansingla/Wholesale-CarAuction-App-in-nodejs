{include file="common/header-1.tpl" nocache}
<div class="row dashboard">
  <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
  <div class="col-md-9">
    <h4 class="ds_brd">Profile Settings</h4>
    <form action="/profile_settings/update/" method="post" accept-charset="utf-8" enctype="multipart/form-data"  data-parsley-validate>
      {if $save}
      <div class="row">
        <div class="bg bg-success padding-20"> <i class="fa fa-warning"></i> Settings Successfully Changed!. </div>
      </div>
      {/if}
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Email:</label>
          <div class="col-md-8">
            <input type="email" name="email" value="{$users.email}" maxlength="50" title="Email" class="form-control" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >First Name:</label>
          <div class="col-md-8">
            <input type="text" name="firstname" value="{$users.first_name}" maxlength="20" title="First Name" class="form-control" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Last Name:</label>
          <div class="col-md-8">
            <input type="text" name="lastname" value="{$users.last_name}" maxlength="20" title="Last Name" class="form-control" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >About Me:</label>
          <div class="col-md-8">
            <textarea name="aboutme" class="form-control" cols="28" rows="5" title="About Me"  data-parsley-rangelength="[100,200]" data-parsley-minlength="100" data-parsley-maxlength="1000" maxlength="1000" required>{$users.aboutme}</textarea>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Address Line 1:</label>
          <div class="col-md-8">
            <input type="text" id="address_line1" name="address1" placeholder="Enter your address line1" class="form-control" value="{$users.address1}" title="Address Line 1" maxlength="50" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Address Line 2:</label>
          <div class="col-md-8">
            <input type="text" id="address_line2" name="address2" placeholder="Enter your address line2" class="form-control"  value="{$users.address2}" title="Address Line 2" maxlength="50">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Country:</label>
          <div class="col-md-8">
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
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >State:</label>
          <div class="col-md-8">
            <input type="text" id="state" name="state" placeholder="Enter state" class="form-control" value="{$users.state}" title="State" maxlength="20" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >City:</label>
          <div class="col-md-8">
            <input type="text" id="town" name="city" placeholder="Enter city" class="form-control" value="{$users.city}" title="city" maxlength="20" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Zipcode:</label>
          <div class="col-md-8">
            <input type="text" id="zipcode" name="zip" placeholder="Enter zipcode" class="form-control" value="{$users.zip}" title="Zipcode" maxlength="10" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Phone Number:</label>
          <div class="col-md-8">
            <input type="text" id="phone" name="phone" placeholder="Eg: 0123123456, +919874563210" class="form-control"  value="{$users.phone}" title="Phone Number" maxlength="20" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Select Categories you are interested:</label>
          <div class="col-md-8"> 
            <!--<select class="form-control" name="categories[]" multiple="multiple">
           <option value="1"> Web Desing </option>
           <option value="1"> Software Develoment </option>
           <option value="1"> Web Desing </option>
           <option value="1">Software Develoment  </option>
           <option value="1"> Web Desing </option>
           <option value="1">  Software Develoment </option>
           <option value="1"> Web Desing  </option>
           </select>--> 
            {foreach $category as $key => $val} <span class="w-100">
            <input type="checkbox"  name="categories[]" value="{$val.id}"  class="m-left-6" />
            <span class="p-left-5">{$val.name} </span> </span> {/foreach} </div>
        </div>
      </div>
      <div class="row">
        <label for="inputEmail" class="col-md-4">Photo:</label>
        <div class="col-md-8">
          <div  class="pull-left person_pro pro_image"> <img id="imageupload" src="{if $users.avatar == ''} {$config['imgpath']}no_img.png {else if $users.avatar != ''}{$config['url']}/uploads/profile/{$users.avatar}{/if}" title="No Photo" alt="no_img" width="97" height="75"> </div>
          <input name="profile_image" class="input file-upload" type="file" style="opacity:0">
          <button type="button" class="btn save_btn" style="margin-left:20px;margin-top:20px" onclick="triggerfile()">Upload</button>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2">
          <button class="btn save_btn">Save</button>
        </div>
      </div>
    </form>
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 
<script>

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

	$('input[type=text]').each(function()	
	{
		if($(this).val() == 'null')
		$(this).val('');
		
	});
});

		function triggerfile()
		{
		$("input[type='file']").trigger('click');	
		}
		function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imageupload').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
       }
		$("input[type='file']").change(function(){
			  readURL(this);
		})

</script>