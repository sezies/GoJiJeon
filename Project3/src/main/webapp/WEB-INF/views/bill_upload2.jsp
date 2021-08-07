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
<style>
input {
	vertical-align:middle
	position: absolute;
}

label {
	position: absolute;
}

#img {
	position: absolute;
	z-index: 2;
}

.div_rec:hover {
	border: 2px solid blue;
}

.div_rec {
	position: absolute;
	z-index: 3;
}
</style>
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
						<h2>고지서 업로드</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Contact Form Begin -->
	
	<section class="contact-form spad">
	
		<div class="container">
			<!--  <label style="font-size:20px; color: midnight; margin-ieft: auto; margin-top: 50px;">금액</label>
			<label style="font-size:20px; color: midnight; margin-left: auto; margin-top: 125px;">기한</label>
			<label style="font-size:20px; color: midnight; margin-left: auto; margin-top: 200px;">은행</label> -->
			<input name="pay_money" id="inp_chn" type="text" placeholder='금액'
				style="margin: auto; margin-top: 0px;" oninput='fill_inp()'>
			<input name='pay_day' class="inp" disabled="disabled" type="text" placeholder='기한'
				style="margin: auto; margin-top: 0px;" onchange='fill_inp()'>
			<input name="pay_bank" class="inp" disabled="disabled" type="text" placeholder='은행'
				style="margin: auto; margin-top: 0px;" onchange='fill_inp()'>
			<button type="submit" class="site-btn">고지서 저장</button>
		</div>
	</section>
		<div id="div_img" style="margin-left: 450px;"></div>
	<!-- Contact Form End -->

	<script src="${cpath }/resources/js/jquery-3.3.1.min.js"></script>
	<script>
		// 이미지 태그 가져오기
		var img = document.getElementById("img");

		$.ajax({type : 'post',
				url : 'http://127.0.0.1:5000/',
				data : "place2_sample12.jpg",
				dataType : 'json',
				success : function(res) {
					alert(res.im_path);
					$('#div_img').append(
									"<img id='img' src='/controller/resources/img/place2_sample11.jpg'>")
					$.each(res.fields, function(a, b) {
						// cor --> 영역 처리 되어있는 부분의 x,y 좌표 값
						var cor = res.fields[a].boundingPoly.vertices

						// tex --> 선택한 영역의 OCR 결과(text값)
						var tex = res.fields[a].inferText

						// 미리 hover를 주었기 때문에 해당 좌표값을 기준으로 div 태그를 생성
						// id 값은 해당 영역의 json 기반 번호(인덱스값)이고, value값은 text값을 줌
						// 클릭 시 data_send라는 function을 통해 선택한 영역의 value 값을 input 태그에 채움
						$('#div_img').append(
								"<div style='margin-left:" + cor[0].x
										+ "px;margin-top:" + cor[0].y
										+ "px;padding-left:"
										+ (cor[2].x - cor[0].x)
										+ "px;padding-top:"
										+ (cor[2].y - cor[0].y)
										+ "px;' class='div_rec' value='"
										+ res.fields[a].inferText
										+ "' onclick='data_send(" + a
										+ ")' id='" + a + "'></div>")
					})
				},
				error : function() {
					alert('요청 실패쓰');
				}
			})

		// back 버튼을 위한 함수
		// class 명이 inp_re인 놈들을 다 비활성화 시키고 class는 inp, id 값은 inp_chn으로 전환
		// value 값은 초기화 한다.
		function re_inp() {
			$(".inp_re").attr("disabled", true).attr("class", "inp").attr("id",
					"inp_chn").attr("value", "")
			$("#inp_chn").attr("disabled", false);
		}

		// div 태그 클릭시 발생하는 함수
		// id가 inp_chn인 녀석의 value 값을 클릭한 div 태그의 value 값으로 바꾼다
		// div 태그의 value 값은 가져온 json data의 infertext(OCR 결과)이다.
		function data_send(tex) {
			$('#inp_chn').attr('value', $('#' + tex).attr('value'))
			fill_inp();
		}

		// div 태그 클릭과 동시에 발생하는 함수
		// id가 inp_chn인 녀석을 읽기만 가능하게 하고, class 값을 inp_re로 변경, id 값은 초기화 시킨다.
		function fill_inp() {
			$("#inp_chn").attr("readonly", true).attr("class", "inp_re").attr(
					'id', "");
			$(".inp").attr('id', "inp_chn").attr("class", "")
			$("#inp_chn").attr("disabled", false);
		}
	</script>


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