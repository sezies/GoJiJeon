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

<script>
	function check() {
		user_id = $("#user_id").val();

		$.ajax({
			url : '${cpath}/ID_Check.do?user_id=' + user_id,
			type : 'GET',

			success : function(data) {
				if (data == 0) {
					console.log("아이디 없음");
					alert("사용하실 수 있는 아이디입니다.");

				} else if (data == 1) {
					console.log("아이디 있음");
					alert("중복된 아이디가 존재합니다.");

				} else {
					alert("아이디를 입력해주세요.")
				}
			},
			error : function() {

			}
		});
	}

	function check2() {
		user_id = $("#user_id").val();

		$.ajax({
			url : '${cpath}/ID_Check.do?user_id=' + user_id,
			type : 'GET',

			success : function(data) {
				if (data == 0) {
					console.log("아이디 없음");

				} else if (data == 1) {
					console.log("아이디 있음");
					alert("중복된 아이디가 존재합니다.");
					location.href = "${cpath}/Join.do";

				} else {
					alert("아이디를 입력해주세요.")
				}
			},
			error : function() {

			}
		});
	}
</script>


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
					<nav class="header__menu"></nav>
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
						<h2>회원가입</h2>
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
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div class="checkout__form">
				<h4>개인정보 입력</h4>
				<form action="${cpath}/UsersJoin.do" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>아이디</p>
										<input class="input" type="text" name="user_id" id="user_id">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>비밀번호</p>
										<input class="input" type="password" name="user_pw">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>이름</p>
										<input class="input" type="text" name="user_name">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>주거래 은행</p>
										<input class="input" type="text" name="user_bank">
									</div>
								</div>
							</div>

							<div class="checkout__input">
								<c:if test="${msg==false}">
									<h4 style="color: #f00;">
										회원 정보를 모두 입력해주세요.
										</p>
								</c:if>
								<button id="duplicate_check" class="site-btn" type="button"
									onclick="check();">아이디 중복 확인</button>
								<button id="btns" type="submit" class="site-btn"
									onclick="check2();">작성 완료</button>
							</div>
						</div>
					</div>
				</form>
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