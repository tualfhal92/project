<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-122666585-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-122666585-1');
  
  function mypageTabreset(){
	localStorage['myptab'] = 0;
	localStorage['mypanel'] = 0;  
	location.href="/lar/user/mypage";
  }
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>LAR : ${param.pageTitle}</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom Fonts -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	<!-- Theme CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/agency.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lar.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megadrop.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/lar.min.js"></script>
	
	
	<style>
		.navbar-default .navbar-nav>.open>a,
		.navbar-default .navbar-nav>.open>a:hover {
			color: tomato;
			background-color: #4C0B5;
		}
	</style>
</head>
<body>
	<!-- Navigation -->
	<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-collapse-menu">
					<span class="sr-only">Toggle navigation</span> <i class="fa fa-bars"></i> Menu 
				</button>
				<a class="navbar-brand" href="/lar"><i>Learn And Run</i></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="nav-collapse-menu" style="overflow:hiddne; max-height:380px;">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="/lar/recommanded">추천 강좌</a>
					</li>
					<li class="dropdown mega-dropdown">

						<a class="dropdown-toggle" id="lecture-dropdown" data-toggle="dropdown" role="button" href = "/lar/lectureList?category=total">분류별 <span class="caret" style="display:none;"></span></a>
						<ul class="dropdown-menu mobile-dropdown" aria-labelledby="lecture-dropdown"">
							<li><a href="/lar/lectureList?category=ptotal">프로그래밍 언어</a></li>
							<li><a href="/lar/lectureList?category=mtotal">Android</a></li>
							<li><a href="/lar/lectureList?category=dtotal">Database</a></li>

						</ul>
						<div class="container-3 mega-dropdownmenu">
							<div class="col1" style="border-right:1px solid #222;">
								<ul>
									<li><h3><a href="/lar/lectureList?category=ptotal">프로그래밍</a></h3></li>
									<li><a href="/lar/lectureList?category=L01">Java</a></li>
									<li><a href="/lar/lectureList?category=L02">C++</a></li>
									<li><a href="/lar/lectureList?category=L03">JavaScript</a></li>
									<li><a href="/lar/lectureList?category=L04">php</a></li>
									<li><a href="/lar/lectureList?category=L05">Python</a></li>
								</ul>
							</div>
							<div class="col1" style="border-right:1px solid #222;">
								<ul>
									<li><h3><a href="/lar/lectureList?category=mtotal">Android</a></h3></li>
									<li><a href="/lar/lectureList?category=L06">Swift</a></li>
									<li><a href="/lar/lectureList?category=L07">FireBase</a></li>
									<li><a href="/lar/lectureList?category=L08">Android Studio</a></li>
									<li><a href="/lar/lectureList?category=L09">Raspberries</a></li>
									<li><a href="/lar/lectureList?category=L10">Hybrid</a></li>
								</ul>
							</div>
							<div class="col1">								
								<ul>
									<li><h3><a href="/lar/lectureList?category=dtotal">Database</a></h3></li>
									<li><a href="/lar/lectureList?category=L11">Oracle</a></li>
									<li><a href="/lar/lectureList?category=L12">Mysql</a></li>
									<li><a href="/lar/lectureList?category=L13">MSsql</a></li>
									<li><a href="/lar/lectureList?category=L14">Nosql</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<a class="lectureRegist" href="/lar/lecture/regist">강의등록 신청</a>
					</li>
					<li>
						<a href="/lar/commu/commuMain">커뮤니티</a>
					</li>
					<c:if test="${empty session_user}">
					<li>
						<a id="nav-signin" data-toggle="modal" data-target=".dynamicModal" onclick="getModal('signin');"><span class="glyphicon glyphicon-user"></span> Sign In</a>
					</li>
					</c:if>
					<c:if test="${!empty session_user}">
					<li class="dropdown">
						<a class="dropdown-toggle" role="button" id="user-btn" data-toggle="dropdown" style="color:#ffe484;" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-education"></span> ${session_user.user_nickname} <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="user-btn">
							<li><a class="mypage_btn" style="color:black;" onclick="mypageTabreset();"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
							<li><a href="/lar/user/cart" style="color:black;"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
							<li><a href="/lar/user/signout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> 접속해제</a></li>
						</ul>
					</li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<div class="wrapper">
		<header>
