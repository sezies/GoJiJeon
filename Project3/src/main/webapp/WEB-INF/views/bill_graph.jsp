<%@page import="kr.user.mapper.NoticeVO"%>
<%@page import="java.util.List"%>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">





function getJson(notice_num){		
		$.ajax({
			url:"${cpath}/NoticeListAjax.do",
			type : "get",
			data : {"notice_num": notice_num},	
			dataType:"json",
			success : ajaxHtml,
			error :function(){alert("error");}
		});
	}
function ajaxHtml(data){ 
	var result="<table >";
	result+="<tr>";
	result+="<td>번호</td>";
	result+="<td>코드</td>";
	result+="<td>제목</td>";
	result+="<td>날짜</td>";
	result+="<td>비용</td>";
	result+="<td>은행</td>";
	result+="<td>이미지</td>";
	result+="<td>등록일자</td>";
	result+="</tr>";
	// 여기에 반복문으로 게시물을 출력
	// 이름없는 함수 
	$.each(data,function(index,obj){
		result+="<tr>";
  		result+="<td>"+obj.notice_num+"</td>";
  		result+="<td>"+obj.notice_code+"</td>";
  		result+="<td>"+obj.notice_title+"</td>";
  		result+="<td>"+obj.pay_day+"</td>";
  		result+="<td>"+obj.pay_money+"</td>";
  		result+="<td>"+obj.pay_bank+"</td>";
  		result+="<td>"+obj.img+"</td>";
  		result+="<td>"+obj.regist_day+"</td>";
  		result+="</tr>";
		
	});
	 
	result+="</table>";
	$("#c_list").html(result);
}	
	
</script>
</head>

<body>
<%
UsersVO u_vo = null;
if(session.getAttribute("login")!= null){
u_vo = (UsersVO)session.getAttribute("login");
}
List<NoticeVO> t_list = (List<NoticeVO>)session.getAttribute("t_list");
List<NoticeVO> n_list = (List<NoticeVO>)session.getAttribute("n_list");
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
							<li><a href="./community.do">커뮤니티</a></li>
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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${cpath}/resources/img/menu_banner.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>고지서 분석</h2>
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
				<div class="col-lg-4 col-md-5 order-md-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>그래프 종류</h4>
							<ul>
								<li><a href="#">선 그래프</a></li>
								<li><a href="#">막대 그래프</a></li>
								<li><a href="#">원 그래프</a></li>
							</ul>
						</div>
						<div class="blog__sidebar__item">
							<h4>그래프 분석</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#">유형별 보기</a> <br> <a href="#">평균치 비교</a>
							</div>
						</div>
						<div class="blog__sidebar__item">
							<h4>최근 고지서</h4>
							<div class="blog__sidebar__recent">
							<!-- 최근고지서 부분 불러오는부분 -->
								 <c:forEach var="n_vo" items="${n_list}" >
								<a href="#" class="blog__sidebar__recent__item" >
									<div class="blog__sidebar__recent__item__pic">
										<img src="${n_vo.img}" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text" >
										<button class="btn btn-info btn-sm" onclick="getJson(${n_vo.notice_num})">${n_vo.notice_num}리스트</button>
										<h6>${n_vo.notice_title}</h6>
										<span>${n_vo.pay_day}</span>
									</div>
									</c:forEach> 
									
									
									
								<%-- <%for(int i = 0 ; i < n_list.size(); i++) {%>						
									<a href="#" class="blog__sidebar__recent__item" >
									<div class="blog__sidebar__recent__item__pic">
										<img src="<%=n_list.get(i).getImg() %>" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text" >
										<button class="btn btn-info btn-sm" onclick="getJson()" ><%=n_list.get(i).getNotice_num()%>리스트</button>
										<h6><%=n_list.get(i).getNotice_title() %></h6>
										<span><%=n_list.get(i).getPay_day()%></span>
									</div>
									<%} %> --%>
									
									
									
							<!-- 최근고지서 부분 불러오는부분 -->		
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div class="blog__details__text">
						<!-- 좌측 그래프를 선택하면 해당 아이프레임에 노출되도록... -->
						
						
						<div id="c_list">여기에 게시판 리스트를 출력하시오</div>
						
						
						
						<%-- <h3>스인재아파트 2021년 8월 관리비</h3>
						<p align="middle">
							<iframe src="${cpath}/resources/img/blog/details/details-pic.jpg"
								style="width: 800px; height: 650px; border: 0;"
								allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
						</p> --%>
						
						
						
						<p>그래프 관련 상세 내용</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

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