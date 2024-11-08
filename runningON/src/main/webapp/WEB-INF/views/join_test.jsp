<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="/resources/CSH/css/join.css" rel="stylesheet">
</head>
<body bgcolor="#FEF8F1">
	<form method="post" action="/login_join_ok">
	<div class="login_space">
	<header class = "header">
		<a href="/main" class="logo">
			<img alt="로고" src="/resources/KGW/images/logowhite.png" style="width: 100px">
		</a>
	</header>
		<div class="join_space">
		<table class="join1">
				<tr>
					<td>
					<!-- name 과 id 구분하기 -->
						<input type="text" placeholder="아이디" size="14" name="user_id" id="user_id" required>
						 <button type="button" onclick="checkUserId()">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" placeholder="비밀번호" size="14" name="user_pw" required>
					</td>
				</tr>
		
		</table>
		</div>
	    <div id="idCheckResult"></div>
	
		
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
    const userId = document.getElementById("user_id").value;
    fetch(`/checkUserId?user_id=${user_id}`)
        .then(response => response.text())
        .then(result => {
            const resultDiv = document.getElementById("idCheckResult");
            if (result === "available") {
                resultDiv.innerText = "사용 가능한 아이디입니다.";
                resultDiv.style.color = "green";
            } else {
                resultDiv.innerText = "이미 사용 중인 아이디입니다.";
                resultDiv.style.color = "red";
            }
        })
        .catch(error => console.error("Error:", error));
}

function checkUseremail() {
    const userEmail = document.getElementById("user_email").value;
    fetch(`/checkUseremail?user_email=${user_email}`)
        .then(response => response.text())
        .then(result => {
            const resultDiv = document.getElementById("emailCheckResult");
            if (result === "available") {
                resultDiv.innerText = "사용 가능한 이메일입니다.";
                resultDiv.style.color = "green";
            } else {
                resultDiv.innerText = "이미 사용 중인 이메일입니다.";
                resultDiv.style.color = "red";
            }
        })
        .catch(error => console.error("Error:", error));
}
</script>

</body>
</html>