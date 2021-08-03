<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .showstep1{
        max-height: 300px;
        width : 500px;
        overflow: hidden;
    }
    .showstep2{
        max-height: 600px;
        width : 500px;
        overflow: hidden;
    }
    .content{
        height: 900px;
        width : 500px;
        background-color: #a00;
    }
    .hide{
        display: none;
    }
</style>



<body>






this is test page


<%-- 
<%

Kakao.Auth.authorize({
	  redirectUri: '{REDIRECT_URI}'
	});

%>
 --%>



<!-- <div class="detailinfo showstep1">
    <div class="content">"실제 컨텐츠 표시 영역"</div>
</div>
<a href="#" class="btn_open">더보기</a>
<a href="#" class="btn_close hide">감추기</a>


<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function(){ //DOM 생성 후 이벤트 리스너 등록
    //더보기 버튼 이벤트 리스너
    document.querySelector('.btn_open').addEventListener('click', function(e){
        
        let classList = document.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
        let contentHeight = document.querySelector('.detailinfo > .content').offsetHeight; //컨텐츠 높이 얻기

        // 2단계이면 전체보기로
        if(classList.contains('showstep2')){
            classList.remove('showstep2');
        }
        // 1단계이면 2단계로
        if(classList.contains('showstep1')){
            classList.remove('showstep1');
            if(contentHeight > 600){
                classList.add('showstep2');
            }else{
                document.querySelector('.btn_open').classList.add('hide');
            }
        }
        //전체보기시 더보기 버튼 감추기 & 감추기 버튼 표시
        if(!classList.contains('showstep1') && !classList.contains('showstep2')){
            e.target.classList.add('hide');
            document.querySelector('.btn_close').classList.remove('hide');
            
        }
        
    });
});

//감추기 버튼 이벤트 리스너
document.querySelector('.btn_close').addEventListener('click', function(e){
    e.target.classList.add('hide');
    document.querySelector('.btn_open').classList.remove('hide'); // 더보기 버튼 감춤
    document.querySelector('.detailinfo').classList.add('showstep1'); // 초기 감춤 상태로 복귀
});

//컨텐츠 로딩 완료 후 높이 기준으로 클래스 재처리
window.addEventListener('load', function(){
    let contentHeight = document.querySelector('.detailinfo > .content').offsetHeight; //컨텐츠 높이 얻기
    if(contentHeight <= 300){
        document.querySelector('.detailinfo').classList.remove('showstep1'); // 초기값보다 작으면 전체 컨텐츠 표시
        document.querySelector('.btn_open').classList.add('hide'); // 버튼 감춤
    }
});

</script> -->

</body>
</html>