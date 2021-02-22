<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="This is social network html5 template available in themeforest......" />
		<meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
		<meta name="robots" content="index, follow" />
		<title>team2프로젝트 | 소셜네트워크 사이트</title>

    <!-- Stylesheets
    ================================================= -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sns/HTML/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sns/HTML/css/style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sns/HTML/css/ionicons.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sns/HTML/css/font-awesome.min.css" />
    
    <!--Google Font-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i" rel="stylesheet">
    
    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/sns/HTML/images/fav.png"/>
	</head>
  <body>
<!-- Landing Page Contents
    ================================================= -->
<div id="lp-register">
	<div class="container wrapper">
		<div class="row">
			<div class="col-sm-5">
				<div class="intro-texts">
					<h1 class="text-white">세상과 소통을 시작해보세요.</h1>
					<p>
						Every Day Every Moment는 여러분을 더욱 넓은 세상과 소통을 시작할수있게해줄것입니다.
						저희와 함께 새로운 대화를 시작할수있습니다.<br /><br />지금 당장 시작하세요!
					</p>

				</div>
			</div>
			<div class="col-sm-6 col-sm-offset-1">
				<div class="reg-form-container">

					<!-- Register/Login Tabs-->
					<div class="reg-options">
						<ul class="nav nav-tabs">

							<li class="active"><a href="#register" data-toggle="tab">비밀번호찾기</a></li>
						</ul>
						<!--Tabs End-->
					</div>

					<!--Registration Form Contents-->
					<div class="tab-content">
						</div>

						<div class="tab-pane  active" id="register">
							<h3>비밀번호 찾기</h3>
							<p class="text-muted">이메일인증으로 비밀번호 찾기</p>

							<!--Register Form-->
							<form action="/main/indexSearchingPwd" method="post"
								name="registration_form" id='registration_form'
								class="form-inline">
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="id" class="sr-only">아이디</label> <input
											id="id" class="form-control input-group-lg" type="text"
											name="id" title="Enter id" placeholder="아이디" />
									</div>
								</div>
								<div class="row">
									<div class="form-group col-xs-12">
										<label for="email" class="sr-only">이메일</label> <input 
										id="email" class="form-control input-group-lg" type="email" 
										name="email" title="Enter email" placeholder="회원가입시 입력한 이메일" />
									</div>
								<c:if test="${errors.equals}">아이디나 이메일이 일치하지 않습니다.</c:if>
								</div>
								
								<button type="submit" class="btn btn-primary">인증번호 받기</button>
							</form>
						</div>
						<!--Register Now Form Ends-->
		<script>
             $("#registration_form").submit( function(e){
                if (($.trim($("#id").val()) == "")) {
                   alert("아이디를 입력해주세요");
                   return false;
                }
                else if (($.trim($("#email").val()) == "")) {
                    alert("이메일을 입력해주세요");
                    return false;
                 }
             });
       
       </script>
						<!--Registration Form Contents Ends-->
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-6">

				<!--Social Icons-->
				<ul class="list-inline social-icons">
					<li><a href="#"><i class="icon ion-social-facebook"></i></a></li>
					<li><a href="#"><i class="icon ion-social-twitter"></i></a></li>
					<li><a href="#"><i class="icon ion-social-googleplus"></i></a></li>
					<li><a href="#"><i class="icon ion-social-pinterest"></i></a></li>
					<li><a href="#"><i class="icon ion-social-linkedin"></i></a></li>
				</ul>
			</div>
		</div>
	</div>

<!--preloader-->
<div id="spinner-wrapper">
	<div class="spinner"></div>
</div>

<!-- Scripts
    ================================================= -->
<script
	src="${pageContext.request.contextPath}/resources/sns/HTML/js/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/sns/HTML/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/sns/HTML/js/jquery.appear.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/sns/HTML/js/jquery.incremental-counter.js"></script>
<script src="${pageContext.request.contextPath}/resources/sns/HTML/js/script.js"></script>