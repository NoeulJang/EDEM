<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="../include/header.jspf"%>

<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>

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
							<li><a href="${pageContext.request.contextPath}/timeline/timelineList" class="active">타임라인</a></li>
							<li><a href="#" id="following">팔로잉</a></li>
							<li><a href="#" id="follower">팔로워</a></li>
						</ul>
						<ul class="follow-me list-inline">
							<li><p style="margin-Top:7%;"> ${member.id}님을 ${member.followers}명이 팔로우중입니다.</p></li>
							<!-- <li>1,299 people following her 팔로워 수</li>
							<li><button class="btn-primary">친구 추가</button></li> -->
						</ul>
					</div>
				</div>
			</div>
			<!--Timeline Menu for Large Screens End-->
<%-- 
			<!--Timeline Menu for Small Screens-->
			<div class="navbar-mobile hidden-lg hidden-md">
				<div class="profile-info">
					<img src="${member.memimg}" alt=""
						class="img-responsive profile-photo" />
					<h4>Sarah Cruiz</h4>
					<p class="text-muted">Creative Director</p>
				</div>
				<div class="mobile-menu">
					<ul class="list-inline">
						<li><a href="timline.html" class="active"></a></li>
						<li><a href="timeline-about.html"></a></li>
						<li><a href="timeline-album.html">Album</a></li>
						<li><a href="timeline-friends.html">Friends</a></li>
					</ul>
					<button class="btn-primary">Add Friend</button>
				</div>
			</div>
			<!--Timeline Menu for Small Screens End--> --%>

		</div>
		<div id="page-contents">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-7">


					<!-- Post Content
              ================================================= -->
             
              <div class="create-post">
						<div class="row">
							<div class="col-md-7 col-sm-7">
							</div>
						</div>
					</div>
					
					<div class="scrollView">

						<div class="post-content">
							<!--Post Date-->
							<div>
								<!-- class="post-date hidden-xs hidden-sm" -->
								<h5></h5>
							</div>
							<!--Post Date End-->
                   
							<div class="post-container">
								<img src="/displayGroupCoverFile?fileName=${member.memimg}" alt="user"
									class="profile-photo-md pull-left" />
								<div class="post-detail">
									<div class="user-info">
										<h5>
											<a href="${pageContext.request.contextPath}/timeline/timelineList" 
											class="profile-link">${member.id}
											</a> <span class="following"><!-- following --></span>
										</h5>
									</div>
<!-- 									<div class="reaction">
										<a class="btn text-green"><i class="icon ion-thumbsup"></i>
										 </a> <a class="btn text-red"><i class="fa fa-thumbs-down"></i>
											0</a>
									</div> -->
									<div class="line-divider"></div>
									<div class="post-text">
										
										<form role="form"  action="timelinemodify" method="post" id="insert">
									<c:if test="${list.fullname ne 'nofile'}">	
									<img src="/displayGroupCoverFile?fileName=${list.fullname}"
												style="width: 500px; height: 200px;" alt="profile-cover"
												class="img-responsive cover" />
									</c:if>
											<textarea name="postCon" id="postCon" rows="5" cols="30">${list.postCon}</textarea>
											
											
												<div class="form-group">
													<label for="exampleInputEmail1">첨부파일</label>
													<div class="fileDrop"></div>
												</div>
											
											
											<ul class="mailbox-attachments clearfix uploadedList"></ul>
											
											<button type="submit" onclick="return confirm('정말로 수정하시겠습니까?')"
												class="btn-primary-comments" style="margin-Top:3%">수정하기</button>
										
										</form>
									</div>

									<div class="line-divider"></div>

								</div>
							</div>
						
						</div>

						<%--  </c:forEach> --%>
					</div>
			


				</div>
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

	$("#postCon").blur(function(){
		if($.trim($("#postCon").val()) == "" ){
			alert("수정 할 내용을 입력해 주세요");
			return false;
		}
	});
	
	$("#insert").submit(
			function(event) {
				
				if($.trim($("#postCon").val()) == "" ){
					alert("수정 할 내용을 입력해 주세요");
					return false;
				}
				
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

<%@ include file="../include/footer.jspf"%>