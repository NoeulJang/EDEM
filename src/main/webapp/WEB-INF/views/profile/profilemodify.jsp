<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<%@ include file="../include/header.jspf"%>

<div class="container">

	<!-- Timeline
      ================================================= -->
	<div class="timeline">
		<div class="timeline-cover">
			<img src="/displayGroupCoverFile?fileName=${member.covimg}" style="width: 100%; height: 100%; max-height: 360px; vertical-align: middle"/>
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
			</div>
			Timeline Menu for Small Screens End
 -->
		</div>
		<div id="page-contents">
			<div class="row">
				<div class="col-md-3">
					<ul class="edit-menu">
						<li><i class="icon ion-ios-information-outline"></i>
						<a href="${pageContext.request.contextPath}/profile/profilebasic">프로필</a></li>
						<li class="active"><i class="icon ion-ios-briefcase-outline"></i>
						<a href="${pageContext.request.contextPath}/profile/profilemodify">프로필 수정</a></li>
						<li><i class="icon ion-ios-locked-outline"></i><a href="${pageContext.request.contextPath}/profile/profilepassword">비밀번호 변경</a></li>
						<li><i class="icon ion-ios-locked-outline"></i><a href="${pageContext.request.contextPath}/profile/profiledelete">회원탈퇴</a></li>
					</ul>
				</div>
				<div class="col-md-7">



     <script>
             $("#modifyinfo").submit( function(e){
                if (($.trim($("#name").val()) == "")) {
                   alert("이름을 입력하세요");
                   return false;
                }
                if (($.trim($("#email").val()) == "")) {
                   alert("이메일을 입력하세요");
                   return false;
                }
                if (($.trim($("#ph").val()) == "")) {
                   alert("전화번호를 입력하세요");
                   return false;
                }
                if (($.trim($("#loc").val()) == "")) {
                   alert("거주지를 입력하세요");
                   return false;
                }
                if (($.trim($("#job").val()) == "")) {
                   alert("직업을 입력하세요");
                   return false;
                }
             });
       
       </script>
					<!-- Basic Information
              ================================================= -->
					<div class="edit-profile-container">
						<div class="block-title">
							<h4 class="grey">
								<i class="icon ion-android-checkmark-circle"></i>내 정보
							</h4>
							<div class="line"></div>
						</div>
						<div class="edit-block">
							<form role="form" action="profilemodify" method="post" name="basic-info"
								id="modifyinfo" class="form-inline">
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">이름</label>  <input id="name"
											class="form-control input-group-lg" type="text" name="name"
											title="Enter Email" placeholder="이름" value="${member.name}" />
									</div>
								</div>
									<div class="row">
									<div class="form-group col-xs-12">
										<label for="">전화번호</label>  <input id="ph"
											class="form-control input-group-lg" type="text" name="ph"
											title="Enter Email" placeholder="전화번호" value="${member.ph}" />
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">이메일</label>  <input id="email"
											class="form-control input-group-lg" type="text" name="email"
											title="Enter Email" placeholder="이메일" value="${member.email}" />
									</div>
								</div>
							
<!-- 								<div class="row">
									<div class="form-group gender">
										<label class="radio-inline"> <input type="radio"
											name="gender" value="남성" checked>남성
										</label> <label class="radio-inline"> <input type="radio"
											name="gender" value="여성">여성
										</label>
									</div>
								</div> -->
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">지역</label> <input id="loc"
											class="form-control input-group-lg" type="text" name="loc"
											title="Enter Email" placeholder="지역" value="${member.loc}" />
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="">직업</label><input id="job"
											class="form-control input-group-lg" type="text" name="job"
											title="Enter Email" placeholder="직업" value="${member.job}" />
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
									</div> --%>
								<!-- 								<div class="row">
									<div class="form-group col-xs-12">
										<label for="my-info">자기소개</label>
										<textarea id="my-info" name="information" class="form-control"
											placeholder="Some texts about me" rows="4" cols="400">나에 대한 소개를 작성하세요. 자기소개란.</textarea>
									</div>
								</div> -->
								<div class="row">
									<div class="form-group col-xs-12 id="div1">
										<label for="">프로필이미지</label><input id="memimg"
											class="form-control input-group-lg" type="text" name="memimg"
											title="Enter Email" placeholder="" value="${member.memimg}" />
											
											<ul></ul>
								
									</div>
								</div>
								
								
								<div class="row">
									<div class="form-group col-xs-12" id="div2">
										<label for="">프로필이미지</label><input id="covimg"
											class="form-control input-group-lg" type="text" name="covimg"
											title="Enter Email" placeholder="" value="${member.covimg}" />
									</div>
								</div>
								
								
								<p></p>
								<button type="submit" onclick="return confirm('정말로 수정하시겠습니까?')" class="btn btn-primary"> 수정하기</button>
							</form>
						</div>
						
						<iframe name="zeroFrame"></iframe>
<!-- 						<script>
							function addFilePath(msg) {
								
								alert(msg);
								var fileInfo = getFileInfo(msg);
								var html = templateattach(fileInfo);

								$(".uploadedList").append(html);
								document.getElementById("form1").reset();
							}
						</script> -->
						
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



