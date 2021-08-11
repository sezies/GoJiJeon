<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">

<head>

<style type="text/css">
body {
  font-family:'NanumSquare_0';
}
</style>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>고지서 관리 서비스</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${cpath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${cpath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<%
		UsersVO u_vo = null;
	if (session.getAttribute("login") != null) {
		u_vo = (UsersVO) session.getAttribute("login");
		System.out.println(u_vo + "||||이거는 맨 위에거");
	}
	%>


	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="./index_main.do"><img
				src="${cpath}/resources/img/logo1.png" alt=""></a>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__auth">
				<%
					if (u_vo == null) {
				%>
				<a href="./login_main2.do"><i class="fa fa-user"></i>로그인</a> <a
					href="./join_main2.do"><i class="fa fa-user"></i>회원가입</a>
				<%
					} else {
				%>
				<a href="${cpath}/UsersLogout.do"><i class="fa fa-user"></i>로그아웃</a>
				<a href="./mypage_main.do"><i class="fa fa-user"></i>마이페이지</a>
				<%
					}
				%>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<%
					if (u_vo == null) {
				%>
				<li><a href="#">고지서 서랍</a>
					<ul class="header__menu__dropdown">
						<li><a href="#" onClick="alert('로그인 후 이용해주세요')">고지서 업로드</a></li>
						<li><a href="#" onClick="alert('로그인 후 이용해주세요')">고지서 관리</a></li>
						<li><a href="#" onClick="alert('로그인 후 이용해주세요')">고지서 분석</a></li>
					</ul></li>
				<li><a href="#" onClick="alert('로그인 후 이용해주세요')">커뮤니티</a></li>
				<li><a href="#" onClick="alert('로그인 후 이용해주세요')">문의하기</a></li>
				<%
					} else {
				%>
				<li><a href="#">고지서 서랍</a>
					<ul class="header__menu__dropdown">
						<li><a href="./bill_upload.do">고지서 업로드</a></li>
						<li><a
							href="${cpath}/NoticeList.do?user_num=<%=u_vo.getUser_num()%>">고지서
								관리</a></li>
						<li><a href="./bill_graph.do">고지서 분석</a></li>
					</ul></li>
				<li><a href="${cpath}/communityList.do">커뮤니티</a></li>
				<li><a href="./contact.do">문의하기</a></li>
				<%
					}
				%>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social"></div>
		<div class="humberger__menu__contact">
			<ul>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index_main.do"><img
							src="${cpath}/resources/img/logo1.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu" style="padding-top:45px;">
						<ul>
							<%
								if (u_vo == null) {
							%>
							<li class="active">
							<li><a href="#" style="font-size: 24px;">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="${cpath}/login_main2.do" onClick="alert('로그인 후 이용해주세요')"
										style="font-size: 20px; font-family: NanumSquare_0; letter-spacing: 1px;">고지서 업로드</a></li>
									<li><a href="${cpath}/login_main2.do" onClick="alert('로그인 후 이용해주세요')"
										style="font-size: 20px; font-family: NanumSquare_0; letter-spacing: 1px;"">고지서 관리</a></li>
									<li><a href="${cpath}/login_main2.do" onClick="alert('로그인 후 이용해주세요')"
										style="font-size: 20px; font-family: NanumSquare_0; letter-spacing: 1px;"">고지서 분석</a></li>
								</ul></li>
							<li><a href="${cpath}/login_main2.do" onClick="alert('로그인 후 이용해주세요')"
								style="font-size: 24px; font-family: NanumSquare_0; letter-spacing: 1px;"">커뮤니티</a></li>
							<li><a href="#" onClick="alert('로그인 후 이용해주세요')"
								style="font-size: 24px; font-family: NanumSquare_0; letter-spacing: 1px;"">문의하기</a></li>
							<%
								} else {
							%>
							<li class="active">
							<li><a href="#" style="font-size: 24px; font-family: NanumSquare_0; letter-spacing: 1px;"">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="./bill_upload.do" style="font-size: 20px; font-family: NanumSquare_0; letter-spacing: 1px;"">고지서
											업로드</a></li>
									<li><a
										href="${cpath}/NoticeList.do?user_num=<%=u_vo.getUser_num()%>"
										style="font-size: 20px; font-family: NanumSquare_0; letter-spacing: 1px;"">고지서 관리</a></li>
									<li><a href="./bill_graph.do" style="font-size: 20px; font-family: NanumSquare_0; letter-spacing: 1px;"">고지서
											분석</a></li>
								</ul></li>
							<li><a href="${cpath}/communityList.do"
								style="font-size: 24px; font-family: NanumSquare_0; letter-spacing: 1px;"">커뮤니티</a></li>
							<li><a href="./contact.do" style="font-size: 24px; font-family: NanumSquare_0; letter-spacing: 1px;"">문의하기</a></li>
							<%
								}
							%>
						</ul>
					</nav>
				</div>
				<div class="col-lg-2">
					<nav class="header__menu" style="padding-top:35px;">
						<!--  로그인 배너 (찐) -->
						<%
							if (u_vo == null) {
						%>
						<a href="./login_main2.do"
							style="font-size: 20px; color: gray; font-weight: bold; font-family: NanumSquare_0; letter-spacing: 1px;"></a>
						&emsp;&emsp;&emsp; <a href="./join_main2.do"
							style="font-size: 20px; color: gray; font-weight: bold; font-family: NanumSquare_0; letter-spacing: 1px;"></a>
						<%
							} else {
						%>
						<a href="${cpath}/UsersLogout.do"
							style="font-size: 20px; color: gray; font-weight: bold; font-family: NanumSquare_0; letter-spacing: 1px;">로그아웃</a>
						&emsp;
						<br> 
						<a href="./mypage_main.do"
							style="font-size: 20px; color: gray; font-weight: bold; font-family: NanumSquare_0; letter-spacing: 1px;">마이페이지</a>

						<%
							}
						%>
					</nav>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${cpath}/resources/img/menu_banner.png" style="width: 1140px; margin:auto;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>마이페이지</h2>
						<div class="breadcrumb__option">
							<!-- <span>Join</span>  -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			
			<br>
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div class="checkout__form">
				<h4>개인정보 수정</h4>
				<!--  개인정보 수정 -->
				<form action="${cpath}/UsersUpdate.do" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>아이디</p>
										<input type="text" name="user_id"
											value="<%=u_vo.getUser_id()%>" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>비밀번호</p>
										<input type="password" name="user_pw"
											value="<%=u_vo.getUser_pw()%>">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>이름</p>
										<input type="text" name="user_name"
											value="<%=u_vo.getUser_name()%>">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>주거래 은행</p>
										<input type="text" name="user_bank"
											value=<%=u_vo.getUser_bank()%>>
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<button type="submit" class="site-btn">정보 수정하기</button>
							</div>
						</div>
					</div>
				</form>
				<form action="${cpath}/delete.do" method="post">
				<button style="margin: 0 auto; width: 150px;" class="site-btn">회원
					탈퇴하기</button>
			</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Js Plugins -->
	<script src="${cpath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath}/resources/js/bootstrap.min.js"></script>
	<script src="${cpath}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${cpath}/resources/js/jquery-ui.min.js"></script>
	<script src="${cpath}/resources/js/jquery.slicknav.js"></script>
	<script src="${cpath}/resources/js/mixitup.min.js"></script>
	<script src="${cpath}/resources/js/owl.carousel.min.js"></script>
	<script src="${cpath}/resources/js/main.js"></script>

</body>

</html>
