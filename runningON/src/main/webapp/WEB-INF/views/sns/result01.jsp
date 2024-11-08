<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">


 #result img {
	width: 150px;
}

	#result {
		text-align: center;
		
	}
</style>

</head>
<body>
    <h2>카카오 로그인 성공</h2>
    
    
    <div id="result">
    
    
    </div>
    
    <a href="/main">메인페이지</a>
    <a href="/kakaologout">로그아웃</a>
    
 <!--    <script type="text/javascript">
     $(function() {
         $("#result").empty();
         $.ajax({
             url : "/kakaoUserInfo",
             method : "post",
             dataType : "json",
             success : function() {
                 let str  = "<li>닉네임 : ${nickname} </li>";
                     str += "<li>이미지 : <img src= ${profileImage}> </li>";
                 $('#result').append(str);
             }, 
             error : function() {
                 alert("정보를 불러오는 데 실패했습니다.");
             }
         });
      });
    </script> -->
    
     <script type="text/javascript">
     $(function() {
         $("#result").empty();
         $.ajax({
             url : "/kakaoUserInfo",
             method : "post",
             dataType : "json",
             success : function(data) {
            	 const name = data.properties.nickname;
            	 const img = data.properties.profile_image;
            	 const email = data.kakao_account.email;
            	 
            	 let str  = "<li>닉네임 : "+ name +" </li>";
            	 	str  += "<li>이메일 : "+ email +" </li>";
                      str += "<li>이미지 : <img src= " + img +"> </li>";
             $('#result').append(str);
             }, 
             error : function() {
                 alert("정보를 불러오는 데 실패했습니다.");
             }
         });
      });
    </script>
</body>
</html>