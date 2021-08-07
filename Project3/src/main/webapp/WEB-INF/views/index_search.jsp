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
		System.out.println(u_vo + "||||이거는 맨 위에거");
	}
	//검색 기능 구현
	request.setCharacterEncoding("euc-kr");
	String search1 = request.getParameter("search1");
	System.out.println(search1 + "처음가져옴");
	String search2 = request.getParameter("search2");
	System.out.println(search2 + "처음가져옴");

	String search1_ = "";
	if (search1 != null)
		search1_ = search1;
	System.out.println(search1_ + "두번쨰가져옴");
	String search2_ = "";
	if (search2 != null)
		search2_ = search2;
	System.out.println(search2_ + "두번쨰가져옴");

	/* if(search1_.equals("제목")){
		arr2 = 
	}else if(search1_.equals("관리비용")){
		arr2=
	}else if(search1_.equals("항목선택")){
		response.sendRedirect("index_main.jsp");
		System.out.println("메인페이지로이동");
	} */
	//검색 기능 구현
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
				src="${cpath}/resources/img/logo.png" alt=""></a>
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
				<li><a href="./index_main.do">메인</a></li>
				<li><a href="./community.do">커뮤니티</a></li>
				<li><a href="./contact.do">문의하기</a></li>
				<%
					} else {
				%>
				<li><a href="./index_main.do">메인</a></li>
				<li><a href="#">고지서 서랍</a>
					<ul class="header__menu__dropdown">
						<li><a href="./bill_upload.do">고지서 업로드</a></li>
						<li><a href="./bill_manager.do">고지서 관리</a></li>
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
							src="${cpath}/resources/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
						<ul>
							<%
								if (u_vo == null) {
							%>
							<li class="active"><a href="./index_main.do">메인</a></li>
							<li><a href="./community.do">커뮤니티</a></li>
							<li><a href="./contact.do">문의하기</a></li>
							<%
								} else {
							%>
							<li class="active"><a href="./index_main.do">메인</a></li>
							<li><a href="#">고지서 서랍</a>
								<ul class="header__menu__dropdown">
									<li><a href="./bill_upload.do">고지서 업로드</a></li>
									<li><a href="./bill_manager.do">고지서 관리</a></li>
									<li><a href="./bill_graph.do">고지서 분석</a></li>
								</ul></li>
							<li><a href="${cpath}/communityList.do">커뮤니티</a></li>
							<li><a href="./contact.do">문의하기</a></li>
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
			<div class="hero__item set-bg"
				data-setbg="${cpath}/resources/img/hero/banner.jpg">
				<div class="hero__text">
					<span>QUICK START</span> <br>
					<h2>나만의 고지서 관리를 시작하세요</h2>
					<p>Please upload your bill</p>
					<a href="./bill_upload.do" class="primary-btn">업로드 하러 가기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<br>
	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<!--  반복문을 통해 리스트에 있는 값  불러오기 -->
					<%
						if (u_vo != null) {
					%>
					<c:forEach var="n_vo" items="${n_list}">
						<div class="col-lg-3">
							<div class="categories__item set-bg" data-setbg="${n_vo.img}">
								<h5>
									<a href="#">${n_vo.notice_title}</a>
								</h5>
							</div>
						</div>
					</c:forEach>
					<%
						}
					%>
					<!--  반복문을 통해 리스트에 있는 값  불러오기 -->

					<div class="col-lg-3">
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
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

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