<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css" type="text/css">

</head>

<body>
<%
UsersVO u_vo = null;
if(session.getAttribute("login")!= null){
u_vo = (UsersVO)session.getAttribute("login");
System.out.println(u_vo+"||||이거는 맨 위에거");
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
            <a href="./index_main.do"><img src="${cpath}/resources/img/logo1.png" alt=""></a>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
                 <%if(u_vo==null) {%>
                <a href="./login_main2.do"><i class="fa fa-user"></i>로그인</a>
                <a href="./join_main2.do"><i class="fa fa-user"></i>회원가입</a>
                <%}else {%>
                 <a href="${cpath}/UsersLogout.do"><i class="fa fa-user"></i>로그아웃</a>
                <a href="./mypage_main.do"><i class="fa fa-user"></i>마이페이지</a>
                <%} %>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul><%
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
				%></ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
        </div>
        <div class="humberger__menu__contact">
            <ul>
               <!-- <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>-->
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
                        <a href="./index_main.do"><img src="${cpath}/resources/img/logo1.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <nav class="header__menu" style="padding-top:45px;">
                        <ul><%
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
							%></ul>
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
    <section class="breadcrumb-section set-bg" data-setbg="${cpath}/resources/img/menu_banner.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>문의하기</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <a style="font-size: 36px; color: black; font-weight: bold;">문의사항</a>
                    </div>
                </div>
            </div>
            
            <form action="${cpath}/contactInsert.do" method="post" onsubmit = "return yes()">
                <div class="row">
                	<input type="hidden" name="user_num" value="<%=u_vo.getUser_num()%>">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="작성자 이름을 적어주세요" value="<%=u_vo.getUser_name()%>" readonly="readonly">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" name="user_mail" placeholder="회신받을 이메일을 적어주세요">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="문의사항을 적어주세요" name="user_opinion"></textarea>
                        <button type="submit" class="site-btn" >문의 남기기</button>
                   </div>
                </div>
            </form>
           
        </div>
    </div>
    <!--  Contact Form End -->

    <!-- Map Begin -->
    <div class="map">
        <iframe
            src="${cpath}/resources/img/cgi.jpg"
            height="1000" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>스마트인재개발원</h4>
                <ul>
                    <li>전화 : 062-655-3509</li>
                    <li>주소 : 광주광역시 남구 송암로60 2층</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Map End -->

    <!-- 빈칸인 경우에는 여기에서 모달창을 띄워주기! Controller로 넘어가면 안됨!!!!!!!! -->
    <!-- form태그가 지금은 기본적으로 무조건 submit을 진행하는데 그렇게 하지말고 javascript사용해서
    	submit시 실행할 별도의 함수 지정할 것!
    	---빈칸인지 아닌지 여부 판별해서
    	-- 그렇지 않은 경우에는 보내주기! -->
    
    <!-- Js Plugins -->
    <script src="${cpath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${cpath}/resources/js/bootstrap.min.js"></script>
    <script src="${cpath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${cpath}/resources/js/jquery-ui.min.js"></script>
    <script src="${cpath}/resources/js/jquery.slicknav.js"></script>
    <script src="${cpath}/resources/js/mixitup.min.js"></script>
    <script src="${cpath}/resources/js/owl.carousel.min.js"></script>
    <script src="${cpath}/resources/js/main.js"></script>
    <script>
    function yes(){
    	// input 태그안에 있는 값이 빈칸이면 alert
    	if($('input[name=user_mail]').val()=='' || $('textarea[name=user_opinion]').val()==''){
    		alert("빈칸을 모두 작성해주세요.");
    		return false;
    	}else{
    		alert("문의가 등록되었습니다.")
    		return true;
    	}  	
    	
    }
    
    </script>

</body>

</html>