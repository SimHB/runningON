<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="/resources/CSH/css/join.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body bgcolor="#FEF8F1">
	<form method="post" action="/login_join_ok" style="height: 100vh;">
		<div class="login_space">
		<header class = "header">
			<a href="/main" class="logo">
				<img alt="로고" src="/resources/KGW/images/logowhite.png" style="width: 100px">
			</a>
		</header>
		   <div id="idCheckResult"></div>
			<div class="join_space">
			<table class="join1">
					<tr>
						<td>
						<!-- name 과 id 구분하기 -->
							<input type="text" placeholder="아이디" size="14" name="user_id" id="user_id" required>
							 <button type="button" onclick="checkUserId()">중복확인</button>
							 <span id="idCheckResult"></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" placeholder="비밀번호" size="14" name="user_pw" required>
						</td>
					</tr>
			
			</table>
			</div>
			
			<table class="join1">
					<tr>
						<td>
							<input type="text" placeholder="이름" size="14" name="user_name" required>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="닉네임" size="14" name="user_nickName" required>
						</td>
					</tr>
					<tr>
						<td>
						<input type="text" placeholder="이메일" size="14" name="user_email" required>
						<button type="button" onclick="checkUseremail()">중복확인</button>
						</td>
					</tr>
				
			</table>
			<div class="join_btn">
			<input type="submit" value="회원가입" >
			</div>
		</div>
	</form>

<script>
function checkUserId() {
    var userId = document.getElementById("user_id").value; // 아이디 값 가져오기

    // 아이디 입력 값이 비어있으면 중복 확인을 하지 않도록 처리
    if (userId.trim() === "") {
        alert("아이디를 입력해주세요.");
        return;
    }

    // Ajax로 중복 확인 요청
    $.ajax({
        url: "/checkId", // 중복 확인을 위한 서버 URL
        type: "POST",
        data: { userId: userId }, // 아이디를 서버로 전송
        success: function(response) {
            if (response === "success") {
                document.getElementById("idCheckResult").innerText = "이미 존재하는 아이디입니다.";
                document.getElementById("idCheckResult").style.color = "red";
            } else if (response === "fail") {
                document.getElementById("idCheckResult").innerText = "사용 가능한 아이디입니다.";
                document.getElementById("idCheckResult").style.color = "green";
            } else {
                document.getElementById("idCheckResult").innerText = "서버 오류가 발생했습니다.";
                document.getElementById("idCheckResult").style.color = "orange";
            }
        },
        error: function() {
            document.getElementById("idCheckResult").innerText = "서버와의 연결에 실패했습니다.";
            document.getElementById("idCheckResult").style.color = "orange";
        }
    });
}

</script>

</body>
</html>