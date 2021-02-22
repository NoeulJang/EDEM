<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<title>Team2프로젝트 | 소셜네트워크 사이트</title>

<!-- Stylesheets
    ================================================= -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sns/HTML/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sns/HTML/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sns/HTML/css/ionicons.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/sns/HTML/css/font-awesome.min.css" />

<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/sns/HTML/images/fav.png" />
</head>
<body>
	<!-- Top Banner
    ================================================= -->
	<section id="banner">
		<div class="container">

			<!-- Sign Up Form
        ================================================= -->
			<div class="sign-up-form">
				<a href="#" class="logo"> 
				<img src="${pageContext.request.contextPath}/resources/sns/HTML/images/logo.png" alt="Friend Finder" /></a>
				<h2 class="text-white">로그인</h2>
				<div class="line-divider"></div>
				<div class="form-wrapper">
					<p class="signup-text"></p>
					<form action="/main/loginPost" method="post" id="login">
						<fieldset class="form-group">
							<input type="text" class="form-control" id="example-name"
								name="id" placeholder="아이디">
						</fieldset>
						<fieldset class="form-group">
							<input type="password" class="form-control" id="example-password"
								name="pw" placeholder="암호">
						</fieldset>
						<c:choose>
							<c:when test="${errors.id}">아이디를 입력하세요.</c:when>
							<c:when test="${errors.pw}">암호를 입력하세요.</c:when>
							<c:when test="${errors.idOrPwNotMatch}">아이디와 암호가 일치하지 않습니다.</c:when>
						</c:choose>
						<button type="submit" class="btn-secondary">로그인</button>
					</form>
				</div>
				<a href="/main/indexSearchingPwd">비밀번호 찾기</a><br> <a
					href="/main/indexRegister">회원가입 하기</a> <img class="form-shadow"
					src="${pageContext.request.contextPath}/resources/sns/HTML/images/bottom-shadow.png"
					alt="" />
			</div>
			<!-- Sign Up Form End -->

		</div>
	</section>
	<div class="copyright">
		<p>Thunder Team 2020. All rights reserved</p>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/sns/HTML/js/jquery-3.1.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/sns/HTML/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/sns/HTML/js/script.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/sns/HTML/js/jquery.appear.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/sns/HTML/js/jquery.incremental-counter.js"></script>

</body>
</html>