<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="/resources/CSH/css/join.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body bgcolor="#FEF8F1">
	<form method="post" action="/login_join_ok">
		<div class="login_space">
			<header class="header">
				<a href="/main" class="logo"> <img alt="로고"
					src="/resources/images/logo_image.png" style="width: 100px">
				</a>
			</header>
			<div id="idCheckResult"></div>
			<div class="join_space">
				<table class="join1">
					<tr>
						<td>
							<!-- name 과 id 구분하기 --> <input type="text" placeholder="아이디"
							size="14" name="user_id" id="user_id" required>
							<button type="button" onclick="checkUserId()">중복확인</button> <span
							id="idCheckResult"></span>
						</td>
					</tr>
					<tr>
						<td><input type="password" placeholder="비밀번호" size="14"
							name="user_pw" required></td>
					</tr>

				</table>
			</div>

			<table class="join1">
				<tr>
					<td><input type="text" placeholder="이름" size="14"
						name="user_name" required></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="닉네임" size="14"
						name="user_nickName" required></td>
				</tr>
				<tr>
					<td><input type="email" id="email" name="user_email"
						placeholder="이메일"
						pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*"
						title="이메일 양식" required>
						<button class="send_email_btn">인증 이메일 보내기</button></td>
				</tr>
				<tr>
					<td><input type="text" id="authNumber" name="authNumber"
						placeholder="인증번호" maxlength="6" required
						oninput="validateInput(this)" />

						<button type="button" id="authSubmitButton">전송</button> <!-- <input type="number" id="authNumber" name="authNumber" placeholder="인증번호" maxlength="6" required>
					<button type="submit" onclick="sendAuthNum()">전송 </button>
					 --></td>
				</tr>
			</table>
			<div class="join_btn">
				<input type="submit" value="회원가입">
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
			$
					.ajax({
						url : "/checkId", // 중복 확인을 위한 서버 URL
						type : "POST",
						data : {
							userId : userId
						}, // 아이디를 서버로 전송
						success : function(response) {
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
						error : function() {
							document.getElementById("idCheckResult").innerText = "서버와의 연결에 실패했습니다.";
							document.getElementById("idCheckResult").style.color = "orange";
						}
					});
		}

		/* 이메일 인증코드 보내기 */
		function sendEmail() {
			const userMail = document.getElementById("email").value;

			// 이메일 입력 여부 확인
			if (!userMail) {
				alert("이메일을 입력해주세요.");
				return;
			}

			// 이메일 유효성 검사 추가
			const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if (!emailPattern.test(userMail)) {
				alert("올바른 이메일 형식을 입력해주세요.");
				return;
			}

			// Ajax 요청으로 이메일 전송
			$.ajax({
				url : "/email_send",
				type : "POST",
				data : {
					email : userMail
				},
				success : function(response) {
					alert("이메일이 전송되었습니다.");
				},
				error : function() {
					alert("이메일 전송에 실패했습니다.");
				}
			});
		}

		// 버튼 클릭 시 sendEmail 함수 실행
		document.querySelector('.send_email_btn').addEventListener('click',
				sendEmail);
		
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
		
/* 인증코드 확인 */
		 // 인증번호 입력 값 검증 (선택 사항)
function validateInput(input) {
    // 숫자만 입력되도록 제한 (선택 사항)
    input.value = input.value.replace(/[^0-9]/g, '');
}

// 인증번호 체크 함수
function authNum_chk() {
    const authNumber = document.getElementById("authNumber").value;
    console.log("입력한 인증번호: " + authNumber);

    // 인증번호가 비어있는 경우 경고
    if (!authNumber) {
        alert("인증번호를 입력해 주세요.");
        return;
    }

    // AJAX 요청 보내기
    $.ajax({
        url: "/email_send_chk", // 인증번호를 검증하는 서버 URL
        type: "POST", // POST 방식 요청
        data: { authNumber: authNumber }, // 인증번호 전달
        success: function(response) {
        	console.log("인증번호 : " , response)
            if (response === "1") {
                alert("인증번호 일치"); // 인증 성공 시 메시지
                isEmailVerified = true;
            } else {
                alert("인증번호가 일치하지 않습니다."); // 인증 실패 시 메시지
                document.getElementById("authNumber").value = ""; // 입력값 초기화
                document.getElementById("authNumber").focus(); // 입력창에 포커스
                isEmailVerified = false;
            } 
        },
        error: function() {
            alert("서버와의 연결에 실패했습니다. 다시 시도해 주세요."); // AJAX 요청 실패 시 메시지
        }
    });
}

// 버튼 클릭 시 authNum_chk() 함수 호출
document.getElementById("authSubmitButton").addEventListener("click", authNum_chk);
	
	
	
	
	
	</script>

</body>
</html>