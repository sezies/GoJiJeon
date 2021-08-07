<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   input{
      position: absolute;
   }
   label{
      position: absolute;
   }
   #img{
      position: absolute;
      z-index:2;
   }
   .div_rec:hover{
      border: 2px solid blue;
   }
   .div_rec{
      position: absolute;
      z-index:3;
   }
</style>
</head>
<body>
   <h1>테스트 파일</h1>
   <div id="div_img">
      <%-- <img id="img" src="${cpath }/resources/img/test2_blurr.png"> --%>
   </div>
   <label style="margin-left: 720px;margin-top: 50px;">금액</label>
   <label style="margin-left: 720px;margin-top: 150px;">기한</label>
   <label style="margin-left: 720px;margin-top: 250px;">은행</label>
   <input name="pay_money" id="inp_chn" type="text" value="hi" style="margin-left: 800px;margin-top: 50px;" oninput='fill_inp()'>
   <input name='pay_day' class="inp" disabled="disabled" type="text" style="margin-left: 800px;margin-top: 150px;" onchange='fill_inp()'>
   <input name="pay_bank" class="inp" disabled="disabled" type="text" style="margin-left: 800px;margin-top: 250px;" onchange='fill_inp()'>
   <input type="button" style="margin-left: 1000px;margin-top: 350px;" value="Back" onclick="re_inp()">
   <script src="${cpath }/resources/js/jquery-3.3.1.min.js"></script>
   <script>
      // 이미지 태그 가져오기
      var img = document.getElementById("img");
      
      $.ajax({
        type : 'post',
        url : 'http://127.0.0.1:5000/',
        data : "place2_sample3.jpg",
        dataType : 'json',
        success : function(res) {
           $('#div_img').append("<img id='img' src='/controller/resources/img/"+res.im_path+"'>")
           $.each(res.fields, function(a,b){
              // cor --> 영역 처리 되어있는 부분의 x,y 좌표 값
              var cor = res.fields[a].boundingPoly.vertices
              
              // tex --> 선택한 영역의 OCR 결과(text값)
              var tex = res.fields[a].inferText
              
              // 미리 hover를 주었기 때문에 해당 좌표값을 기준으로 div 태그를 생성
              // id 값은 해당 영역의 json 기반 번호(인덱스값)이고, value값은 text값을 줌
              // 클릭 시 data_send라는 function을 통해 선택한 영역의 value 값을 input 태그에 채움
              $('#div_img').append("<div style='margin-left:"+cor[0].x+"px;margin-top:"
                 +cor[0].y+"px;padding-left:"+(cor[2].x-cor[0].x)+"px;padding-top:"+
                 (cor[2].y-cor[0].y)+"px;' class='div_rec' value='"+res.fields[a].inferText+
                 "' onclick='data_send("+a+")' id='"+a+"'></div>")
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
         $(".inp_re").attr("disabled",true).attr("class","inp").attr("id","inp_chn").attr("value","")
         $("#inp_chn").attr("disabled",false);
      }
      
      // div 태그 클릭시 발생하는 함수
      // id가 inp_chn인 녀석의 value 값을 클릭한 div 태그의 value 값으로 바꾼다
      // div 태그의 value 값은 가져온 json data의 infertext(OCR 결과)이다.
      function data_send(tex){
         $('#inp_chn').attr('value', $('#'+tex).attr('value'))
         fill_inp();
      }
      
      // div 태그 클릭과 동시에 발생하는 함수
      // id가 inp_chn인 녀석을 읽기만 가능하게 하고, class 값을 inp_re로 변경, id 값은 초기화 시킨다.
      function fill_inp() {
         $("#inp_chn").attr("readonly",true).attr("class","inp_re").attr('id',"");
         $(".inp").attr('id',"inp_chn").attr("class","")
         $("#inp_chn").attr("disabled",false);
      }
   </script>
</body>
</html>