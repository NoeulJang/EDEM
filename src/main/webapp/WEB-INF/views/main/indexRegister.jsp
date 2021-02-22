<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- Landing Page Contents
    ================================================= -->
	<div id="lp-register">
		<div class="container wrapper">
			<div class="row">
				<div class="col-sm-5">
					<div class="intro-texts">
						<h1 class="text-white">세상과 소통을 시작해보세요.</h1>
						<p>
							Every Day Every Moment는 여러분을 더욱 넓은 세상과 소통을 시작할수있게해줄것입니다. 저희와 함께
							새로운 대화를 시작할수있습니다.<br /> <br />지금 당장 시작하세요!
						</p>
						<%-- <button onclick="location.href='${pageContext.request.contextPath}/sns/view/contact/faq.jsp'" class="btn btn-primary">더 알아보기</button> --%>
					</div>
				</div>
				<div class="col-sm-6 col-sm-offset-1">
					<div class="reg-form-container">

						<!-- Register/Login Tabs-->
						<div class="reg-options">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#register" data-toggle="tab">회원가입</a></li>
								<!-- <li><a href="#login" data-toggle="tab">로그인</a></li> -->
							</ul>
							<!--Tabs End-->
						</div>

						<!--Registration Form Contents-->
						<div class="tab-content">
							<div class="tab-pane active" id="register">
								<h3>회원가입</h3>
								<p class="text-muted">회원 가입을 위해 아래 작성하세요</p>

								<!--Register Form-->
								<form action="/main/indexRegister" method="post"
									name="registration_form" id='registration_form'
									class="form-inline">
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>아이디</strong><label for="id" class="sr-only">아이디</label>
											<input id="id" class="form-control input-group-lg"
												type="text" name="id" title="id" placeholder="4~15자리의 영문과 숫자를 입력해주세요." />
										</div>
										<!-- 									<td align="center">
											<button id="idChk" type="button" onclick="check();">중복체크</button>
										</td>  -->
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>비밀번호</strong><label for="pw" class="sr-only">비밀번호</label>
											<input id="pw" class="form-control input-group-lg"
												type="password" name="pw" title="Enter password"
												placeholder="6~20자리의 문자, 숫자를 입력해주세요." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>비밀번호 확인</strong><label for="cpw" class="sr-only">비밀번호
												확인</label> <input id="cpw" class="form-control input-group-lg"
												type="password" name="cpw" title="Confirm password"
												placeholder="비밀번호 재 입력해주세요." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-6">
											<strong>이름</strong><label for="lastname" class="sr-only">이름</label>
											<input id="lastname" class="form-control input-group-lg"
												type="text" name="name" title="name"
												placeholder="이름을 입력해주세요." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>휴대폰 번호</strong> <label for="ph" class="sr-only">휴대폰
												번호</label> <input id="ph" class="form-control input-group-lg"
												type="text" name="ph" title="ph"
												placeholder="휴대폰 번호를 숫자만 입력해 주세요." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>이메일</strong><label for="email" class="sr-only">이메일</label>
											<input id="email" class="form-control input-group-lg"
												type="email" name="email" title="email"
												placeholder="이메일을 입력해주세요."  />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>주소</strong><label for="loc" class="sr-only">주소</label>
											<input id="loc" class="form-control input-group-lg"
												type="text" name="loc" title="loc" placeholder="주소를 입력해주세요." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<strong>직업/학교</strong><label for="job" class="sr-only">직업/학교</label>
											<input id="job" class="form-control input-group-lg"
												type="text" name="job" title="job"
												placeholder="직장/학교를 입력해주세요." />
										</div>
									</div>
									<div class="row">
										<p class="birth">
											<strong>생년월일</strong>
										</p>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="year" class="sr-only"></label> <select
												class="form-control" id="year" name="year">
												<option value="year">년도</option>
												<%
												for (int i = 1922; i <= 2021; i++) {
												%>
												<option value="<%=i%>"><%=i%></option>
												<%
												}
												%>
											</select>
										</div>
										<div class="form-group col-sm-3 col-xs-6">
											<label for="month" class="sr-only"></label> <select
												class="form-control" id="month" name="month">
												<option value="month">월</option>
												<%
												for (int i = 1; i <= 12; i++) {
												%>
												<option value="<%=i%>"><%=i%></option>
												<%
												}
												%>
											</select>
										</div>
										<div class="form-group col-sm-3 col-xs-6">
											<label for="day" class="sr-only"></label> <select
												class="form-control" id="day" name="day">
												<option value="day">일</option>
												<%
												for (int i = 1; i <= 31; i++) {
												%>
												<option value="<%=i%>"><%=i%></option>
												<%
												}
												%>
											</select>
										</div>
									</div>

									<div class="form-group gender">
										<label class="radio-inline"> <input type="radio"
											name="gender" value="남성" checked>남성
										</label> <label class="radio-inline"> <input type="radio"
											name="gender" value="여성">여성
										</label>
									</div>

									<p>
										  <a href = "/" onclick="return confirm('로그인 화면으로 이동합니다.')">이미 계정이 있습니까?</a>
									</p>
									<button type="submit" class="btn btn-primary">가입하기</button>
								</form>
								<!--Register Now Form Ends-->

							</div>
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
	</div>
</body>
<!-- <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() { //아이디 체크
		//아이디 조건 체크
		$('#id').blur(function() {
			
			var id = $('#id').val();
			var idExp = /^[A-za-z0-9]{4,15}$/;
			
			if(id.match(idExp) == null && id != ""){
				alert('ID는 4~15자리로 영문과 숫자만 사용 가능합니다.');
				$('#id').val("");
				$('#id').focus();
				return false;
			}
			
			//중복체크
			$.ajax({
				type : "POST",
				url : '/main/idChk',
				data : {
					"id" : $('#id').val()
				},
				success : function(data) { //data : checkSignup에서 넘겨준 결과값
					if ($.trim(data) == 0) {
						if ($('#id').val() != '') {
							alert("사용가능한 아이디입니다.");
						}
					} else {
						if ($('#id').val() != '') {
							alert("중복된 아이디입니다.");
							$('#id').val('');
							$('#id').focus();
						}
					}
				}
			})
		})

	});

	//비밀번호 조건 체크
	$('#pw').blur(function() {
		var pw = $('#pw').val();
		// 문자 , 숫자 포함 형태의 6~20자리 이내의 암호 정규식
		var pwExp =  /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		
		if(pw.match(pwExp) == null && pw != ""){
			alert('비밀번호는 6~20자리의 영문과 숫자를 포함하여야 합니다.');
			$('#pw').val("");
			$('#pw').focus();
			return false;
		}
	});
	
	//비밀번호 확인 체크
	$(function() {
		$('#cpw').blur(function() {

			if ($('#pw').val() != $('#cpw').val()) {
				if ($('#cpw').val() != '') {
					alert("비밀번호가 일치하지 않습니다.");
					$('#cpw').val('');
					$('#cpw').focus();
				}
			}
		})
	});
	
	//이름 체크(2자 이상이어야한다.)
	$('#lastname').blur(function(){
		if ($("#lastname").val().length < 2){
			alert("이름은 2자 이상 입력해 주세요.")
			$('#lastname').val('');
			$('#lastname').focus();
		}
	});
	
	
	//휴대폰번호 입력시 번호만 입력
	$('#ph').blur(function(){
		var ph = $('#ph').val();
		var phExp = /^\d{3}\d{3,4}\d{4}$/;
		if(ph.match(phExp) == null && ph != ""){
			$('#ph').val('');
			$('#ph').focus();
			alert("숫자만 입력해 주세요.");
		}
	});
	
	
	//가입하기 버튼 클릭시 필수입력란 체크
	$("#registration_form").submit(function(){
		
		if($.trim($("#id").val()) == ""){
			alert("아이디를 입력해 주세요");
			return false;
		}
		
		if($.trim($("#pw").val()) == ""){
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		
		if($.trim($("#cpw").val()) == ""){
			alert("비밀번호 확인을 입력해 주세요");
			return false;
		}
		if($.trim($("#lastname").val()) == ""){
			alert("이름을 입력해 주세요");
			return false;
		}
		if($.trim($("#ph").val()) == ""){
			alert("휴대폰번호를 입력해 주세요");
			return false;
		}
		if($.trim($("#email").val()) == ""){
			alert("이메일을 입력해 주세요");
			return false;
		}
		if($.trim($("#loc").val()) == ""){
			alert("주소를 입력해 주세요");
			return false;
		}
		if($.trim($("#job").val()) == ""){
			alert("직장/학교를 입력해 주세요");
			return false;
		}
		if($.trim($("#year").val()) == "year"){
			alert("생년월일을 설정해주세요");
			return false;
		}
		if($.trim($("#month").val()) == "month"){
			alert("생년월일을 설정해주세요");
			return false;
		}
		if($.trim($("#day").val()) == "day"){
			alert("생년월일을 설정해주세요");
			return false;
		}else{
			alert("회원가입이 되었습니다!");
		}
		
	});

</script>


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
<script
	src="${pageContext.request.contextPath}/resources/sns/HTML/js/script.js"></script>