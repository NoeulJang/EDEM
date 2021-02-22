<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="../include/header.jspf" %> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
            	<li class="active"><a href="/group/groupNewsfeed">내 그룹</a></li>
            	<li><a href="/group/groupRegister">그룹 생성</a></li>
            	<c:choose> 
            	<c:when test="${auth eq '관리자'}">
              		<li><a href="${pageContext.request.contextPath}/group/groupAddMember">멤버관리</a></li>
              	</c:when>
              	<c:when test="${auth eq '일반회원'}">
              		<li><a href="${pageContext.request.contextPath}/group/removeMember" 
              		onclick="return confirm('정말로 그룹을 탈퇴하시겠습니까?')">그룹탈퇴</a></li>
              	</c:when>
              	</c:choose>
            </ul>
            
          </div>
    			<div class="col-md-7">

            <!-- Post Content
            ================================================= -->
            <div class="scrollView">
            
			<div class="block-title">
				<form action="${pageContext.request.contextPath}/group/groupNewsfeedWrite" method="get">
					<div class="form-group">
						<h4 class="grey">
						<input type="hidden" value="${Intro.grno}" name="grno">
						<input type="hidden" value="${member.memno}" name="memno">
						<i class="icon ion-android-checkmark-circle" style = "margin-left:5%"></i> ${Intro.grname}
						<button class="btn btn-primary-post" style = "margin-left:60%" type="submit">글쓰기</button>
						</h4>
					</div>
				</form>
			</div>
			
			<c:if test="${totalCount == 0}">
			<div class="post-content">
				<tr>
					<td colspan="4">게시글이 없습니다.</td>
				</tr>
			</div>
			</c:if>
			<div id="groupNewsfeed">
			
			</div>
    	</div>
					
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
					 <!-- 	{{#attachHelper fullname}}
		<img src="/displayGroupCoverFile?fileName={{fullname}}" alt="post-image" class="img-responsive post-image" />
		{{/attachHelper}} -->
<script id="template" type="text/x-handlebars-template">
	{{#each list}}
	<div class="post-content">

		
		<img src="/displayGroupCoverFile?fileName={{fullname}}" alt="post-image" class="img-responsive post-image" />
        		<div class="post-container">
				<img src="/displayGroupCoverFile?fileName={{memimg}}" alt="user" class="profile-photo-md pull-left" />
                <div class="post-detail">
	                  <div class="user-info">
	                    <h5><a href="${pageContext.request.contextPath}/timeline/timelineList/{{memno}}" class="profile-link">{{id}}</a> 
	                    <span class="following"><!-- following --></span></h5>  
	                    <p class="text-muted">{{grpodate}}</p>
	                  </div>
	                  <div class="line-divider"></div>
	                  <div class="post-text">
	                    <p>{{grpocon}}<i class="em em-anguished"></i> <i class="em em-anguished"></i> <i class="em em-anguished"></i></p>
	                  </div>
	                  <div class="line-divider"></div>

					<div class="commDiv">
						<div class="li-grpostno" data-grpostno={{grpostno}}></div>
						<a href="#"><button type="submit" class="btn-primary-comments" style="margin-Top: 1%; ">댓글보기</button></a>
						<div class="div-grpostno" style="content-visibility: hidden;" data-grpostno={{grpostno}}></div>
					</div>




					<div class="repliesDiv" style="display: none; margin-left: 0%; margin-right: 10%;"">
						<div class="post-comment">
							<img src="/displayGroupCoverFile?fileName=${member.memimg}" class="profile-photo-sm" />

							<input type="text" style="position: relative; float: left; background-color:#f8f8f8; border:0.7px solid gray; 
												height: 30px; width: 50%; border-radius:7px; margin: 2px 2px 3px 2px;" class="commConText" 
												placeholder="댓글을 입력해주세요.">
							<div class="li-grpostno" data-grpostno={{grpostno}}></div>
							<button class="btn-addComments btn-primary-comments" id="btn-subm" type="submit" 
										style="height:10%; margin-Top: 0.5%; background-color:#f8f8f8; border:0.7px solid gray; 
										color : gray; min-width: max-content;">등록</button>
						</div>


						<ul class="repliesDiv-div" style="">
							<!-- 댓글 내용 펼침 구역 -->
						</ul>
						<div class='repliesPage'>
							<ul id="pagination" class="pagination pagination-sm no-margin">
								<!-- 댓글 페이지 처리 구역 -->
							</ul>
							
						</div>
						<a href="#"><button class="btn-primary-comments" id="btn-clo" style="margin-Top: 1%; ">댓글닫기</button></a>
					</div>

					
                </div>
              </div>
            </div>	
	{{/each}}
</script>

<script id="commListTemplate" type="text/x-handlebars-template">
			{{#each .}}
			<li class="post-comment replyLi" data-comNo={{rno}}>
			<div class="li-grpostno" data-grpostno={{grpostno}}></div>
			<img src="/displayGroupCoverFile?fileName={{memimg}}" alt="" class="profile-photo-sm" />
			<a href="${pageContext.request.contextPath}/timeline/timelineList/{{memno}}" class="profile-link"> {{id}}</a>		
			<i class="em em-laughing"><div class="comCon">{{content}}</div></i>
			
			{{#eqReplyer memno}}
			<a class="btn btn-primary btn" id="btn-modi-reply" data-toggle="modal" data-target="#commentsModal" 
			style="background-color: #27aae1; border: none; color: white; border-radius:15px; font-size: 0.9em; 
			position:relative; outline:none; float:right; padding: 2px 2px; height:1.8em; margin-top: 1%; width: 2.3em; left:10px; ">수정</a>
			{{/eqReplyer}}

			</li>
			{{/each}}
</script>

<script>
Handlebars.registerHelper("attachHelper", function(fullname, option) {
	console.log("attachHelper 실행됨!");
	var accum = '';
	if (fullname != 'nofile') {
	   accum += option.fn();
	   return accum;
	}else{
		console.log("dddd" + fullname);
		accum += option.inverse(fullname);
		return accum;
	}
	
});

Handlebars.registerHelper("eqReplyer", function(memno, block) {
	var accum = '';
	if (memno == '${member.memno}') {
		accum += block.fn();
	}
	return accum;
});
</script>

<script type="text/javascript">
$( document ).ready(function() {
	var page = 0;
	$(window).scroll(function() {
		var scrTop = $(window).scrollTop()+50;
		var docHi = ($(document).height() - $(window).height());
		if (scrTop >= docHi) {
			page++;
			getPage("/group/groupNewsfeedGet?page=" + page);
		}
	});
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data, $("#groupNewsfeed"), $('#template'));
			});
	}
	
	var printData = function(groupNewsfeedArr, target, templateObject) {
	
		var template = Handlebars.compile(templateObject.html());
	
		var html = template(groupNewsfeedArr);
		target.append(html);
	}
});
</script>
<!-- 댓글 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	function getCommPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".repliesDiv-div"), $('#commListTemplate'));
			printPaging(data.pageMaker, $(".repliesPage ul")); 
			$("#commentsModal").modal('hide');
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
		}
	
		if(pageMaker.startPage != 0 ){
			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.pageCriteria.pageNo == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			}
		}
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		target.html(str);
	};
	
	//댓글 리스트 출력 및 닫기
	$("#groupNewsfeed").on("click", ".commDiv a",function(e){
		e.preventDefault();					
		var grpostno = $(this).prev().attr("data-grpostno");
		console.log("grgrgrgrrgpopopo" + grpostno);
		$(".div-grpostno").html(grpostno);
									
		$(".repliesDiv").hide();	
		getCommPage("/reply/listReply/" + grpostno + "/1");
		$(this).parent().next().show();	
	});

	$("#groupNewsfeed").on("click", "#btn-clo", function(e){
		e.preventDefault();
		$(".commDiv").next().hide();
	});
	
	
	//댓글 페이징
	var pageno = 1;
	
	$("#groupNewsfeed").on("click", "#pagination li a", function(e){
		
		e.preventDefault();
							
		pageno = $(this).attr("href");
		console.log("pageno : " + pageno);
		var grpostno =  $("#groupNewsfeed .commDiv .div-grpostno").html();
		console.log("grpostno : " + grpostno);
		
		getCommPage("/reply/listReply/" + grpostno + "/" + pageno);
	});
	
	//댓글쓰기
	$("#groupNewsfeed").on("click", "#btn-subm", function(){

		var comConText = $(this).prev().prev();
		var content = comConText.val();
		console.log("comCon: " + content);
		var grpostno = $(this).prev().attr("data-grpostno");	
		console.log("grpostno: " + grpostno);
		
		$.ajax({
			type:'post',
			url:'/reply/addReply/',
			headers: { 
					    "Content-Type": "application/json",
					    "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({grpostno:grpostno, content:content}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					comConText.val("");
					getCommPage("/reply/listReply/" + grpostno + "/" + pageno);
				}
			}});
		});
	
	//댓글 수정을 누를시 모달창에 댓글내용과 번호 입력
	$("#groupNewsfeed").on("click", ".replyLi", function(event){
		var reply = $(this);
		$("#replytext").val(reply.find('.comCon').text());
		$(".modal-title").html(reply.attr("data-comNo"));
	});
	
	//모달창에서 실질적인 댓글 수정작업
	$("#replyModBtn").on("click", function() {
		var grpostno =  $("#groupNewsfeed .commDiv .div-grpostno").html();
		var comNo =  $(".modal-title").html();
		var comCon = $("#replytext").val(); //수정된 내용
		
		console.log("grpostNo: " + grpostno);
		console.log("comNo: " + comNo);
		console.log("comCon: " + comCon);

		$.ajax({
			type : 'put',
			url : '/reply/modify/' + comNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({content : comCon}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					getCommPage("/reply/listReply/" + grpostno + "/" + pageno);
				}
			}
		});
	});
	
	$("#replyDelBtn").on("click", function() { 
		//var grpostNo = $('#groupNewsfeed .li-grpostno').attr("data-grpostno");	
		var grpostno =  $("#groupNewsfeed .commDiv .div-grpostno").html();
		var comNo =  $(".modal-title").html();

		$.ajax({
			type : 'delete',
			url : '/reply/delete/' + comNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					getCommPage("/reply/listReply/" + grpostno + "/" + pageno);
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
		</div>		
    	</div>
    </div>
    </div>
<%@ include file="../include/footer.jspf" %> 