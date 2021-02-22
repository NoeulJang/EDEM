<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="../include/header.jspf"%>

<style>
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}
#myBtn:hover {
  background-color: #27aae1;
}
</style>

<button onclick="topFunction()" id="myBtn" title="Go to top">위로가기</button>

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
							


							<p class="text-muted"><!-- Creative Director --></p>
						</div>
					</div>
					
					<div class="col-md-9">
						<ul class="list-inline profile-menu btnSelect">
							<li>
							<a href="${pageContext.request.contextPath}/timeline/timelineList" class="active">타임라인</a>
							</li>
							<li><a href="#" id="following" >팔로잉</a></li>
							<li><a href="#" id="follower">팔로워</a></li>
						</ul>
						<ul class="follow-me list-inline">
							<li class="follwers">${member.id}님을 ${member.followers}명이 팔로우중입니다.</li>

							<li>
								<div>
									
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
			<!--Timeline Menu for Large Screens End-->



		</div>
		<div id="page-contents">
			<div class="row">
				<div class="col-md-3"></div> 
				<div class="col-md-7">
			
	<!-- Contents Box ================================================= -->

				<!-- ============== Follow Search Box Start ===================-->
					<div class='box-body' id="searchFollow">
						<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'
							style="background-color: #f8f8f8; border: 0.7px solid gray; height: 3%; width: 50%; border-radius: 7px; margin: 2px 2px 3px 2px;"
							placeholder=" 아이디를 검색하세요 " />

						<button id='searchBtn'
							style="background-color: #f8f8f8; height: 3%; width: 5%; border-radius: 15px; border: 0.7px solid gray; margin: 2px 2px 10px 2px;">
							<i class="icon ion-android-search "></i>
						</button>
					</div>
				<!-- ============== Follow Search Box End ===================-->
				
				
				
				<!-- ============== Timeline Post Box Start ===================-->
					<div class="create-post">
						<div class="row">
						
							<form id='writeForm' role="form" method="post">
							<div class="col-md-7 col-sm-7">
								<div class="form-group">
									<img src="http://placehold.it/300x300" alt=""
										class="profile-photo-md" />
									<textarea name="contents" id="exampleTextarea" cols="30" rows="1"
										class="form-control" placeholder="Write what you wish"></textarea>
								</div> 
							</div>
							
							<div class="col-md-5 col-sm-5">
								<div class="tools">
									<ul class="publishing-tools list-inline">
										<li><a href="#"><i class="ion-compose"></i></a></li>
										<li><a href="#"><i class="ion-images"></i></a></li>
										<li><a href="#"><i class="ion-ios-videocam"></i></a></li>
										<li><a href="#"><i class="ion-map"></i></a></li>
									</ul>
									<!-- <a href="/timelineWrite"> -->
									<button type="submit" class="btn btn-primary pull-right">글쓰기</button>
									<!-- </a> -->
								</div>
							</div> 
							
							</form>
							
						</div>
					</div>
				<!-- ============== Timeline Post Box End ===================-->
				
					
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

             
 <!-- ==========================followList Template Start============================= -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="followTemplate" type="text/x-handlebars-template"> 
{{#each .}}            
	<div class="row followList item" style="display:block; width:45%; float:left; margin-right:5%">
			<div class="col-md-4" style="width:100%;">
				<div class="friend-card" >
					<img src="{{covimg}}" style="width:460px; height:100px; " alt="profile-cover" class="img-responsive cover" style="object-fit: cover;"/>
					<div class="card-info">
						<img src="{{memimg}}" alt="user" class="profile-photo-lg" />
						<div class="friend-info">
							<a href="#" class="pull-right text-green"></a>
							<h5><a href="${pageContext.request.contextPath}/friend/friendtimeline.do?memNo={{memno}}" 
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
            
            
		
<!-- FloatMenu -->
<script type="text/javascript">
//맨 위로 버튼
$("#up-atag").click( function() {
	//위의 태그를 클릭 하면 scrooTop : 0px 위치로 400ms의 속도로 이동
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	//위의 태그에 해당하는 모든 이벤트를 막음
	return false;
});

//따라다니는 메뉴
//기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
//.floatMenu가 위치한 css의 top -100px의 위치를 저장
var floatPosition = parseInt($(".floatMenu").css('top'))-100;
// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

$(window).scroll(function() {
	// 현재 스크롤 위치를 가져온다.
	var scrollTop = $(window).scrollTop();
	// 플로팅배너가 위치하고 있을 좌표를 가리킨다.
	var newPosition = scrollTop + floatPosition + "px";

	$(".floatMenu").stop().animate({
		"top" : newPosition
	}, 500);

}).scroll();
</script>


<!-- upScroll -->
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
		
		
		
		
		
<script>
$( document ).ready(function() {
	
	var pageNo = 0;
	
	var memno = ${member.memno};
	
	var keyword = $('#keywordInput').val();
	if(keyword == ""){
		keyword = "not match";
	}
	
 	$(window).on('load', function() { 
		   $(".create-post").show();
		   $("#searchFollow").hide();
	});
 	


	//팔로잉 탭 클릭 시
	$('#following').on("click",function(e){ 	
		e.preventDefault();
		/* pageNo = 1; //스크롤시페이지값저장?? */
		
	
		$("#keywordInput").val("");
		
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
		}
		
		getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);

	});
		
	
	
	//팔로워 탭 클릭 시	
	$('#follower').on("click",function(e){ 
		e.preventDefault();

		$("#keywordInput").val("");

		$(this).addClass("active");                     
        $(this).parent().siblings().children().removeClass("active");
        
		
		if ($(".create-post").hide()){
			$("#searchFollow").show();
			$(".friend-list").children().remove();		
		} else {
			$("#searchFollow").show();
			$(".create-post").hide();
		}
		
		getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);
		
		
	});	
	
	

	
	
	//팔로잉, 팔로워 검색버튼 클릭 시
	$('#searchBtn').on("click",function(event) {
		var keyword = $('#keywordInput').val();
		if(keyword == ""){
			keyword = "not match";
		}
		
		$(".friend-list").children().remove();
		
		if($('#following').hasClass("active")){
			getFollowList("/timeline/searchFollowing" + "/" + memno + "/" + keyword + "/" + pageNo);
 
		}else if($('#follower').hasClass("active")){
			getFollowList("/timeline/searchFollower" + "/" + memno + "/" + keyword + "/" + pageNo);

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


<!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
  



<%@ include file="../include/footer.jspf"%>
