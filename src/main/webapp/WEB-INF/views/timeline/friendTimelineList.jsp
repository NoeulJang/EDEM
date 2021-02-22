<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
<!-- <link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!-- <script src="/resources/HTML/js/index.js"></script> -->

<%@ include file="../include/header.jspf"%>

<style>
#myBtn {
  display: none;
  position: fixed;
  bottom: 50px;
  right: 30px;
  z-index: 99;
  font-size: 1.2em;
  border: none;
  outline: none;
  background-color: #27aae1;
  color: white;
  cursor: pointer;
  padding: 0.5em;
  border-radius: 4px;
}
#myBtn:hover {
  background-color: red;
}

.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}

iframe {
	width: 0px;
	height: 0px;
	border: 0px
}
</style>

<button onclick="topFunction()" id="myBtn" title="Go to top">위로가기</button>

<div class="container">
	<!-- Timeline================================================= -->
	<div class="timeline">
		<div class="timeline-cover">
			<img src="/displayGroupCoverFile?fileName=${userInfo.covimg}"
				style="width: 100%; height: 100%; max-height: 360px; vertical-align: middle" />
			<!--Timeline Menu for Large Screens-->
			<div class="timeline-nav-bar hidden-sm hidden-xs"> 
			<!-- <div class="timeline-nav-bar"> -->
				<div class="row">
					<div class="col-md-3">
						<div class="profile-info">
							<img src="/displayGroupCoverFile?fileName=${userInfo.memimg}" alt=""
								class="img-responsive profile-photo" />
							<h3>${userInfo.id}</h3>
							<p class="text-muted">${userInfo.job}</p>
						</div>
					</div>
					<div class="col-md-9">
						<ul class="list-inline profile-menu btnSelect">
							<li>
							<a href="${pageContext.request.contextPath}/timeline/timelineList/${userInfo.memno}" class="active">타임라인</a>
							</li>
							<li><a href="#" id="following" >팔로잉</a></li>
							<li><a href="#" id="follower">팔로워</a></li>
						</ul>
						
						<ul class="follow-me list-inline">
							<li class="follwers" >${userInfo.id}님을 ${userInfo.followers}명이 팔로우중입니다.</li>
													<c:if test="${member.memno ne userInfo.memno}">
							<li> 
								<div>
									<c:choose>
										<c:when test="${followBtn==1}">
											<form
												action="${pageContext.request.contextPath}/timeline/follow/${userInfo.memno}"
												method="GET">
												<div>
													<a onclick="return confirm('팔로우 취소하시겠습니까?')">
													<input type="submit" class="btn-primary"
														value="팔로우 취소" name="flist" /></a>
												</div>
											</form>
										</c:when>

										<c:when test="${followBtn!=1}">
											<form action="${pageContext.request.contextPath}/timeline/follow/${userInfo.memno}" method="GET">
												<div>
													<a onclick="return confirm('팔로우 하시겠습니까?')">
													<input type="submit" class="btn-primary"
														value="팔로우 하기" name="flist" /></a>
												</div>
											</form>
										</c:when>
										
									</c:choose>
								</div> 
							</li>
							</c:if>
						</ul>
						
					</div>
				</div>
			</div>
			<!--Timeline Menu for Large Screens End-->
			
			<!--Timeline Menu for Small Screens-->
			<div class="navbar-mobile hidden-lg hidden-md">
				<div class="profile-info">
					<img src="/displayGroupCoverFile?fileName=${userInfo.memimg}" alt=""
						class="img-responsive profile-photo" />
					<h4>${userInfo.id}</h4>
					<p class="text-muted">${userInfo.job}</p>
				</div>
				<div class="mobile-menu">
					<ul class="list-inline">
						<li><a href="${pageContext.request.contextPath}/timeline/timelineList/${userInfo.memno}" class="active">${userInfo.id}님의 타임라인</a></li>
						<li><a  href="#" id="followingM" >팔로잉</a></li>
						<li><a href="#" id="followerM">팔로워</a></li>
						<!-- <li><a href="timeline-friends.html"></a></li> -->
						<c:if test="${member.memno ne userInfo.memno}">
							<c:choose>
								<c:when test="${followBtn==1}">
									<li><a href="${pageContext.request.contextPath}/timeline/follow/${userInfo.memno}"
										onclick="return confirm('팔로우 취소하시겠습니까?')">팔로우 취소</a></li>
								</c:when>
								
								<c:when test="${followBtn!=1}">
									<li><a href="${pageContext.request.contextPath}/timeline/follow/${userInfo.memno}"
										onclick="return confirm('팔로우 하시겠습니까?')">팔로우 하기</a></li>
								</c:when>
							</c:choose>
						</c:if> 
							
					</ul>
					<ul class="follow-me list-inline">
						<!-- <li>1,299 people following her 팔로워 수</li>
							<li><button class="btn-primary">친구 추가m</button></li> -->
						<li class="follwers" style="margin-Top: 7%;">${userInfo.id}님을 ${userInfo.followers}명이 팔로우중입니다.</li>
					</ul>
				</div>
			</div>
			<!--Timeline Menu for Small Screens End-->

	
			
		</div>
		<div id="page-contents">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-7">
				
				<!-- ============== Follow Search Box Start ===================-->
					<div class='box-body' id="searchFollow">
						<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'
							style="background-color: #f8f8f8; border: 0.7px solid gray; height: 4%; width: 50%; border-radius: 7px; margin: 2px 2px 3px 2px;"
							placeholder=" 아이디를 검색하세요 " />

						<button id='searchBtn'
							style="background-color: #f8f8f8; height: 4%; width: 5%; border-radius: 15px; border: 0.7px solid gray; margin: 2px 2px 10px 2px;">
							<i class="icon ion-android-search "></i>
						</button>
					</div>
				<!-- ============== Follow Search Box End ===================-->
				<div class="searchTimeline">
					<div class="container">
					
						<div class="row">
							<div class="col-md-6 col-md-offset-3"></div>
						</div>
						<div class="row">
							<div class="col-md-4 col-md-offset-3">				
	
								<form action="" class="search-form">
									<div class="form-group has-feedback">
										<label for="search" class="sr-only">Search</label> 
										<input type="text" class="form-control" name="keyword" id="keywordInput"
											placeholder="게시글 검색">
									</div>
									<button
										class="glyphicon glyphicon-search form-control-feedback"
										id="timelineSearchBtn"></button>
								</form>

							</div>
						</div>
					</div>
				</div>

					<!-- Post Create Box
              ================================================= -->
					<div class="create-post">
						<div class="row">
						<c:if test ="${member.memno eq userInfo.memno}">
							<div class="col-md-7 col-sm-7">
								<form action="/timeline/insert/${member.memno}" method="post" id="insert">

									<div>
										<div>
											<div class="form-group">
												<img src="/displayGroupCoverFile?fileName=${member.memimg}" alt="" class="profile-photo-md" />
												<textarea name="postCon" id="exampleTextarea" cols="100"
													rows="1" class="form-control-add"
													placeholder="타임라인 글을 작성해 주세요."></textarea>
												<input type="hidden" value="${member.id}" name="id">
												<input type="hidden" value="타임라인" name="postCi"> <input
													type="hidden" value="0" name="postLike">

												<!-- <div class="form-group">
													<label for="exampleInputEmail1">첨부파일</label>
													<div class="fileDrop"></div>
												</div> -->

												<button class="btn btn-primary-post" type="submit">글쓰기</button>
											</div>
										</div>
										
										<div class="col-md-5 col-sm-5">
											<div class="tools"></div>
										</div>
									</div>
								</form>
								<ul class="mailbox-attachments clearfix uploadedList"></ul>
							</div>
							
							<form id='form1'
								action="${pageContext.request.contextPath}/uploadForm"
								method="post" enctype="multipart/form-data" target="zeroFrame">
								<input type='file' name='file'> <input type='submit'>
							</form>

							<iframe name="zeroFrame"></iframe>
							
							</c:if>
							
							<!-- 업로드폼 실행성공 -->
							<script>
							function addFilePath(msg) {
								alert(msg);
								var fileInfo = getFileInfo(msg);

								var html = templateattach(fileInfo);

								$(".uploadedList").append(html);
								document.getElementById("form1").reset();
							}
							</script>


							<script>
								$("#insert").submit(
										function(e) {
											if (($.trim($("#exampleTextarea").val()) == "")) {
												alert("타임라인 내용을 입력하여 주세요.");
												return false;
											}
										});
							</script>
						</div>
						<!-- Post Create Box End-->

						<!-- Post Content
              ================================================= -->
						<div class="scrollView">




							<c:forEach var="list" items="${list}">
								<div class="post-content">
									<div class="post-container">
										<img src="/displayGroupCoverFile?fileName=${userInfo.memimg}" alt="user"
											class="profile-photo-md pull-left" />
										<div class="post-detail">
											<div class="user-info">
												<h5>
													<a
														href="${pageContext.request.contextPath}/timeline/timelineList/${userInfo.memno}"
														class="profile-link"> ${userInfo.id}</a> <span
														class="following">following</span>
												</h5>

											</div>
											<form>
<%-- 												<div class="reaction">
													<a
														href="${pageContext.request.contextPath}/timeline/timelineLike.do?postNo=${list.postNo}"
														class="btn text-green" type="submit"> <i
														class="icon ion-thumbsup"></i>${list.postLike}</a>
													<!-- <a class="btn text-red"><i class="fa fa-thumbs-down"></i>0</a> -->
												</div> --%>
											</form>

											<c:if test="${list.fullname ne 'nofile'}">
												<img src="/displayGroupCoverFile?fileName=${list.fullname}"
													style="width: 500px; height: 200px;" alt="profile-cover"
													class="img-responsive cover" />
											</c:if>
											<div class="line-divider"></div>
											<div class="post-text">
												<p>${list.postCon}<i class="em em-anguished"></i> <i
														class="em em-anguished"></i> <i class="em em-anguished"></i>
												</p>
											</div>
											<div class="line-divider"></div>
											<p class="text-muted">${list.postDate}</p>
											<c:if test="${member.memno == list.memno}">
												<form action="timelinemodify" method="get">
													<input type="hidden" value="${list.postNo}" name="postNo" />
													<button class="btn-primary-comments" id="modifyBtn"
														style="margin-Top: 1%;">글수정</button>
												</form>

												<form action="timelinedelete" method="post">
													<input type="hidden" value="${list.postNo}" name="postNo" />
													<button class="btn-primary-comments" id="removeBtn"
														onclick="return confirm('정말로 삭제하시겠습니까?')">글삭제</button>
												</form>
											</c:if>
											<div class="commDiv">
												<input type="hidden" name="postNo" class="postNo"
													value="${list.postNo}"> <a href="#"><button
														type="submit" class="btn-primary-comments"
														style="margin-Top: 1%">댓글보기</button></a>
											</div>

											<div class="repliesDiv" style="display: none">
												<div class="post-comment">
													<img src="/displayGroupCoverFile?fileName=${userInfo.memimg}" class="profile-photo-sm" /> <input
														type="hidden" value="${list.postNo}" name="postNo"
														class="postNo" /> <input type="text"
														style="position: relative;" class="commConText"
														placeholder="댓글을 입력해주세요.">
													<button class="btn-addComments"
														style="background-color: #27aae1; border: none; color: white; border-radius: 15px; font-size: 12px; position: relative; outline: none; float: right; padding: 2px 10px;"
														type="submit">댓글작성</button>
												</div>
												<a href="#"><button class="btn-primary-comments"
														style="margin-Top: 1%">댓글창 닫기</button></a>
												<ul class="repliesDiv-div">
													<!-- 댓글 내용 펼침 구역 -->
												</ul>
												<div class='repliesPage'>
													<ul id="pagination" class="pagination pagination-sm no-margin">
														<!-- 댓글 페이지 처리 구역 -->
														<input type="hidden" value="${list.postNo}" class="postNo" />
													</ul>
												</div>											
											</div>

											<div class="line-divider"></div>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
						
						<c:if test="${pageMaker.hasContent()}">
					<div class="wrap-button">
						<input type="hidden" value="${pageMaker.page}" name="page" />
						<nav>
						<c:if test="${pageMaker.prev}">
							<a href="${pageContext.request.contextPath}/timeline/timelineList/${userInfo.memno}/${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a href="${pageContext.request.contextPath}/timeline/timelineList/${userInfo.memno}/${pageMaker.makeSearch(idx)}" class="button-page">${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="${pageContext.request.contextPath}/timeline/timelineList/${userInfo.memno}/${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
						</c:if>
						</nav>
					</div>
				</c:if>
						
						

					</div>
				<!-- ============== FollowList Div  ===================-->	
					<div class="friend-list" id="myTest"></div>
				<!-- ============== FollowList Div  ===================-->	


				</div>
			</div>
		</div>
	</div>
</div>

<div id="pagenation" style="display:block;">
	<nav><ul class="pagination pagination-sm no-margin"></ul></nav>
</div>
<br>
<!-- Modal -->

 <!-- ==========================followList Template Start============================= -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="followTemplate" type="text/x-handlebars-template"> 
{{#each .}}            
	<div class="row followList item" style="display:block; width:45%; float:left; margin-right:5%">
			<div class="col-md-4" style="width:100%;">
				<div class="friend-card" >
					<img src="/displayGroupCoverFile?fileName={{covimg}}" style="width:460px; height:100px; " alt="profile-cover" class="img-responsive cover" style="object-fit: cover;"/>
					<div class="card-info">
						<img src="/displayGroupCoverFile?fileName={{memimg}}" alt="user" class="profile-photo-lg" />
						<div class="friend-info">
							<a href="#" class="pull-right text-green"></a>
							<h5><a href="${pageContext.request.contextPath}/timeline/timelineList/{{memno}}" 
								class="profile-link">{{id}}</a></h5>
							<p>{{job}}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
{{/each}}
</script>    
 <!-- ==========================followList Template End============================= -->
 
<div id="commentsModal" class="modal modal-primary fade" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p>
					<input type="text" id="replytext" class="form-control">
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<!-- 첨부파일 기능 -->
<script id="templateattach" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>




<script>
/////////////////버튼스크롤 START///////////////
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
/////////////////버튼스크롤 END///////////////


	var templateattach = Handlebars.compile($("#templateattach").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = templateattach(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	$("#insert").submit(
			function(event) {
				event.preventDefault();
				var that = $(this);

				var str = "";
				$(".uploadedList .delbtn").each(
						function(index) {
							str += "<input type='hidden' name='files[" + index
									+ "]' value='" + $(this).attr("href")
									+ "'> ";
						});

				that.append(str);

				that.get(0).submit();
			});
</script>

<script>
<!-- 검색기능 -->
$(document).ready(
		function() {
			$('#timelineSearchBtn').on(
					"click",
					function(event) {

						self.location = "timelineList" + "&keyword=" + $('#keywordInput').val();

					});
		});

</script>
<script>
$( document ).ready(function() {
	
var pageNo = 0;

	
	
	
	var memno = ${userInfo.memno};
	
	var keyword = $('#keywordInput').val();
	if(keyword == ""){
		keyword = "not match";
	}
	
 	$(window).on('load', function() { 
		   $(".create-post").show();
		   $("#searchFollow").hide();
	});
 	


	//팔로잉 탭 클릭 시
	$('#following, #followingM').on("click",function(e){ 	
		e.preventDefault();
		var pageNo = 1; 

		$("#keywordInput").val("");
		$(".searchTimeline").hide();
		/* if($('#keywordInput').val() == ""){
			var keyword = "not match";
		} */

		$(this).addClass("active");                     
        $(this).parent().siblings().children().removeClass("active"); 
		
		if($(".create-post").hide()){ //팔로워->팔로잉 클릭 or 팔로잉 ->팔로워
			$("#searchFollow").show();	
			$(".friend-list").children().remove();
		}else{
			$("#searchFollow").show();		
			$(".create-post").hide();
			$(".searchTimeline").hide();
		}
		
		getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);
		
		$(window).scroll(function() {
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				pageNo++;
				getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);
			}
		});
		
		//getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);

	});
		
	
	
	//팔로워 탭 클릭 시	
	$('#follower, #followerM').on("click",function(e){ 
		e.preventDefault();
		var pageNo = 1; 

		$("#keywordInput").val("");
		$(".searchTimeline").hide();

		$(this).addClass("active");                     
        $(this).parent().siblings().children().removeClass("active");
        
		
		if ($(".create-post").hide()){
			$("#searchFollow").show();
			$(".friend-list").children().remove();		
		} else {
			$("#searchFollow").show();
			$(".create-post").hide();
			$(".searchTimeline").hide();
		}
		
		getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);
		
		$(window).scroll(function() {
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				pageNo++;
				getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);
			}
		});
		
		//getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);
	});	
	
	

	
	
	//팔로잉, 팔로워 검색버튼 클릭 시
	$('#searchBtn').on("click",function(event) {
		var keyword = $('#keywordInput').val();
		if(keyword == ""){
			keyword = "not match";
		}
		pageNo = 1; 
		$(".friend-list").children().remove();
		
		if($('#following, #followingM').hasClass("active")){
			getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);
 
		}else if($('#follower, #followerM').hasClass("active")){
			getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);

		}  

		 
	});
	
	   /* 팔로잉, 팔로워 검색버튼 엔터 동시적용 */
 	   const input = document.querySelector('#keywordInput');
	   input.addEventListener('keyup',function(e){
	       if (e.keyCode === 13) {
	         var keyword = $('#keywordInput').val();
	         if(keyword == ""){
	            keyword = "not match";
	         }
	         
	         $(".friend-list").children().remove();
	         
	         if($('#following, #followingM').hasClass("active")){
	            getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);
	    
	         }else if($('#follower, #followerM').hasClass("active")){
	            getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);

	         }  
	     }  
	 });

	//팔로우 데이터 가져오기
	function getFollowList(pageInfo){							
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".friend-list"), $('#followTemplate'));
			printPaging(data.pageMaker, $("#pagenation ul") );
		});
	}
	
	//팔로우 데이터 뷰에 출력
	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		target.append(html);
	}
	
	

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li ><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
		}

		if(pageMaker.startPage != 0 ){
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.pageCriteria.pageNo == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}
		}
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
			+ "'> >> </a></li>";
		}

		target.html(str);
	};

	
	
	$("#pagenation ul").on("click", "li a", function(e){
		e.preventDefault();	
		var pageNo = $(this).attr("href");
		
		$(".friend-list").children().remove();
		
		if($('#following').hasClass("active")){
			getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);
 
		}else if($('#follower').hasClass("active")){
			getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);

		}
						
	});

	
	
	
	
	<!-- follow목록 핸들바 헬퍼 -->
	/* Handlebars.registerHelper("contentsTest", function(memno, option) {
		var dataCount = '';
		if (memno < 1) {
			dataCount += option.fn();
		}
		return dataCount;
		});	
	
	
	{{#contentsTest memno }}	
	<tr>
	<td colspan="4">팔로우 목록이 없습니다..친구를 만들어보세요!gfgfgh</td>
	</tr>
	{{/contentsTest}}	 */

	
}); //docu.ready end
</script>



<!--  댓글 리스트 기능 -->
<script id="commListTemplate" type="text/x-handlebars-template">
			{{#each .}}
			<li class="post-comment replyLi" data-comNo={{comNo}}>
			<div class="li-postNo" data-postNo={{postNo}}></div>
			<img src="/displayGroupCoverFile?fileName={{memImg}}" alt="" class="profile-photo-sm" />
			<a href="${pageContext.request.contextPath}/timeline/timelineList/{{memNo}}" class="profile-link"> {{id}}</a>		
			<i class="em em-laughing"><div class="comCon">{{comCon}}</div></i>
			
			{{#eqReplyer memNo }}
			<a class="btn btn-primary btn" data-toggle="modal" data-target="#commentsModal" 
			style="background-color: #27aae1; border: none; color: white; border-radius:15px; font-size: 0.9em; 
			position:relative; outline:none; float:right; padding: 2px 2px; height:1.8em; margin-top: 1%; width: 2.3em; left:10px; ">수정</a>
			{{/eqReplyer}}

			</li>
			{{/each}}
	</script>




<script>
		Handlebars.registerHelper("eqReplyer", function(memNo, option) {
		var accum = '';
		if (memNo == '${member.memno}') {
			accum += option.fn();
		}
		return accum;
		});	
	</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- $("#commentsModal").modal('hide'); -->
<script> 
	       					<!-- 댓글창 열기 -->
	$(document).ready(function(){
		$(".commDiv a").on("click",function(e){
			e.preventDefault();
								
			var postNo = $(this).prev().val();
										
			$(".repliesDiv").hide();	
			getCommPage("/comments/" + postNo + "/1");
			//$(this).hide();	
			$(this).parent().next().show();	
		});
	});
						
						
	<!-- 댓글창 닫기 -->
	$(document).ready(function(){
 		$(".repliesDiv a").click(function(e){
 			e.preventDefault();
 			//$(this).parent().prev().children().show();
  			$(this).parent().hide();
  			/* $(this).next().append().remove();  */
  		});
	}); 
						
						
	//var bno = ${boardVO.bno};
	var pageNo = 1;
						
	function getCommPage(pageInfo){							
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".repliesDiv-div"), $('#commListTemplate'));
			printPaging(data.pageMaker, $(".repliesPage ul") ); 
			$("#commentsModal").modal('hide');
			/* $("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]"); */
								
		});
	}
						
						
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".repliesDiv li").remove();
		target.append(html);
		
	}
				
	
	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li ><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
			//<li><a href='(pageMaker.startPage - 1)'>  이전페이지  </a></li>
		}

		if(pageMaker.startPage != 0 ){
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.pageCriteria.pageNo == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			//<li class=active><a href='1'> 1 </a></li>
		}
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
			//<li><a href='(pageMaker.endPage + 1)'> 다음페이지 </a></li>
		}

		target.html(str);
	}; 
	
						
	
	$(".repliesPage ul").on("click", "li a", function(e){
		
		e.preventDefault();
							
		pageNo = $(this).attr("href");
		var postNo = $('.li-postNo').attr("data-postNo");	

		getCommPage("/comments/" + postNo + "/" + pageNo);
							
	});

				
	
					
	/* 댓글쓰기 */
	$(".btn-addComments").on("click",function(){

	var comConText = $(this).prev();
	var comCon = comConText.val();
	console.log("comCon: " + comCon);
	var postNo=	$(this).prev().prev().val();
	console.log("postNo: " + postNo);
	
		  
	$.ajax({
		type:'post',
		url:'/comments/',
		headers: { 
				    "Content-Type": "application/json",
				    "X-HTTP-Method-Override": "POST" },
		dataType:'text',
		data: JSON.stringify({postNo:postNo, comCon:comCon}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'SUCCESS'){
				alert("등록 되었습니다.");
				comConText.val("");
				getCommPage("/comments/" + postNo + "/" +  pageNo);
			}
		}});
	});
	 
	<!-- 댓글 수정 버튼 누르면 나오는 모달 창.. -->
		$(".repliesDiv-div").on("click", ".replyLi", function(event){
			var reply = $(this);
			$("#replytext").val(reply.find('.comCon').text());
			$(".modal-title").html(reply.attr("data-comNo"));
		}); 
		
	
	$("#replyModBtn").on("click", function() {
		var postNo = $('.li-postNo').attr("data-postNo");	
		var comNo =  $(".modal-title").html();
		var comCon = $("#replytext").val();
		console.log("postNo: " + postNo);
		console.log("comNo: " + comNo);

		$.ajax({
			type : 'put',
			url : '/comments/' + comNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({comCon : comCon}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getCommPage("/comments/" + postNo + "/" + pageNo );
				}
			}
		});
	});
	
	
	$("#replyDelBtn").on("click", function() {
		var postNo = $('.li-postNo').attr("data-postNo");	
		var comNo =  $(".modal-title").html();
		//var comCon = $("#replytext").val();
		console.log("postNo: " + postNo);
		console.log("comNo: " + comNo);

		$.ajax({
			type : 'delete',
			url : '/comments/' + comNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getCommPage("/comments/" + postNo + "/" + pageNo );
				}
			}
		});
	});

	

	
	
	</script>









<%@ include file="../include/footer.jspf"%>