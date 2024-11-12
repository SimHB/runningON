<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 폼</title>
</head>
<body>
	<h2>비밀번호를 받을 이메일을 넣어주세요</h2>
    <form id="emailForm" action="/email_send" method="post" onsubmit="saveEmail()">
        <input type="email" id="email" name="email" placeholder="이메일" 
               pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" 
               title="이메일 양식" required>
        <input type="submit" value="전송">
<!-- 	<form action="/email_send" method="post">
		<input type="email" name="email" placeholder="이메일"
			pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식" required>
		<input type="submit" value="전송"> -->
	</form>
	
	<form action="/email_send_chk" method="post" onsubmit="return authNum()">
		<input type="number" id="authNumber" name="authNumber" placeholder="인증번호" maxlength="6" required>
		<input type="submit" value = "전송">
	</form>
	
	<script type="text/javascript">
		<c:if test="${! empty chkEmail}">
			alert("${chkEmail}")
		</c:if>
		function authNum() {
			const authNumber = document.querySelector("#authNumber").value;
		  // 숫자가 6자리인지 확인
		  if(authNumber.length !== 6 || isNaN(authNumber)){
			  alert("6자리 숫자만 입력해야 합니다.")
			  return false ; // 중단.
		  }
		  return true;
		}
		
		//======
		
         // 페이지 로드 시, 저장된 이메일 값을 가져와서 폼에 표시
        window.onload = function() {
            const savedEmail = sessionStorage.getItem("email");
            if (savedEmail) {
                document.getElementById("email").value = savedEmail;
            }
        };

        // 폼 전송 시, 이메일을 sessionStorage에 저장
        function saveEmail() {
            const email = document.getElementById("email").value;
            sessionStorage.setItem("email", email);
        }
	</script>
</body>
</html>