<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="../include/header.jspf" %> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
            	<h5><a href="${pageContext.request.contextPath}/timeline/timeline.do" class="text-white">${member.id}</a></h5>
            	<a href="#" class="text-white"><i class="ion ion-android-person-add"></i>${member.followers}명이 팔로잉중</a>
            	</div><!--profile card ends-->
	            <ul class="edit-menu">
					<li class="active">
						<div>
							<a href="/group/groupIndex">그룹 메인</a>
						</div>
					</li>
					<li>
						<div>
							<a href="" id="my-group">내 그룹</a>
						</div>
					</li>
					<li>
						<div>
							<a href="/group/groupRegister">그룹 생성</a>
						</div>
					</li>
				</ul>
				
<!-- 		          	<ul class="edit-menu">
		            	<li class="active"><a href="/group/groupIndex">그룹 메인</a></li>
		            	<li><a href="" id="my-group">내 그룹</a>
		            	<li><a href="/group/groupRegister">그룹 생성</a></li>
		            	<li><a href="" id="up-atag">위로가기</a></li>
		            </ul> -->
          	</div>
		  <input type="hidden" id="typeInput" value="${type}">
          
    			<div class="col-md-7">

            <!-- Post Create Box
            ================================================= -->
            <div class="create-post">
            	<div class="row">
					
             		<div class="col-md-7 col-sm-7">
                  		<div class="form-group">
                    <!-- <img src="http://placehold.it/300x300" alt="" class="profile-photo-md" />
                    <textarea name="texts" id="exampleTextarea" cols="30" rows="1" class="form-control" placeholder="Write what you wish"></textarea> -->
	                		<input type="text" name = "keyword" id="keywordInput" value="${keyword}"
	                		class="form-control" size="40" placeholder="관심있는 그룹의 분야를 검색해 보세요." style="margin-right:5%">
	                		<button id='searchBtn' style="min-width: max-content;">검색</button>
                  		</div>
                	</div>
            		<!-- <div class="col-md-5 col-sm-5">
                  <div class="tools">
                    <ul class="publishing-tools list-inline">
                      <li><a href="#"><i class="ion-compose"></i></a></li>
                      <li><a href="#"><i class="ion-images"></i></a></li>
                      <li><a href="#"><i class="ion-ios-videocam"></i></a></li>
                      <li><a href="#"><i class="ion-map"></i></a></li>
                    </ul>
                    <button class="btn btn-primary pull-right">Publish</button>
                  </div>
                </div> -->
            	</div>
            </div><!-- Post Create Box End -->

            <!-- Friend List
            ================================================= -->
<%--             <c:if test="${pageMaker.hasNoGroup()}">
            	<p>현재 생성된 그룹이 없습니다.</p>
            </c:if> --%>
            <div class="friend-list">
            	<div class="row">
	            	<div class="group-List">
	
	                </div>
                </div>
            </div>
						
            </div>
          </div>
          </div>
    	</div> 	
<!-- 	지우지마세요!				<input type="hidden" class="inputGroupNo" name="grno" value="{{grno}}"> -->
						<!-- {{#eqMyGroup memno}}
                        <p class="pull-right text-green">내 그룹</p>
						{{/eqMyGroup}} -->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
				<div class="col-md-6 col-sm-6">
                  <div class="friend-card">
                  	<img src="/displayGroupCoverFile?fileName={{fullname}}" style="width:-webkit-fill-available; height:130px; alt="profile-cover" class="img-responsive cover" />
                  	<div class="card-info">
                      <div class="friend-info">

                      	<h5><a href="confirmGroup?grno={{grno}}" class="profile-link">{{grname}}</a></h5>
                      	<p>분류  :  {{grci}}</p>
                      </div>
                    </div>
                  </div>
                </div>
	{{/each}}
</script>
   
   <!-- 헬퍼 지우지마세요!-->
<!-- <script>

Handlebars.registerHelper("eqMyGroup", function(memno, option) {
	console.log("eqMyGroup 실행됨!");
	var accum = '';
	if (memno == '${member.memno}') {
	   accum += option.fn();
	}
	return accum;
});
</script> -->

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
	var keyword = $("#keywordInput").val();
	var type = $("#typeInput").val();
	
	console.log("type"+type);
	console.log("firstKeyword??"+keyword);
	
	 const input = document.querySelector('#keywordInput');
	   input.addEventListener('keyup',function(e){
	       if (e.keyCode === 13) {
	    		keyword = $("#keywordInput").val();	
	    		self.location = "/group/groupIndex?keyword=" + keyword + "&type=" + type;
	     }  
	 });
	
	$("#my-group").on("click",
		function(event) {
		event.preventDefault();
		type = 'my';
		keyword = '';
		self.location = "/group/groupIndex?keyword=" + keyword + "&type=" + type;
	});

	$('#searchBtn').on("click",
		function(event) {
		keyword = $("#keywordInput").val();	
		self.location = "/group/groupIndex?keyword=" + keyword + "&type=" + type;
	});
	
	$(window).scroll(function() {
		var scrTop = $(window).scrollTop()+50;
		var docHi = ($(document).height() - $(window).height());
		if (scrTop >= docHi) {
			page++;
			if(type == "my"){
				$(".edit-menu li").first().removeClass("active");
				$(".edit-menu li:eq(1)").addClass("active");
				getPage("/group/groupMyIndex/" + page);
			} else {
				getPage("/group/groupIndex/" + page);
			}
		}
	});
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $(".group-List"), $('#template'));
			});
	}
	
	var printData = function(groupArr, target, templateObject) {
	
		var template = Handlebars.compile(templateObject.html());
	
		var html = template(groupArr);
		target.append(html);
	}
	

});
</script>
<%@ include file="../include/footer.jspf" %> 