<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.user.mapper.NoticeVO"%>
<%@page import="kr.user.mapper.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>

<%
UsersVO u_vo = null;
if(session.getAttribute("login")!= null){
u_vo = (UsersVO)session.getAttribute("login");
}
List<NoticeVO> t_list = (List<NoticeVO>)session.getAttribute("t_list");
//System.out.println(t_list.get(0).getPay_day()+"그래프 날짜");
//System.out.println(t_list.get(0).getPay_money()+"그래프 돈");
System.out.println(t_list.size()+"리스트크기");

%>
<div style="width: 900px; height: 900px;">
	<!--차트가 그려질 부분-->
	
	<canvas id="myChart"></canvas>
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
                    	<%if(t_list.size()==0){%>  
                       	'등록된 고지서가 없습니다.'
                    	<%}else if(t_list.size()>5){%>
                    	 '<%=t_list.get(4).getPay_day()%>',
                     	'<%=t_list.get(3).getPay_day()%>',
                     	'<%=t_list.get(2).getPay_day()%>',
                     	'<%=t_list.get(1).getPay_day()%>',
                     	'<%=t_list.get(0).getPay_day()%>'
                    	<%}else{ for(int i =t_list.size(); i>0;i--){%>
                    	'<%=t_list.get(i-1).getPay_day()%>',
                    	<%}%>
                    	<%}%>
                    ],
                    datasets: [
                        { //데이터
                            label: '고지서', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	
                            	//25,20,23,26,25 //x축 label에 대응되는 데이터 값
                            	<%if(t_list.size()==0){%>  
                            	0
                            	<%}else if(t_list.size()>5){%>
                            	<%=t_list.get(4).getPay_money()%>,
                            	<%=t_list.get(3).getPay_money()%>,
                            	<%=t_list.get(2).getPay_money()%>,
                            	<%=t_list.get(1).getPay_money()%>,
                            	<%=t_list.get(0).getPay_money()%>
                            	<%}else{ for(int i =t_list.size(); i>0;i--){%>
                            	<%=t_list.get(i-1).getPay_money()%>,
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
	