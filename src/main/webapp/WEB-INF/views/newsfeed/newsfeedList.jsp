<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
</style>



<div id="page-contents">
	<div class="container">
		<div class="row">
			<!-- Newsfeed Common Side Bar Left
          ================================================= -->
			<div class="col-md-3 static">
				<div class="profile-card">
					<img src="/displayGroupCoverFile?fileName=${member.memimg}" alt="user" class="profile-photo" />
					<h5>
						<a href="${pageContext.request.contextPath}/timeline/timelineList/${member.memno}"
							class="text-white">${member.id}</a>
					</h5>
					<a href="#" class="text-white"><i
						class="ion ion-android-person-add"></i>${member.followers}명이 팔로잉중 </a>
				</div>
				<!--profile card ends-->
				<ul class="nav-news-feed">
					<li><i class="icon ion-ios-paper"></i>
						<div>
							<a href="${pageContext.request.contextPath}/timeline/timelineList">타임라인</a>
						</div></li>
					<li><i class="icon ion-ios-paper"></i>
						<div>
							<a href="${pageContext.request.contextPath}/newsfeed/newsfeedList">뉴스피드</a>
						</div></li>
					<li><i class="icon ion-ios-paper"></i>
						<div>
							<a href="${pageContext.request.contextPath}/group/groupIndex.do">그룹</a>
						</div></li>
				</ul>
			</div>

<div class="col-md-7">

<div class='box-body'>
<form>
	<select name="searchType" style="background-color:#f8f8f8;  height: 4%; width: 22%; border-radius:7px; margin: 2px 2px 10px 2px;" required>
		<option value="null" 
			<c:out value="${cri.searchType == null?'selected':''}"/> >---</option>
		<option value="id"
			<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>ID</option>
		<option value="content"
			<c:out value="${cri.searchType eq 'content'?'selected':''}"/>>Content</option>
		<option value="ic"
			<c:out value="${cri.searchType eq 'ic'?'selected':''}"/>>ID OR Content</option>
	</select> 
	<input type="text" name='keyword' id="keywordInput"  value='${cri.keyword}' 
			style="background-color:#f8f8f8; border:0.7px solid gray; height: 4%; width: 60%; 
			border-radius:7px; margin: 2px 2px 10px 2px;" placeholder="게시물을 검색하세요." required/>

	<button type="submit" id='searchBtn' style="background-color: #f8f8f8; height: 4%; width: 7%; border-radius:15px; border:0.7px solid gray; margin: 2px 2px 10px 2px;" >
		<i class="icon ion-android-search "></i>
	</button>
</form>
</div>


<!-- ====================Post Content ================================================= -->
<div class="scrollView">
<!-- ====================Template Div Start================================================= -->


<c:forEach var="nf" items="${newsfeed}">
	<div class="post-content">
	<!-- <img src="http://placehold.it/1920x1280" alt="post-image" class="img-responsive post-image" /> -->
		<c:if test="${nf.fullname ne 'nofile'}">
			<img src="/displayGroupCoverFile?fileName=${nf.fullname}" alt="post-image" class="img-responsive post-image" style="height:50%;"/>
		</c:if>
		<div class="post-container">
			<img src="/displayGroupCoverFile?fileName=${nf.memImg}" alt="user" class="profile-photo-md pull-left" />
				<div class="post-detail">
					<div class="user-info">						
						
						<h5>
						<a href="${pageContext.request.contextPath}/timeline/timelineList/${nf.memNo}" 
								class="profile-link">${nf.id}</a> 
						<span class="following">following</span>
						</h5>
						
						<p class="text-muted">${nf.postDate}</p>
					</div>
<%-- 					<div class="reaction">
						<a href="${pageContext.request.contextPath}/newsfeed/newsfeedLike.do?postNo=${nf.postNo}"
							class="btn text-green" type="submit"> 
							<i class="icon ion-thumbsup"></i>${nf.postLike}</a>
						<!-- <a class="btn text-red"><i class="fa fa-thumbs-down"></i>0</a> -->
					</div> --%>
					<div class="line-divider"></div>
					<div class="post-text">
						<p>${nf.postCon}<i class="em em-anguished"></i><i class="em em-anguished"></i><i class="em em-anguished"></i></p>
					</div>

					<div class="commDiv">
						<input type="hidden" name="postNo" class="postNo" value="${nf.postNo}"> 
						<a href="#"><button type="submit" class="btn-primary-comments" style="margin-Top: 1%; ">댓글보기</button></a>
					</div>
									
					<div class="repliesDiv" style="display: none; margin-left: 0%; margin-right: 10%;">
						<div class="post-comment">
							<img src="/displayGroupCoverFile?fileName=${member.memimg}" class="profile-photo-sm" />
							<input type="hidden" value="${nf.postNo}" name="postNo" class="postNo" />
							<input type="text" style="position: relative; float: left; background-color:#f8f8f8; border:0.7px solid gray; 
												height: 30px; width: 50%; border-radius:7px; margin: 2px 2px 3px 2px;" class="commConText" 
												placeholder="댓글을 입력해주세요.">
							<button class="btn-addComments btn-primary-comments" type="submit" 
										style="height:10%; margin-Top: 0.5%; background-color:#f8f8f8; border:0.7px solid gray; color : gray; min-width: max-content;">등록</button>
						</div>
						<ul class="repliesDiv-div" style="">
							<!-- 댓글 내용 펼침 구역 -->
						</ul>
						<div class='repliesPage'>
							<ul id="pagination" class="pagination pagination-sm no-margin">
								<!-- 댓글 페이지 처리 구역 -->
						
								<input type="hidden" name="rePostNo" id="rePostNo" class="postNo" value="${nf.postNo}"> 
							</ul>
							
						</div>
						<a href="#"><button class="btn-primary-comments" style="margin-Top: 1%; ">댓글닫기</button></a>
					</div>
					<div class="line-divider"></div>
				</div>
		</div>
	</div>
</c:forEach>


	<c:if test="${pageMaker.hasNoContent()}">
		<tr>
			<td colspan="4">게시글이 없습니다.</td>
		</tr>
	</c:if> 


<!-- ====================Template Div End================================================= -->
</div>
			<!-- 뉴스피드 글목록 페이지 표시  -->

				<c:if test="${pageMaker.hasContent()}">
					<div class="wrap-button">
						<input type="hidden" value="${pageMaker.pageNo}" name="pageNo" />
						<nav>
						<c:if test="${pageMaker.prev}">
							<a href="${pageContext.request.contextPath}/newsfeed/newsfeedList/${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a href="${pageContext.request.contextPath}/newsfeed/newsfeedList/${pageMaker.makeSearch(idx)}" class="button-page">${idx}</a>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="${pageContext.request.contextPath}/newsfeed/newsfeedList/${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
						</c:if>
						</nav>
					</div>
				</c:if>





			</div>
		</div>
	</div>
</div>




			<!--      @@@@@ Modal(댓글 수정 모달) @@@@@      -->
			
			<div id="commentsModal" class="modal modal-primary fade" role="dialog" aria-hidden="true">
  			<div class="modal-dialog">
  			  <!-- Modal content-->
  			  <div class="modal-content">
   			   <div class="modal-header">
     			   <button type="button" class="close" data-dismiss="modal">&times;</button>
    			    <h4 class="modal-title"></h4>
    			  </div>
    			  <div class="modal-body" data-rno>
    			    <p><input type="text" id="replytext" class="form-control"></p>
   			   </div>
   			   <div class="modal-footer">
    			    <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
    			    <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
      			  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
    			  </div>
   			 </div>
 			 </div>
			</div>


	<script id="commListTemplate" type="text/x-handlebars-template">
			{{#each .}}
			<li class="post-comment replyLi" data-comNo={{comNo}}>
			<div class="li-postNo" data-postNo={{postNo}}></div>
			<img src="/displayGroupCoverFile?fileName={{memImg}}" alt="" class="profile-photo-sm" />
			<a href="${pageContext.request.contextPath}/timeline/timelineList/{{memNo}}" class="profile-link"> {{id}}</a>		
			<i class="em em-laughing"><div class="comCon">{{comCon}} </div></i>
			
			{{#eqReplyer memNo }}
			<a class="btn btn-primary btn" data-toggle="modal" data-target="#commentsModal" 
			style="background-color: #27aae1; border: none; color: white; border-radius:15px; font-size: 0.9em; 
			position:relative; outline:none; float:right; padding: 2px 2px; height:1.8em; margin-top: 1%; width: 2.3em; left:10px; ">수정</a>
			{{/eqReplyer}}

			</li>
			{{/each}}
	</script>
	
	<!-- 헬퍼 -->
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
	<script> 
	function onsubmit(){
	    document.forms['goTimeline'].submit();
	    return false;
	}

	$('#searchBtn').on("click",function(event) {
		self.location = '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
	});
	
	   const input = document.querySelector('#keywordInput');
	   input.addEventListener('keyup',function(e){
	       if (e.keyCode === 13) {
	    	   self.location = '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
	     }  
	 });
	
	
      	<!-- 댓글창 열기 / 댓글보기-->	
		$(".commDiv a").on("click",function(e){
			e.preventDefault();
								
			var postNo = $(this).prev().val();
										
			$(".repliesDiv").hide();	
			getCommPage("/comments/" + postNo + "/1");
			$(this).parent().next().show();	
		});
	
						
						
	<!-- 댓글창 닫기 -->
 		$(".repliesDiv a").click(function(e){
 			e.preventDefault();
  			$(this).parent().hide();
  		
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
				pageNo=1;
				getCommPage("/comments/" + postNo + "/" +  pageNo);
			}
		}});
	});
	
	
	
	<!-- 댓글 수정하기 버튼 누르면 나오는 모달 창에 데이터 삽입 (컨텐츠, 댓글번호).. -->
	$(".repliesDiv-div").on("click", ".replyLi", function(event){
		var reply = $(this);
		$("#replytext").val(reply.find('.comCon').text());
		$(".modal-title").html(reply.attr("data-comNo"));
	});
		
	
	
	$("#replyModBtn").on("click", function() {
		var postNo = $('.li-postNo').attr("data-postNo");	
		var comNo =  $(".modal-title").html();
		var comCon = $("#replytext").val(); //수정된 내용
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

<%@ include file="../include/footer.jspf"%>
