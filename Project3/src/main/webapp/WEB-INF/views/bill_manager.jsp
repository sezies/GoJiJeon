<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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

u_vo = (UsersVO)session.getAttribute("login");
%>


    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="./index_main.do"><img src="${cpath}/resources/img/logo.png" alt=""></a>
        </div>
        <!-- <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div> -->
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
            <ul><%if(u_vo==null) {%>
                <li><a href="./index_main.do">메인</a></li>
                <li><a href="./community.do">커뮤니티</a></li>
                <li><a href="./contact.do">문의하기</a></li>
            <%}else {%>
                 <li><a href="./index_main.do">메인</a></li>
                 <li><a href="#">고지서 서랍</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./bill_upload.do">고지서 업로드</a></li>
                        <li><a href="${cpath}/NoticeList.do?user_num=<%=u_vo.getUser_num()%>">고지서 관리</a></li>
                        <li><a href="./bill_graph.do">고지서 분석</a></li>
                    </ul>
                </li>
                <li><a href="./community.do">커뮤니티</a></li>
                <li><a href="./contact.do">문의하기</a></li>
            <%} %></ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <!--  <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>-->
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
        <!--
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="${cpath}/resources/img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
       -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index_main.do"><img src="${cpath}/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <nav class="header__menu">
                        <ul><%if(u_vo==null) {%>
                            <li class="active"><a href="./index_main.do">메인</a></li>
                            <li><a href="./community.do">커뮤니티</a></li>
                            <li><a href="./contact.do">문의하기</a></li>
                            <%}else {%>
                            <li class="active"><a href="./index_main.do">메인</a></li>
                            <li><a href="#">고지서 서랍</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./bill_upload.do">고지서 업로드</a></li>
                                    <li><a href="${cpath}/NoticeList.do?user_num=<%=u_vo.getUser_num()%>">고지서 관리</a></li>
                                    <li><a href="./bill_graph.do">고지서 분석</a></li>
                                </ul>
                            </li>
                            <li><a href="./community.do">커뮤니티</a></li>
                            <li><a href="./contact.do">문의하기</a></li>
                       <%} %></ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <nav class="header__menu">
                           <!--  로그인 배너 (찐) -->
                         <%if(u_vo==null) {%>
                            <a href="./login_main2.do" style="font-size:12px; color:gray; font-weight:bold; letter-spacing :2px;">로그인</a>
                            &emsp;&emsp;&emsp;
                            <a href="./join_main2.do" style="font-size:12px; color:gray; font-weight:bold; letter-spacing :2px;">회원가입</a>
                          <%}else {%>
                            <a href="${cpath}/UsersLogout.do" style="font-size:12px; color:gray; font-weight:bold; letter-spacing :2px;" >로그아웃</a>
                            &emsp;
                            <a href="./mypage_main.do" style="font-size:12px; color:gray; font-weight:bold; letter-spacing :2px;">마이페이지</a>
                            <%} %>
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

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${cpath}/resources/img/menu_banner.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>고지서 관리</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>내 고지서 종류</h2>
                        <!--  <button type="button" class="site-btn" onclick="location.href='bill_manager.do'" style="height:40px; text-align: justify;">새로고침</button>-->
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">관리비</li>
                            <li data-filter=".fresh-meat">자동차세</li>
                            <li data-filter=".vegetables">지방세</li>
                            <li data-filter=".fastfood">주민세</li>
                            <li data-filter=".slowfood">과태료</li>
                        </ul>
                    </div>
                </div>
            </div>
  <!-- a --><div class="row featured__filter">
                <c:forEach var = "vo" items = "${list}"> 
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                
                    <div class="featured__item">
                       <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/${vo.img}">
                               <ul>
                                <!--  <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">${vo.notice_title}</a></h6>
                            <h5>${vo.pay_money}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <%-- <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                 <!--<li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix slowfood fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <!--<li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix slowfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <!--<li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix slowfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-5.jpg">
                            <ul class="featured__item__pic__hover">
                               <!-- <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-6.jpg">
                            <ul class="featured__item__pic__hover">
                                <!--<li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-7.jpg">
                            <ul class="featured__item__pic__hover">
                               <!-- <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${cpath}/resources/img/featured/feature-8.jpg">
                            <ul class="featured__item__pic__hover">
                                <!--<li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>-->
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="./bill_contents.do">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div> --%>
<!-- a --> </div>
        </div>
    </section>
    <!-- Featured Section End -->

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