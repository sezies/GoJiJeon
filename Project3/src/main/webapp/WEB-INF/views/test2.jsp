<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="javascript:kakaoLogin();"><img src="${cpath}/resources/kakao_login.png" alt="카카오계정 로그인" style="height: 50px;width:300px"/></a>


	<button onclick = "Logout()" > 로그아웃 </button>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('bcffc70eccffd047cc23914d67e461cc');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    window.location.href="${cpath}/index_main.do"
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
        
        
        function Logout(){ sessionStorage.clear(); }

    </script>
</body>
</html>