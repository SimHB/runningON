<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>네이버 로그인</title>
</head>
<body>
	<h2>네이버 로그인 성공</h2>
	 <div id="result"></div>
    
    <a href="">로그아웃</a>
    
    <script type="text/javascript">
    $(function() {
    	$("#result").empty();
        $.ajax({
            url : "/NaverUserInfo",
            method : "post",
            dataType : "json",
            success : function(data) {
            	let name = data.response.name;
            	let nickname = data.response.nickname;
            	let email = data.response.email;
      			let profile_image = data.response.profile_image;
      			
      			let str = "<li>" + name + "</li>";
            		str += "<li>" + nickname + "</li>";
            		str += "<li>" + email + "</li>";
            		str += "<img src = " + profile_image + "style='width:150px'>";
            	
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