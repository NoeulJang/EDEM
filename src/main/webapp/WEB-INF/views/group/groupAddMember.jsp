<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="../include/header.jspf" %> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.button-wrapper a{
	margin-left: 2em;
}
</style>

    <div id="page-contents">
    	<div class="container">
    		<div class="row">

    			<!-- Newsfeed Common Side Bar Left
          ================================================= -->
    		<div class="col-md-3 static">
	            <div class="profile-card">
	            	<img src="/displayGroupCoverFile?fileName=${member.memimg}" alt="user" class="profile-photo" />
	            	<h5><a href="${pageContext.request.contextPath}/timeline/timeline" class="text-white">${member.id}</a></h5>
	            	<a href="#" class="text-white"><i class="ion ion-android-person-add"></i>${member.followers}명이 팔로잉중</a>
	            </div><!--profile card ends-->
	            
	            <ul class="edit-menu">
	            	<li><a href="/group/groupIndex">그룹 메인</a></li>
	            	<li><a href="/group/groupNewsfeed">내 그룹</a></li>
	            	<li><a href="/group/groupRegister">그룹 생성</a></li>
	            	<li class="active"><a href="${pageContext.request.contextPath}/group/groupMemberAdmin">멤버관리</a></li>
           		</ul>
          	</div>
          
    		<div class="col-md-7">
	
	            <div class="create-post">
	            	<div class="row">
	            		<div class="col-md-7 col-sm-7">
							<div class="form-group button-wrapper">
								<a href="/group/groupMemberAdmin" class="btn btn-primary">그룹 멤버 관리 보기</a>
	                			<a href="/group/removeGroup" class="btn btn-primary" onclick="return confirm('정말로 그룹을 삭제하시겠습니까?')">그룹 삭제</a>
	                 		 </div>
	                	</div>
	            	</div>
	            </div>

            <!-- Friend List
            ================================================= -->
            <div class=groupHeader>
            <h4 class="grey">
				<i class="icon ion-android-checkmark-circle" style = "margin-left:5%">가입 멤버 관리</i>
			</h4>
	        <c:if test="${addMemberCount == 0}">
            	<p>가입신청한 사람이 없습니다.</p>
            </c:if>
			</div>
			<div id="show-list"></div>
            </div>
          </div>

          </div>
    	</div>

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<div class="friend-list">
            	<div class="member-List">	
					<div class="col-md-4">
						<div class="friend-card" data-memno={{memno}}>
							<img src="/displayGroupCoverFile?fileName={{covimg}}" style="width:460px; height:100px; " alt="profile-cover"
							class="img-responsive cover" />
							<div class="card-info">
								<img src="/displayGroupCoverFile?fileName={{memimg}}" alt="user"
								class="profile-photo-lg" />
								<div class="friend-info" >
									<a href="#" class="pull-right text-green"><!-- 회원님을 팔로우 중 --></a>
									<h5>
									<a href="${pageContext.request.contextPath}/timeline/timelineList/{{memno}}" id="addmem-tag" class="profile-link">{{id}}</a>
									</h5>
									<p>{{job}}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	{{/each}}
</script>
    	
		<!-- upScroll -->
	<button onclick="topFunction()" id="myBtn" title="Go to top">위로가기</button>
	<script>
	//버튼
	var mybutton = document.getElementById("myBtn");
	
	
	// 유저스크롤이 문서 맨위에서 20px 멀어지면 버튼을 나타내기
	window.onscroll = function() {
		scrollFunction()
		};
	
	function scrollFunction() {
 	 if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
  	  mybutton.style.display = "block";
  	} else {
  	  mybutton.style.display = "none";
  	}
	}

	// 버튼 클릭시, 문서 맨 위로 스크롤! 
	function topFunction() {
  	  jQuery('html, body').animate({
   	   	 scrollTop: 0
  	  }, 500);
   	 return false;
	};
	</script> 

<script type="text/javascript">

$( document ).ready(function() {
	var page = 0;
	
	$(window).scroll(function() {
		var scrTop = $(window).scrollTop()+50;
		var docHi = ($(document).height() - $(window).height());
		if (scrTop >= docHi) {
			console.log("page???"+page);
			page++;
			getPage("/group/groupAddMemberList?page=" + page);
		}
	});
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#show-list"), $('#template'));
			});
	}
	
	var printData = function(groupArr, target, templateObject) {
	
		var template = Handlebars.compile(templateObject.html());
	
		var html = template(groupArr);
		target.append(html);
	}
	
	$('#show-list').on("click", ".friend-card", function(event) {
		event.preventDefault();
		var memno = $(this).attr('data-memno');
		console.log("click : "+memno);

		var join = confirm('그룹 가입을 수락하시겠습니까?');
			if (join == true) {
				$.ajax({
					type : 'get',
					url : '/group/addMember/' + memno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							$('#show-list').children().remove();
  							alert("회원을 그룹에 추가하였습니다.");
  							page=0;
  							getPage("/group/groupAddMemberList?page=" + page);
						}
					}
				});
			} else {
				var reject = confirm('그룹 가입을 거절하시겠습니까?');
				if (reject == true){
					$.ajax({
						type : 'get',
						url : '/group/rejectAddMember/' + memno,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "GET"
						},
						dataType : 'text',
						success : function(result) {
							console.log("result: " + result);
							if (result == 'SUCCESS') {
								$('#show-list').children().remove();
	  							alert("그룹 가입을 거절하였습니다.");
	  							page=0;
	  							getPage("/group/groupAddMemberList?page=" + page);
							}
						}
					});
				}
			}
		});
	 
});
</script>

<%@ include file="../include/footer.jspf" %> 