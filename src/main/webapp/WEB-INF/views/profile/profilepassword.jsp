<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jspf" %> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!DOCTYPE html>



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
                  <img src="/displayGroupCoverFile?fileName=${member.memimg}" alt="" class="img-responsive profile-photo" />
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
                  <!-- <li>1,299 people following her 그녀</li>
                  <li><button class="btn-primary">친구 추가</button></li> -->
                </ul>
              </div>
            </div>
          </div><!--Timeline Menu for Large Screens End-->

<!--           Timeline Menu for Small Screens
          <div class="navbar-mobile hidden-lg hidden-md">
            <div class="profile-info">
              <img src="http://placehold.it/300x300" alt="" class="img-responsive profile-photo" />
              <h4>Sarah Cruiz</h4>
              <p class="text-muted">Creative Director</p>
            </div>
            <div class="mobile-menu">
              <ul class="list-inline">
                <li><a href="timline.html">Timeline</a></li>
                <li><a href="timeline-about.html" class="active">About</a></li>
                <li><a href="timeline-album.html">Album</a></li>
                <li><a href="timeline-friends.html">Friends</a></li>
              </ul>
              <button class="btn-primary">Add Friend</button>
            </div>
          </div>Timeline Menu for Small Screens End
 -->
        </div>
        <div id="page-contents">
          <div class="row">
            <div class="col-md-3">
              
              <!--Edit Profile Menu-->
					<ul class="edit-menu">
						<li><i class="icon ion-ios-information-outline"></i>
						<a href="${pageContext.request.contextPath}/profile/profilebasic">프로필</a></li>
						<li><i class="icon ion-ios-briefcase-outline"></i>
						<a href="${pageContext.request.contextPath}/profile/profilemodify">프로필 수정</a></li>
						<li class="active"><i class="icon ion-ios-locked-outline"></i><a href="${pageContext.request.contextPath}/profile/profilepassword">비밀번호 변경</a></li>
						<li><i class="icon ion-ios-locked-outline"></i><a href="${pageContext.request.contextPath}/profile/profiledelete">회원탈퇴</a></li>
					</ul> 
            </div>
            <div class="col-md-7">

              <!-- Change Password
              ================================================= -->
              <div class="edit-profile-container">
                <div class="block-title">
                  <h4 class="grey"><i class="icon ion-ios-locked-outline"></i>비밀번호 변경</h4>
                  <div class="line"></div>
                </div>
                <div class="edit-block">
                  <form action= "/profile/profilepassword" method = "post" name="update-pass" id="education" class="form-inline">
                    <div class="row">
                      <div class="form-group col-xs-12">
                        <label for="my-password">기존 비밀번호</label>
                        <input id="my-password" class="form-control input-group-lg" type="password" name="curPwd" title="Enter password" placeholder="현재 비밀번호"/> 
                        <%-- <c:if test= "${errors.curPwd }"> 현재 비밀번호를 입력하세요.</c:if> --%>
                                   
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group col-xs-6">
                        <label>변경할 비밀번호</label>
                        <input id="npw" class="form-control input-group-lg" type="password" name="npw" title="Enter password" placeholder="새 비밀번호" />
                       <%-- 	<c:if test= "${errors.newPwd }"> 새 비밀번호를 입력하세요.</c:if> --%>
                       
                      </div>
                      <div class="form-group col-xs-6">
                        <label>비밀번호 확인</label>
                        <input id="pw" class="form-control input-group-lg" type="password" name="pw" title="Enter password" placeholder="새 비밀번호 확인"/>
                      <%-- 	<c:if test= "${errors.newPwd2 }">새 비밀번호를 확인하세요.</c:if>
                    
                  		<c:if test= "${errors.match}">새 비밀번호가 다릅니다.</c:if>  --%>
                      </div>
                    </div>
                    <!-- <p><a href="#">비밀번호를 잃어버리셨나요?</a></p> -->
                    <button type ="submit"  onclick="return confirm('정말로 변경하시겠습니까?')" class="btn btn-primary">변경</button>
                  </form>
                  <!--   -->
                  
                   <script>
             $("#education").submit( function(e){
                if (($.trim($("#my-password").val()) == "") || ($.trim($("#npw").val()) =="") || ($.trim($("#pw").val())=="" )) {
                   alert("비밀번호를 다시 입력해주세요.");
                   return false;
                }
             });
             
             
             $(function(){

            	//비밀번호 확인
            		$('#pw').blur(function(){
            		   if($('#npw').val() != $('#pw').val()){
            		    	if($('#pw').val()!=''){
            			    alert("새 비밀번호가 일치하지 않습니다.");
            		    	    $('#pw').val('');
            		          $('#pw').focus();
            		       }
            		    }
            		})  	   
            	});



            	
       </script>
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

<%@ include file="../include/footer.jspf" %> 