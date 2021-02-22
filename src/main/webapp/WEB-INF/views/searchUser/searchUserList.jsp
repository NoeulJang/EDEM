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


<div class="container">

	<!-- Timeline
      ================================================= -->
	<div class="timeline">
		<div class="timeline-cover">
			<img src="/displayGroupCoverFile?fileName=${member.covimg}"
				style="width: 100%; height: 100%; max-height: 360px; vertical-align: middle" />
			<!--Timeline Menu for Large Screens-->
			<div class="timeline-nav-bar hidden-sm hidden-xs">
				<div class="row">
					<div class="col-md-3">
						<div class="profile-info">
							<img src="/displayGroupCoverFile?fileName=${member.memimg}"
								alt="" class="img-responsive profile-photo" />
							<h3>${member.id}</h3>
							<input type="hidden" value="${member.memno}" id="sessionMemno" />
							<p class="text-muted">${member.job}</p>
						</div>
					</div>
					<div class="col-md-9">
						<ul class="list-inline profile-menu">
							<li><a
								href="${pageContext.request.contextPath}/timeline/timelineList">타임라인</a></li>
						</ul>
						<ul class="follow-me list-inline">
							<li class="follwers" style="margin-Top: 7%;">${member.id}님을 ${member.followers}명이 팔로우중입니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<!--Timeline Menu for Large Screens End-->

			<!--Timeline Menu for Small Screens-->
			<div class="navbar-mobile hidden-lg hidden-md">
				<div class="profile-info">
					<img src="/displayGroupCoverFile?fileName=${member.memimg}" alt=""
						class="img-responsive profile-photo" />
					<h4>${member.id}</h4>
					<p class="text-muted">${member.job}</p>
				</div>
				<div class="mobile-menu">
					<ul class="list-inline">
						<li><a
							href="${pageContext.request.contextPath}/timeline/timelineList">타임라인</a></li>

					</ul>
					<ul class="follow-me list-inline">

						<li style="height: 100px;"><p style="margin-Top: 7%;">${member.id}님을
								${member.followers}명이 팔로우중입니다.</p></li>
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
					<div class='box-body' id="searchFollow" style="display:none; ">
						<input type="text"  id="keywordInput"
							style="background-color: #f8f8f8; border: 0.7px solid gray; height: 3%; width: 50%; border-radius: 7px; margin: 2px 2px 3px 2px;"
							placeholder=" 검색하세요 " />

						<button id='searchBtn'
							style="background-color: #f8f8f8; height: 3%; width: 5%; border-radius: 15px; border: 0.7px solid gray; margin: 2px 2px 10px 2px;">
							<i class="icon ion-android-search "></i>
						</button>
					</div>
					<!-- ============== Follow Search Box End ===================-->				



					<!-- Friend List ================================================= -->
					<div class="friend-list" style="height:100px;">
						<c:if test="${searchNumCheck == 0}">
							<h5>검색 된 아이디가 없습니다. 다시 검색 해 주세요:-)</h5>
						</c:if>
						<div class="row listDiv" data-keyword="${sessionKeyword}" data-searchType="${searchType}" >

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script id="friend-card" type="text/x-handlebars-template">
{{#each list}}
<div class="col-md-6 col-sm-6" style="height:300px;">
	<div class="friend-card">
		<img src="/displayGroupCoverFile?fileName={{covimg}}" 
		style="width: 100%; height: 200px; max-height: 200px; object-fit:fill;" 
		alt="profile-cover"/> <!-- class="img-responsive cover"  -->
		<div class="card-info">
			<img src="/displayGroupCoverFile?fileName={{memimg}}" alt="user" class="profile-photo-lg" />
			<div class="friend-info">
				<a href="#" class="pull-right text-green"><!-- My Friend --></a>
				<h5>
				<a href="${pageContext.request.contextPath}/timeline/timelineList/{{memno}}" class="profile-link">{{id}}</a>
				</h5>
				<p>{{job}}</p>
			</div>
		</div>
	</div>
</div>
{{/each}}

</script>

<button onclick="topFunction()" id="myBtn" title="Go to top">위로가기</button>

<script>
	//버튼
	var mybutton = document.getElementById("myBtn");

	// 유저스크롤이 문서 맨위에서 20px 멀어지면 버튼을 나타내기
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			mybutton.style.display = "block";
		} else {
			mybutton.style.display = "none";
		}
	}

	// 버튼 클릭시, 문서 맨 위로 스크롤! 
	function topFunction() {
		jQuery('html, body').animate({
			scrollTop : 0
		}, 500);
		return false;
	};
</script>



<script>
	function searchStart() {
		$(".listDiv").children().remove();
		var searchType = $(".listDiv").attr("data-searchType");
		//alert("2searchType="+searchType);
		var headerKeyword = $(".listDiv").attr("data-keyword");
		if (headerKeyword == "") {
			headerKeyword = "not match";
		}

		//alert("0");
		var pageNo = 0;
		//alert("00");
		$(window).scroll(function() {
			//if ($(window).scrollTop() == $(document).height() - $(window).height())  {
			//if ($(document).height() <= $(window).scrollTop()+ $(window).height() + 100) {
			var scrTop = $(window).scrollTop() + 50;
			var docHi = $(document).height() - $(window).height();
			if (scrTop >= docHi){
				pageNo++;
				//alert("000");
				if (searchType == "headerSearch") {
					getSearchUserList("/search/"+ headerKeyword + "/" + pageNo);
				}
			}
		});

	}

	$(document).ready(function(){
		searchStart();
		
	});

	function getSearchUserList(searchInfo) {
		$.getJSON(searchInfo, function(data) {
			printData(data, $(".listDiv"), $("#friend-card"));
		});
	}

	function printData(dataArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataArr);
		target.append(html);
	}

</script>


<%@ include file="../include/footer.jspf"%>