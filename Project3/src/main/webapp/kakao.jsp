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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>
<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
<!-- 카카오 스크립트 -->
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('872dd0096ddc56941782a158a2761043'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
/* Kakao.Auth.authorize({
                  redirectUri: 'http://localhost:8081/controller/index_main.do'
                })  */
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: "redirect:/index_main.do",
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script> -->

  </body>
</html>