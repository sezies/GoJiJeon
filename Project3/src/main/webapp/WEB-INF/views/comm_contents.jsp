<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">

<head>
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
				<li><a href="./community.do">커뮤니티</a></li>
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
					<nav class="header__menu">
						<ul>
							<%
								if (u_vo == null) {
							%>
							<li class="active">
							<li><a href="#" style="font-size: 20px;">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="#" onClick="alert('로그인 후 이용해주세요')"
										style="font-size: 16px;">고지서 업로드</a></li>
									<li><a href="#" onClick="alert('로그인 후 이용해주세요')"
										style="font-size: 16px;">고지서 관리</a></li>
									<li><a href="#" onClick="alert('로그인 후 이용해주세요')"
										style="font-size: 16px;">고지서 분석</a></li>
								</ul></li>
							<li><a href="#" onClick="alert('로그인 후 이용해주세요')"
								style="font-size: 20px;">커뮤니티</a></li>
							<li><a href="#" onClick="alert('로그인 후 이용해주세요')"
								style="font-size: 20px;">문의하기</a></li>
							<%
								} else {
							%>
							<li class="active">
							<li><a href="#" style="font-size: 20px;">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="./bill_upload.do" style="font-size: 16px;">고지서
											업로드</a></li>
									<li><a
										href="${cpath}/NoticeList.do?user_num=<%=u_vo.getUser_num()%>"
										style="font-size: 16px;">고지서 관리</a></li>
									<li><a href="./bill_graph.do" style="font-size: 16px;">고지서
											분석</a></li>
								</ul></li>
							<li><a href="./community.do" style="font-size: 20px;">커뮤니티</a></li>
							<li><a href="./contact.do" style="font-size: 20px;">문의하기</a></li>
							<%
								}
							%>
						</ul>
					</nav>
				</div>
				<div class="col-lg-2">
					<nav class="header__menu">
						<!--  로그인 배너 (찐) -->
						<%
							if (u_vo == null) {
						%>
						<a href="./login_main2.do"
							style="font-size: 12px; color: gray; font-weight: bold; letter-spacing: 2px;">로그인</a>
						&emsp;&emsp;&emsp; <a href="./join_main2.do"
							style="font-size: 12px; color: gray; font-weight: bold; letter-spacing: 2px;">회원가입</a>
						<%
							} else {
						%>
						<a href="${cpath}/UsersLogout.do"
							style="font-size: 12px; color: gray; font-weight: bold; letter-spacing: 2px;">로그아웃</a>
						&emsp; <a href="./mypage_main.do"
							style="font-size: 12px; color: gray; font-weight: bold; letter-spacing: 2px;">마이페이지</a>
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

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${cpath}/resources/img/bill/bill1.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>제 가스요금 좀 봐주세요...</h3>
						<p>다른 집에 비해 저희 집 가스요금이 많이 나오는 것 같아요... 분석 좀 해주세요!!!</p>
						<br>
						<div class="checkout__input">
							<button type="button" class="site-btn"
								onclick="location.href='community.do' ">목록으로</button>
						</div>
					</div>
				</div>
			</div>
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
			<div>
				<table border="2" style="width: 1000px;" bordercolor="#46AA46">
					<tr>
						<td width="500px">작성자
						<input type="text" id="reply_writer" name="reply_writer" style="width: 170px;" maxlength="10" placeholder="<%=u_vo.getUser_name()%>" readonly />
						비밀번호<input type="password" id="reply_password" name="reply_password" style="width: 170px;" maxlength="10" placeholder="비밀번호를 입력하세요" />
						<button id="reply_save" name="reply_save">댓글 등록</button>
						</td>
					</tr>
					<tr>
						<td><textarea id="reply_content" name="reply_content"
								rows="4" cols="50" placeholder="댓글을 입력하세요"
								style="width: 1000px; height: 50px;"></textarea></td>
					</tr>
				</table>
			</div>
		</div>
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