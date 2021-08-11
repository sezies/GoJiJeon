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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${cpath}/resources/js/reply.js"></script>
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




<style>
#img {
	width: 100%;
	height: 350px;
	object-fit: cover;
}

textarea {
	width: 100%;
}

.reply_reply {
	border: 2px solid #FF50CF;
}

.reply_modify {
	border: 2px solid #FFBB00;
}
</style>

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
		data-setbg="${cpath}/resources/img/menu_banner.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>커뮤니티</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<!-- Breadcrumb Section End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div class="blog__details__text">
						<h3>${vo.board_title}</h3>
						<h4>${vo.user_id}</h4>${vo.board_day}
						<img id="img" src="${cpath}/resources/img/${vo.board_img}" alt="">
						<p>${vo.board_content}</p>
						<button style="height: 45px; font-size: 14px;" type="button"
							class="site-btn" onclick="location.href='communityList.do'">목록으로</button>
						<button style="height: 45px; font-size: 14px;" type="button"
							class="site-btn" onclick="location.href='#'">수정하기</button>
						<button style="height: 45px; font-size: 14px;" type="button"
							class="site-btn" onclick="location.href='#'">삭제하기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

	<!-- Product Details Section Begin -->
	<br>
	<section class="product-details spad">
		<div class="container">
			<div class="blog__details__content">
				<div class="row">
					<div class="col-lg-6">
						<div class="blog__details__author">
							<div class="blog__details__author__text">
								<h6>박정주</h6>
								<ul>
									<li>제가 볼 때는 적당히 나오는 것 같은데요... 걱정 안 하셔도 될 것 같아요!</li>
								</ul>
								<br>
								<h6>나연호</h6>
								<ul>
									<li>저랑 동일 면적인데 저보다 훨씬 적게 나오시는데요? 잘 내고 계십니다!</li>
								</ul>
								<br>
								<h6>박세욱</h6>
								<ul>
									<li>저는 평소에 금액을 크게 신경 안 써요~ 어차피 뭐 매달 비슷하더라고요!</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<!-- Contact Form Begin -->
			<div class="contact-form spad">
				<div class="container">
					<form action="#">
						<div class="row">
							<div class="col-lg-2 col-md-2">
								<input style="width: 180px;" type="text"
									value="<%=u_vo.getUser_name()%>" readonly placeholder="작성자">
							</div>
							<div class="col-lg-2 col-md-2">
								<input style="width: 180px;" type="password" placeholder="비밀번호">
							</div>
							<div class="col-lg-5 text-center">
								<textarea style="height: 50px;" placeholder="댓글을 입력해주세요"></textarea>
							</div>
							<div class="col-lg-3 col-md-3">
								<button style="height: 45px; font-size: 14px;" type="submit"
									class="site-btn">댓글 달기</button>
							</div>

						</div>
					</form>
				</div>
			</div>
			<!-- Contact Form End -->
		</div>
	</section>
	<!-- Product Details Section End -->

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