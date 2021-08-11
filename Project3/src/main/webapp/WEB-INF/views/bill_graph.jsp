<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="kr.user.mapper.GoMapper"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.user.mapper.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="cpath" value="${pageContext.request.contextPath}" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
	var result="<table style='margin-left: auto; margin-right: auto; text-align: center;'>";
	result+="<tr style='border-bottom: 1px solid #dee2e6;' bgcolor='#D2D2FF'; height=45px;>";
	result+="<td width='10%'><h5>번호<h5></td>";
	result+="<td width='10%'><h5>종류<h5></td>";
	result+="<td width='10%'><h5>고지서<h5></td>";
	result+="<td width='10%'><h5>납부 날짜<h5></td>";
	result+="<td width='10%'><h5>납부 비용<h5></td>";
	result+="<td width='10%'><h5>납부 은행<h5></td>";
	result+="<td width='10%'><h5>등록 일자<h5></td>";
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
	if (session.getAttribute("login") != null) {
		u_vo = (UsersVO) session.getAttribute("login");
	}
	List<NoticeVO> t_list = (List<NoticeVO>) session.getAttribute("t_list");
	List<NoticeVO> n_list = (List<NoticeVO>) session.getAttribute("n_list");

	DecimalFormat formatter = new DecimalFormat("###,###");
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
			<!-- <div class="row"> 
				<div class="col-lg-8 col-md-7 order-md-1 order-1"> -->
			<div class="blog__details__text" style="text-align: center;">
				<!-- 좌측 그래프를 선택하면 해당 아이프레임에 노출되도록... 
						<!-- 최근고지서 부분 불러오는부분 -->
				
				<%
				int recently_money = Integer.parseInt((String)request.getAttribute("recently_money").toString());
				System.out.println(recently_money);
				%>
				<button type="button" class="site-btn"
							onclick="run_model(<%=recently_money%>)">다음달 요금 예측</button>
					<div class="blog__sidebar__item">
					
						
					</div>
				<table id="list_table"
					style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr style="border-bottom: 1px solid #dee2e6;" bgcolor="EBFBFF"
						; height=45px;>
						<td width="10%"><h5>
								최근 5개월
								<h5></td>
						<td width="10%"><h5>
								고지서
								<h5></td>
						<td width="10%"><h5>
								납부 비용
								<h5></td>
						<td width="10%"><h5>
								상세 내역
								<h5></td>
					</tr>
						<!-- 	<div class="blog__sidebar__recent">	 -->
						<%
							if (t_list.size() >= 5) {
						%>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<!-- <div class="blog__sidebar__recent__item__text" > -->
						<tr style="border-bottom: 1px solid #dee2e6;">
							<td><font color="#b4b4b4";><%=t_list.get(i).getPay_day()%></font></td>
							<td><%=t_list.get(i).getNotice_title()%></td>
							<td><%=formatter.format(t_list.get(i).getPay_money())%></td>

							<td><button class="btn btn-info btn-sm"
									onclick="getJson(<%=t_list.get(i).getNotice_num()%>)">확인
									하기</button></td>
						</tr>
						<%
							}
						} else {
						%>
						<%
							for (int i = 0; i < t_list.size(); i++) {
						%>
						<!-- <div class="blog__sidebar__recent__item__text" > -->
						<tr style="border-bottom: 1px solid #dee2e6;">
							<td><%=t_list.get(i).getPay_day()%></td>
							<td><h6><%=t_list.get(i).getNotice_title()%></h6></td>
							<td><%=formatter.format(t_list.get(i).getPay_money())%></td>

							<td><button class="btn btn-info btn-sm"
									onclick="getJson(<%=t_list.get(i).getNotice_num()%>)">확인
									하기</button></td>
						</tr>
						<%
							}
						}
						%>
					
				</table>
				<br> <br> <br>
				<!-- 최근고지서 부분 불러오는부분 -->
				<div id="c_list" align="center"></div>
				<p>ㅤ</p>
				<h2 align="center">
					"<%=u_vo.getUser_name()%>"님의 월별 관리비 추이
				</h2>
				<!-- 그래프 부분 -->
				<p>ㅤ</p>
				<div align="center"
					style="width: 600px; height: 600px; margin-left: 250px;">
					<!--차트가 그려질 부분-->

					<canvas align="center" id="myChart"></canvas>
				</div>

				<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        //'1','2','3','4','5','6','7'                  
                    	<%if (t_list.size() == 0) {%>  
                       	'등록된 고지서가 없습니다.'
                    	<%} else if (t_list.size() > 5) {%>
                    	 '<%=t_list.get(4).getPay_day()%>',
                     	'<%=t_list.get(3).getPay_day()%>',
                     	'<%=t_list.get(2).getPay_day()%>',
                     	'<%=t_list.get(1).getPay_day()%>',
                     	'<%=t_list.get(0).getPay_day()%>'
                    	<%} else {
for (int i = t_list.size(); i > 0; i--) {%>
                    	'<%=t_list.get(i - 1).getPay_day()%>',
                    	<%}%>
                    	<%}%>
                    ],
                    datasets: [
                        { //데이터 
                            label: '고지서', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	
                            	//25,20,23,26,25 //x축 label에 대응되는 데이터 값
                            	<%if (t_list.size() == 0) {%>  
                            	0
                            	<%} else if (t_list.size() > 5) {%>
                            	<%=t_list.get(4).getPay_money()%>,
                            	<%=t_list.get(3).getPay_money()%>,
                            	<%=t_list.get(2).getPay_money()%>,
                            	<%=t_list.get(1).getPay_money()%>,
                            	<%=t_list.get(0).getPay_money()%>
                            	<%} else {
for (int i = t_list.size(); i > 0; i--) {%>                        	
                            	<%=t_list.get(i - 1).getPay_money()%>,	
                            	<%}%>
                            	<%}%>
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
            console.log($("#list_table>tr").eq(0).text());
            function run_model(num) {
            	 console.log("들어옵니다");
            	 
            	 $.ajax({
            	        type : 'post',
            	        url : 'http://127.0.0.1:8082/test',
            	        data :{"test":num} ,
            	        dataType : 'text',
            	        success : function(res) {
            	        	/* var res = String(test) */
            	        	
            	        	$(".blog__sidebar__item").append("<table style='margin-left: auto; margin-right: auto; text-align: center;'>"+
            	               	 "<tr style='border-bottom: 1px solid #dee2e6;' bgcolor='EBFBFF'>"+
            	               	 "<td width='10%'><h5>이번달 금액</h5></td>"+
            	               	 "<td width='10%'><h5>다음달 예측 금액</h5></td></tr>"+
            	               	 "<tr style='border-bottom: 1px solid #dee2e6;'>"+
            	               	 "<td width='10%'><h5>"+
            	               	$("#list_table tbody").children().eq(1).children().eq(2).text()
            	               	 +"</h5></td>"+
            	               	 "<td width='10%'><h5>"+res+"</h5></td>"
            	               	 )
            	               	 
            	        },
            	        error : function(e) {
            	        	console.log(e);
            	        }
            	      })
			}
        </script>
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