<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="This is social network html5 template available in themeforest......" />
<meta name="keywords"
	content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
<meta name="robots" content="index, follow" />
<title>team2프로젝트 | 소셜네트워크 사이트</title>

<!-- Stylesheets
    ================================================= -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/sns/HTML/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/sns/HTML/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/sns/HTML/css/ionicons.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/sns/HTML/css/font-awesome.min.css" />

<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/sns/HTML/images/fav.png" />
</head>
<body>

	<!-- Header
    ================================================= -->
	<header id="header">
		<nav class="navbar navbar-default navbar-fixed-top menu">
			<div class="container">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/sns/view/main/index-register.jsp"><img
						src="${pageContext.request.contextPath}/sns/documentation/images/logo.png"
						alt="logo" /></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right main-menu">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Home <span><img
									src="${pageContext.request.contextPath}/sns/HTML/images/down-arrow.png"
									alt="" /></span></a>
							<ul class="dropdown-menu newsfeed-home">
								<li><a
									href="${pageContext.request.contextPath}/sns/view/main/index.jsp">login
										Page 1</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/main/index-register.jsp">login
										Page 2</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">뉴스피드 <span><img
									src="${pageContext.request.contextPath}/sns/HTML/images/down-arrow.png"
									alt="" /></span></a>
							<ul class="dropdown-menu newsfeed-home">
								<li><a
									href="${pageContext.request.contextPath}/sns/view/newsfeed/newsfeed.jsp">뉴스피드</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/newsfeed/newsfeed-people-nearby.jsp">가까운
										친구</a></li>
								<!--                   <li><a href="newsfeed-friends.jsp">My friends</a></li> -->
								<li><a
									href="${pageContext.request.contextPath}/sns/view/newsfeed/newsfeed-messages.jsp">대화하기</a></li>
								<!--                   <li><a href="newsfeed-images.jsp">Images</a></li>
                  <li><a href="newsfeed-videos.jsp">Videos</a></li> -->
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">타임라인 <span><img
									src="${pageContext.request.contextPath}/sns/HTML/images/down-arrow.png"
									alt="" /></span></a>
							<ul class="dropdown-menu login">
								<li><a
									href="${pageContext.request.contextPath}/sns/view/timeline/timeline.jsp">타임라인</a></li>
								<!-- <li><a href="timeline-about.jsp">Timeline About</a></li> 타임라인에 대한 설명-->
								<li><a
									href="${pageContext.request.contextPath}/sns/view/timeline/timeline-album.jsp">앨범</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/timeline/timeline-friends.jsp">친구</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/editProfile/edit-profile-basic.jsp">개인정보</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/editProfile/edit-profile-work-edu.jsp">직장정보</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/editProfile/edit-profile-interests.jsp">내
										관심사</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/editProfile/edit-profile-settings.jsp">계정설정</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/editProfile/edit-profile-password.jsp">비밀번호
										변경</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"
							class="dropdown-toggle pages" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">고객센터
								<span><img
									src="${pageContext.request.contextPath}/sns/HTML/images/down-arrow.png"
									alt="" /></span>
						</a>
							<ul class="dropdown-menu page-list">
								<!--                   <li><a href="index.jsp">Landing Page</a></li>
                  <li><a href="index-register.jsp">Landing Page 2</a></li>
                  <li><a href="newsfeed.jsp">뉴스피드</a></li>
                  <li><a href="newsfeed-people-nearby.jsp">가까운 친구</a></li>
                  <li><a href="newsfeed-friends.jsp">My friends</a></li>
                  <li><a href="newsfeed-messages.jsp">대화하기</a></li>
                  <li><a href="newsfeed-images.jsp">Images</a></li>
                  <li><a href="newsfeed-videos.jsp">Videos</a></li>
                  <li><a href="timeline.jsp">타임라인</a></li>
                  <li><a href="timeline-about.jsp">Timeline About</a></li>
                  <li><a href="timeline-album.jsp">Timeline Album</a></li>
                  <li><a href="timeline-friends.jsp">Timeline Friends</a></li>
                  <li><a href="edit-profile-basic.jsp">Edit Profile</a></li> -->
								<li><a
									href="${pageContext.request.contextPath}/sns/view/contact/faq.jsp">문의하기</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/contact/faq.jsp">F
										A Q</a></li>
								<li><a
									href="${pageContext.request.contextPath}/sns/view/error/404.jsp">404
										Not Found</a></li>
							</ul></li>
						<!--               <li class="dropdown"><a href="contact.jsp">Contact</a></li> -->
					</ul>
					<form class="navbar-form navbar-right hidden-sm">
						<div class="form-group">
							<i class="icon ion-android-search"></i> <input type="text"
								class="form-control"
								placeholder="친구나 게시물 검색">
						</div>
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</header>
	<!--Header End-->


	<!-- Landing Page Contents
    ================================================= -->
	<div id="lp-register">
		<div class="container wrapper">
			<div class="row">
				<div class="col-sm-5">
					<div class="intro-texts">
						<h1 class="text-white">멋진 친구 만들기</h1>
						<p>
							Friend Finder는 사람들을 연결하는 데 사용할 수있는 소셜 네트워크입니다. 이 템플릿은 랜딩 페이지, 뉴스
							피드, 이미지 / 비디오 피드, 채팅 상자, 타임 라인 등을 제공합니다.<br /> <br />당신은 왜 기다리고
							있습니까? 지금 회원가입하세요.
						</p>
						<button onclick="location.href='${pageContext.request.contextPath}/sns/view/contact/faq.jsp'" class="btn btn-primary">더 알아보기</button>
					</div>
				</div>
				<div class="col-sm-6 col-sm-offset-1">
					<div class="reg-form-container">

						<!-- Register/Login Tabs-->
						<div class="reg-options">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#register" data-toggle="tab">비밀번호찾기</a></li>
								<li><a href="#login" data-toggle="tab">아이디 찾기</a></li>
							</ul>
							<!--Tabs End-->
						</div>

	<!--Registration Form Contents-->
						<div class="tab-content">
							<div class="tab-pane active" id="register">
								<h3>비밀번호 찾기</h3>
								<p class="text-muted">이메일인증으로 비밀번호 찾기</p>

								<!--Register Form-->
								<form name="registration_form" id='registration_form'
									class="form-inline">
									<div class="row">
										<div class="form-group col-xs-6">
											<label for="lastname" class="sr-only">이름</label> <input
												id="lastname" class="form-control input-group-lg"
												type="text" name="lastname" title="Enter last name"
												placeholder="name" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label for="email" class="sr-only">아이디</label> <input
												id="email" class="form-control input-group-lg" type="text"
												name="Email" title="Enter Email" placeholder="id" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label for="" class="sr-only">이메일</label> <input
												id="" class="form-control input-group-lg"
												type="" name="" title="Enter password"
												placeholder="e-mail" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label for="" class="sr-only">인증번호</label> <input
												id="" class="form-control input-group-lg"
												type="" name="" title="Enter password"
												placeholder="" />
										</div>
									</div>
								</form>
								<!--Register Now Form Ends-->
								<p>
									<a href="#">이메일을 잊어버렸습니까?</a>
								</p>
								<button onclick="location.href='index-register.jsp' "   class="btn btn-primary">인증하기</button>
							</div>
							<!--Registration Form Contents Ends-->

							<!--Login-->
							<div class="tab-pane" id="login">
								<h3>아이디 찾기</h3>
								<p class="text-muted">이메일인증으로 아이디찾기</p>

								<!--Login Form-->
								<form name="Login_form" id='Login_form'>
									<div class="row">
										<div class="form-group col-xs-12">
											<label for="" class="sr-only">이름</label> <input
												id="" class="form-control input-group-lg"
												type="text" name="" title="Enter Email"
												placeholder="이름" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label for="" class="sr-only">이메일</label> <input
												id="my-password" class="form-control input-group-lg"
												type="" name="" title="Enter password"
												placeholder="e-mail" />
										</div>
									</div>
								</form>
								<!--Login Form Ends-->
								<p>
									<a href="#">이메일을 잊어버렸습니까?</a>
								</p>
								<button class="btn btn-primary">인증하기</button>
							</div>
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
	</div>

	<!--preloader-->
	<div id="spinner-wrapper">
		<div class="spinner"></div>
	</div>

	<!-- Scripts
    ================================================= -->
	<script
		src="${pageContext.request.contextPath}/sns/HTML/js/jquery-3.1.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/sns/HTML/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/sns/HTML/js/jquery.appear.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/sns/HTML/js/jquery.incremental-counter.js"></script>
	<script src="${pageContext.request.contextPath}/sns/HTML/js/script.js"></script>