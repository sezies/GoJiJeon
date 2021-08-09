<%@page import="java.util.ArrayList"%>
<%@page import="kr.user.mapper.NoticeVO"%>
<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">
<head>

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
</head>

<body>
	<%
		UsersVO u_vo = null;
	if (session.getAttribute("login") != null) {
		u_vo = (UsersVO) session.getAttribute("login");
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
					<nav class="header__menu">
						<ul>
							<%
								if (u_vo == null) {
							%>
							<li class="active">
							<li><a href="#" style="font-size:20px;">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="#" onClick="alert('로그인 후 이용해주세요')" style="font-size:16px;">고지서 업로드</a></li>
									<li><a href="#" onClick="alert('로그인 후 이용해주세요')" style="font-size:16px;">고지서 관리</a></li>
									<li><a href="#" onClick="alert('로그인 후 이용해주세요')" style="font-size:16px;">고지서 분석</a></li>
								</ul></li>
							<li><a href="#" onClick="alert('로그인 후 이용해주세요')" style="font-size:20px;">커뮤니티</a></li>
							<li><a href="#" onClick="alert('로그인 후 이용해주세요')" style="font-size:20px;">문의하기</a></li>
							<%
								} else {
							%>
							<li class="active">
							<li><a href="#" style="font-size:20px;">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="./bill_upload.do" style="font-size:16px;">고지서 업로드</a></li>
									<li><a href="${cpath}/NoticeList.do?user_num=<%=u_vo.getUser_num()%>" style="font-size:16px;">고지서 관리</a></li>
									<li><a href="./bill_graph.do" style="font-size:16px;">고지서 분석</a></li>
								</ul></li>
							<li><a href="${cpath}/communityList.do" style="font-size:20px;">커뮤니티</a></li>
							<li><a href="./contact.do" style="font-size:20px;">문의하기</a></li>
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
							style="font-size: 12px; color: gray; font-weight: bold; letter-spacing: 2px;"></a>
						&emsp;&emsp;&emsp; <a href="./join_main2.do"
							style="font-size: 12px; color: gray; font-weight: bold; letter-spacing: 2px;"></a>
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
				<!--<div class="col-lg-3"> 
                       <div class="header__cart">
                         <ul>
                         <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>-->
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->


	<!-- Hero Section Begin -->

	<section class="hero">
		<div class="container">
			<div class="row"></div>
			<!--  <div class="hero__search__form">
				<form action="index_search.jsp" method="get">
					<select name="search1"
						style="width: 300px; height: 40px; text-align-last: center; color: #323232;">
						<option value="항목 선택">항목 선택</option>
						<option value="제목">제목</option>
						<option value="관리비용">관리비용</option>
					</select> <input type="text" placeholder="내 고지서를 찾아보세요" name="search2"
						style="width: 200px; height: 40px; text-align-last: center;">
					<button type="submit" class="site-btn">찾아보기</button>
				</form>
			</div>-->
			<br>
	<%
		if (u_vo == null) {
	%>				
			<div class="hero__item set-bg"
				data-setbg="${cpath}/resources/img/hero/logout_banner.png">
				<div class="hero__text">
					<a style="font-size: 20px; color: black;">사이트</a>
					<a style="font-size: 20px; color: midnight;">접속을 환영합니다!</a><br>
					<h2>고지서 관리가 필요하시다면?</h2>
					<p>로그인 혹은 회원가입 후 이용해주세요</p>
					<a href="./login_main2.do" class="primary-btn">로그인</a>
					<a href="./join_main2.do" class="primary-btn">회원가입</a>
	<%
		} else {
	%>		<div class="hero__item set-bg"
				data-setbg="${cpath}/resources/img/hero/login_banner.png">
				<div class="hero__text">
					<a style="font-size: 28px; color: black; font-weight: bold;"><%=u_vo.getUser_name()%></a>
					<a style="font-size: 20px; color: midnight;">님 접속을 환영합니다!</a><br>
					<h2>고지서 관리를 시작하시려면?</h2>
					<p>고지서를 업로드 해서 목록에 넣어주세요</p>
					<a href="./bill_upload.do" class="primary-btn">업로드 하기</a>
	<%
		}
	%>
				</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<br>
	<!-- Categories Section Begin -->
	<%
		if (u_vo != null) {
	%>
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<!--  반복문을 통해 리스트에 있는 값  불러오기 -->
					<c:forEach var="n_vo" items="${n_list}">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="${cpath}/resources/img/${n_vo.img}">
								<h5>
									<a href="#">${n_vo.notice_title}</a>
								</h5>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->
	<%
		} else {
	%>
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${cpath}/resources/img/banner/banner_left.png"
							alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${cpath}/resources/img/banner/banner_right.png"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>

	<%-- <div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${cpath}/resources/img/categories/cat-1.jpg">
							<h5>
								<a href="#">스인재아파트 2021년 1월 관리비</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${cpath}/resources/img/categories/cat-2.jpg">
							<h5>
								<a href="#">스인재아파트 2021년 2월 관리비</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${cpath}/resources/img/categories/cat-3.jpg">
							<h5>
								<a href="#">스인재아파트 2021년 3월 관리비</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${cpath}/resources/img/categories/cat-4.jpg">
							<h5>
								<a href="#">주정차위반 과태료</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${cpath}/resources/img/categories/cat-5.jpg">
							<h5>
								<a href="#">속도위반 과태료</a>
							</h5>
						</div>
					</div> --%>

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