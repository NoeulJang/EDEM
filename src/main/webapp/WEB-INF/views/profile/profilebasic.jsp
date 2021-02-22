<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>


<div class="container">

	<!-- Timeline
      ================================================= -->
	<div class="timeline">
		<div class="timeline-cover">
			<img src="/displayGroupCoverFile?fileName=${member.covimg}" style="width: 100%; height: 100%; max-height: 360px; vertical-align: middle" />
			<!--Timeline Menu for Large Screens-->
			<div class="timeline-nav-bar hidden-sm hidden-xs">
				<div class="row">
					<div class="col-md-3">
						<div class="profile-info">
							<img src="/displayGroupCoverFile?fileName=${member.memimg}" alt=""
								class="img-responsive profile-photo" />
							<h3>${member.id}</h3>
							<p class="text-muted">${member.job}</p>
						</div>
					</div>
					<div class="col-md-9">
						<ul class="list-inline profile-menu">
							<li><a href="${pageContext.request.contextPath}/timeline/timeline">타임라인</a></li>
							<li><a href="${pageContext.request.contextPath}/friend/followinglist">팔로잉</a></li>
							<li><a href="${pageContext.request.contextPath}/friend/followerlist">팔로워</a></li>
						</ul>
						<ul class="follow-me list-inline">
							<!-- <li>1,299 people following her</li>
							<li><button class="btn-primary">친구 추가</button></li> -->
						</ul>
					</div>
				</div>
			</div>
			<!--Timeline Menu for Large Screens End-->
<!-- 
			Timeline Menu for Small Screens
			<div class="navbar-mobile hidden-lg hidden-md">
				<div class="profile-info">
					<img src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" />
					<h4>Sarah Cruiz사용자 이름</h4>
					<p class="text-muted">Creative Director 사용자직업</p>
				</div>
				<div class="mobile-menu">
					<ul class="list-inline">
						<li><a href="timline.html">타임라인</a></li>
						  <li><a href="timeline-about.html" class="active">About</a></li>
						<li><a href="timeline-album.html">앨범</a></li>
						<li><a href="timeline-friends.html">친구</a></li>
					</ul>
					<button class="btn-primary">친구 추가</button>
				</div>
			</div> -->
			<!--Timeline Menu for Small Screens End-->

		</div>
		<div id="page-contents">
			<div class="row">
				<div class="col-md-3">

					<!--Edit Profile Menu-->
					<ul class="edit-menu">
						<li class="active"><i class="icon ion-ios-information-outline"></i>
						<a href="${pageContext.request.contextPath}/profile/profilebasic">프로필</a></li>
						<li><i class="icon ion-ios-briefcase-outline"></i>
						<a href="${pageContext.request.contextPath}/profile/profilemodify">프로필 수정</a></li>
						<li><i class="icon ion-ios-locked-outline"></i><a href="${pageContext.request.contextPath}/profile/profilepassword">비밀번호 변경</a></li>
						<li><i class="icon ion-ios-locked-outline"></i><a href="${pageContext.request.contextPath}/profile/profiledelete">회원탈퇴</a></li>
					</ul>
				</div>
				<div class="col-md-7">

					<!-- Basic Information
              ================================================= -->
					<div class="edit-profile-container">
						<div class="block-title">
							<h4 class="grey">
								<i class="icon ion-android-checkmark-circle"></i>내 정보
							</h4>
							<div class="line"></div>
							<p></p>
							<div class="line"></div>
						</div>
						<div class="edit-block">
							<form name="basic-info" id="basic-info" class="form-inline">
								<div class="row">
									<div class="form-group col-xs-6">
										<label for="name">이름</label>
										<p>${member.name}</p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="email">이메일</label>
										<p>${member.email}</p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="ph">전화번호</label>
										<p>${member.ph}</p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">성별</label>
										<p>${member.gender}</p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">지역</label>
										<p>${member.loc}</p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">직업</label>
										<p>${member.job}</p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">가입날짜</label>
										<p>${member.regdate}</p>
									</div>
								</div>

					

								<%-- <div class="row">
									<p class="custom-label">
										<strong>생년월일</strong>
									</p>

									<div class="form-group col-sm-4 col-xs-12">
										<label for="year" class="sr-only"></label> <select
											class="form-control" id="year">
											<option value="year">년도</option>
											<%
												for (int i = 1900; i <= 2020; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group col-sm-3 col-xs-6">
										<label for="month" class="sr-only"></label> <select
											class="form-control" id="month">
											<option value="month">월</option>
											<%
												for (int i = 1; i <= 12; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group col-sm-3 col-xs-6">
										<label for="month" class="sr-only"></label> <select
											class="form-control" id="day">
											<option value="Day">일</option>
											<%
												for (int i = 1; i <= 31; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>															
								<div class="row">
									<div class="form-group col-xs-6">
										<label for="city"> 거주지</label> <input id="city"
											class="form-control input-group-lg" type="text" name="city"
											title="Enter city" placeholder="Your city" value="서울시" />
									</div>
									<div class="form-group col-xs-6">
										<label for="country">국적</label> <select class="form-control"
											id="country">
											<option value="country">Country</option>
											<option value="AFG">Afghanistan</option>
											<option value="ALA">Ƭand Islands</option>
											<option value="ALB">Albania</option>
											<option value="DZA">Algeria</option>
											<option value="ASM">American Samoa</option>
											<option value="AND">Andorra</option>
											<option value="AGO">Angola</option>
											<option value="AIA">Anguilla</option>
											<option value="ATA">Antarctica</option>
											<option value="ATG">Antigua and Barbuda</option>
											<option value="ARG">Argentina</option>
											<option value="ARM">Armenia</option>
											<option value="ABW">Aruba</option>
											<option value="AUS">Australia</option>
											<option value="AUT">Austria</option>
											<option value="AZE">Azerbaijan</option>
											<option value="BHS">Bahamas</option>
											<option value="BHR">Bahrain</option>
											<option value="BGD">Bangladesh</option>
											<option value="BRB">Barbados</option>
											<option value="BLR">Belarus</option>
											<option value="BEL">Belgium</option>
											<option value="BLZ">Belize</option>
											<option value="BEN">Benin</option>
											<option value="BMU">Bermuda</option>
											<option value="BTN">Bhutan</option>
											<option value="BOL">Bolivia, Plurinational State of</option>
											<option value="BES">Bonaire, Sint Eustatius and Saba</option>
											<option value="BIH">Bosnia and Herzegovina</option>
											<option value="BWA">Botswana</option>
											<option value="BVT">Bouvet Island</option>
											<option value="BRA">Brazil</option>
											<option value="IOT">British Indian Ocean Territory</option>
											<option value="BRN">Brunei Darussalam</option>
											<option value="BGR">Bulgaria</option>
											<option value="BFA">Burkina Faso</option>
											<option value="BDI">Burundi</option>
											<option value="KHM">Cambodia</option>
											<option value="CMR">Cameroon</option>
											<option value="CAN">Canada</option>
											<option value="CPV">Cape Verde</option>
											<option value="CYM">Cayman Islands</option>
											<option value="CAF">Central African Republic</option>
											<option value="TCD">Chad</option>
											<option value="CHL">Chile</option>
											<option value="CHN">China</option>
											<option value="CXR">Christmas Island</option>
											<option value="CCK">Cocos (Keeling) Islands</option>
											<option value="COL">Colombia</option>
											<option value="COM">Comoros</option>
											<option value="COG">Congo</option>
											<option value="COD">Congo, the Democratic Republic
												of the</option>
											<option value="COK">Cook Islands</option>
											<option value="CRI">Costa Rica</option>
											<option value="CIV">C𴥠d'Ivoire</option>
											<option value="HRV">Croatia</option>
											<option value="CUB">Cuba</option>
											<option value="CUW">Cura袯</option>
											<option value="CYP">Cyprus</option>
											<option value="CZE">Czech Republic</option>
											<option value="DNK">Denmark</option>
											<option value="DJI">Djibouti</option>
											<option value="DMA">Dominica</option>
											<option value="DOM">Dominican Republic</option>
											<option value="ECU">Ecuador</option>
											<option value="EGY">Egypt</option>
											<option value="SLV">El Salvador</option>
											<option value="GNQ">Equatorial Guinea</option>
											<option value="ERI">Eritrea</option>
											<option value="EST">Estonia</option>
											<option value="ETH">Ethiopia</option>
											<option value="FLK">Falkland Islands (Malvinas)</option>
											<option value="FRO">Faroe Islands</option>
											<option value="FJI">Fiji</option>
											<option value="FIN">Finland</option>
											<option value="FRA">France</option>
											<option value="GUF">French Guiana</option>
											<option value="PYF">French Polynesia</option>
											<option value="ATF">French Southern Territories</option>
											<option value="GAB">Gabon</option>
											<option value="GMB">Gambia</option>
											<option value="GEO">Georgia</option>
											<option value="DEU">Germany</option>
											<option value="GHA">Ghana</option>
											<option value="GIB">Gibraltar</option>
											<option value="GRC">Greece</option>
											<option value="GRL">Greenland</option>
											<option value="GRD">Grenada</option>
											<option value="GLP">Guadeloupe</option>
											<option value="GUM">Guam</option>
											<option value="GTM">Guatemala</option>
											<option value="GGY">Guernsey</option>
											<option value="GIN">Guinea</option>
											<option value="GNB">Guinea-Bissau</option>
											<option value="GUY">Guyana</option>
											<option value="HTI">Haiti</option>
											<option value="HMD">Heard Island and McDonald
												Islands</option>
											<option value="VAT">Holy See (Vatican City State)</option>
											<option value="HND">Honduras</option>
											<option value="HKG">Hong Kong</option>
											<option value="HUN">Hungary</option>
											<option value="ISL">Iceland</option>
											<option value="IND">India</option>
											<option value="IDN">Indonesia</option>
											<option value="IRN">Iran, Islamic Republic of</option>
											<option value="IRQ">Iraq</option>
											<option value="IRL">Ireland</option>
											<option value="IMN">Isle of Man</option>
											<option value="ISR">Israel</option>
											<option value="ITA">Italy</option>
											<option value="JAM">Jamaica</option>
											<option value="JPN">Japan</option>
											<option value="JEY">Jersey</option>
											<option value="JOR">Jordan</option>
											<option value="KAZ">Kazakhstan</option>
											<option value="KEN">Kenya</option>
											<option value="KIR">Kiribati</option>
											<option value="KOR" selected>대한민국</option>
											<option value="KWT">Kuwait</option>
											<option value="KGZ">Kyrgyzstan</option>
											<option value="LAO">Lao People's Democratic Republic</option>
											<option value="LVA">Latvia</option>
											<option value="LBN">Lebanon</option>
											<option value="LSO">Lesotho</option>
											<option value="LBR">Liberia</option>
											<option value="LBY">Libya</option>
											<option value="LIE">Liechtenstein</option>
											<option value="LTU">Lithuania</option>
											<option value="LUX">Luxembourg</option>
											<option value="MAC">Macao</option>
											<option value="MKD">Macedonia, the former Yugoslav
												Republic of</option>
											<option value="MDG">Madagascar</option>
											<option value="MWI">Malawi</option>
											<option value="MYS">Malaysia</option>
											<option value="MDV">Maldives</option>
											<option value="MLI">Mali</option>
											<option value="MLT">Malta</option>
											<option value="MHL">Marshall Islands</option>
											<option value="MTQ">Martinique</option>
											<option value="MRT">Mauritania</option>
											<option value="MUS">Mauritius</option>
											<option value="MYT">Mayotte</option>
											<option value="MEX">Mexico</option>
											<option value="FSM">Micronesia, Federated States of</option>
											<option value="MDA">Moldova, Republic of</option>
											<option value="MCO">Monaco</option>
											<option value="MNG">Mongolia</option>
											<option value="MNE">Montenegro</option>
											<option value="MSR">Montserrat</option>
											<option value="MAR">Morocco</option>
											<option value="MOZ">Mozambique</option>
											<option value="MMR">Myanmar</option>
											<option value="NAM">Namibia</option>
											<option value="NRU">Nauru</option>
											<option value="NPL">Nepal</option>
											<option value="NLD">Netherlands</option>
											<option value="NCL">New Caledonia</option>
											<option value="NZL">New Zealand</option>
											<option value="NIC">Nicaragua</option>
											<option value="NER">Niger</option>
											<option value="NGA">Nigeria</option>
											<option value="NIU">Niue</option>
											<option value="NFK">Norfolk Island</option>
											<option value="MNP">Northern Mariana Islands</option>
											<option value="NOR">Norway</option>
											<option value="OMN">Oman</option>
											<option value="PAK">Pakistan</option>
											<option value="PLW">Palau</option>
											<option value="PSE">Palestinian Territory, Occupied</option>
											<option value="PAN">Panama</option>
											<option value="PNG">Papua New Guinea</option>
											<option value="PRY">Paraguay</option>
											<option value="PER">Peru</option>
											<option value="PHL">Philippines</option>
											<option value="PCN">Pitcairn</option>
											<option value="POL">Poland</option>
											<option value="PRT">Portugal</option>
											<option value="PRI">Puerto Rico</option>
											<option value="QAT">Qatar</option>
											<option value="REU">R궮ion</option>
											<option value="ROU">Romania</option>
											<option value="RUS">Russian Federation</option>
											<option value="RWA">Rwanda</option>
											<option value="BLM">Saint Barthꭥmy</option>
											<option value="SHN">Saint Helena, Ascension and
												Tristan da Cunha</option>
											<option value="KNA">Saint Kitts and Nevis</option>
											<option value="LCA">Saint Lucia</option>
											<option value="MAF">Saint Martin (French part)</option>
											<option value="SPM">Saint Pierre and Miquelon</option>
											<option value="VCT">Saint Vincent and the Grenadines</option>
											<option value="WSM">Samoa</option>
											<option value="SMR">San Marino</option>
											<option value="STP">Sao Tome and Principe</option>
											<option value="SAU">Saudi Arabia</option>
											<option value="SEN">Senegal</option>
											<option value="SRB">Serbia</option>
											<option value="SYC">Seychelles</option>
											<option value="SLE">Sierra Leone</option>
											<option value="SGP">Singapore</option>
											<option value="SXM">Sint Maarten (Dutch part)</option>
											<option value="SVK">Slovakia</option>
											<option value="SVN">Slovenia</option>
											<option value="SLB">Solomon Islands</option>
											<option value="SOM">Somalia</option>
											<option value="ZAF">South Africa</option>
											<option value="SGS">South Georgia and the South
												Sandwich Islands</option>
											<option value="SSD">South Sudan</option>
											<option value="ESP">Spain</option>
											<option value="LKA">Sri Lanka</option>
											<option value="SDN">Sudan</option>
											<option value="SUR">Suriname</option>
											<option value="SJM">Svalbard and Jan Mayen</option>
											<option value="SWZ">Swaziland</option>
											<option value="SWE">Sweden</option>
											<option value="CHE">Switzerland</option>
											<option value="SYR">Syrian Arab Republic</option>
											<option value="TWN">Taiwan, Province of China</option>
											<option value="TJK">Tajikistan</option>
											<option value="TZA">Tanzania, United Republic of</option>
											<option value="THA">Thailand</option>
											<option value="TLS">Timor-Leste</option>
											<option value="TGO">Togo</option>
											<option value="TKL">Tokelau</option>
											<option value="TON">Tonga</option>
											<option value="TTO">Trinidad and Tobago</option>
											<option value="TUN">Tunisia</option>
											<option value="TUR">Turkey</option>
											<option value="TKM">Turkmenistan</option>
											<option value="TCA">Turks and Caicos Islands</option>
											<option value="TUV">Tuvalu</option>
											<option value="UGA">Uganda</option>
											<option value="UKR">Ukraine</option>
											<option value="ARE">United Arab Emirates</option>
											<option value="GBR">United Kingdom</option>
											<option value="USA">United States</option>
											<option value="UMI">United States Minor Outlying
												Islands</option>
											<option value="URY">Uruguay</option>
											<option value="UZB">Uzbekistan</option>
											<option value="VUT">Vanuatu</option>
											<option value="VEN">Venezuela, Bolivarian Republic
												of</option>
											<option value="VNM">Viet Nam</option>
											<option value="VGB">Virgin Islands, British</option>
											<option value="VIR">Virgin Islands, U.S.</option>
											<option value="WLF">Wallis and Futuna</option>
											<option value="ESH">Western Sahara</option>
											<option value="YEM">Yemen</option>
											<option value="ZMB">Zambia</option>
											<option value="ZWE">Zimbabwe</option>
										</select>
									</div>
								</div >--%>
								<!-- 								<div class="row">
									<div class="form-group col-xs-12">
										<label for="my-info">자기소개</label>
										<textarea id="my-info" name="information" class="form-control"
											placeholder="Some texts about me" rows="4" cols="400">나에 대한 소개를 작성하세요. 자기소개란.</textarea>
									</div>
								</div> -->
								<p>아래를 눌러 프로필을 수정할 수 있습니다.</p>
								<a href="${pageContext.request.contextPath}/profile/profilemodify" class="btn btn-primary">프로필 수정하러 가기</a>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-2 static">

					<!--Sticky Timeline Activity Sidebar-->
					<!--               <div id="sticky-sidebar">
                <h4 class="grey">Sarah's activity</h4>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Commended on a Photo</p>
                    <p class="text-muted">5 mins ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Has posted a photo</p>
                    <p class="text-muted">an hour ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Liked her friend's post</p>
                    <p class="text-muted">4 hours ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> has shared an album</p>
                    <p class="text-muted">a day ago</p>
                  </div>
                </div>
              </div> -->
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jspf"%>


