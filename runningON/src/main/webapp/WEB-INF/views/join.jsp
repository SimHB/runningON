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
	<form method="post">
		<div class="login_space">
			<header class="header">
				<a href="/main" class="logo"> <img alt="로고"
					src="/resources/CSH/images/logo_image.png" style="width: 100px">
				</a>
			</header>
			<div class="join_space">
				<table class="join1">
					<tr>
						<td><input type="text" placeholder="이름" size="14"
							name="m_name" required></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="이메일" size="14"
							name="m_email" required>
							<button onclick="javascript:btn()">인증</button></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="인증코드" size="14"
							name="m_code" required></td>
					</tr>

				</table>
			</div>


			<table class="join1">
				<tr>
					<td><input type="text" placeholder="닉네임" size="14"
						name="m_nickname" required></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이메일" size="14"
						name="m_email" required>
						<button onclick="javascript:btn()">중복확인</button></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호" size="14"
						name="m_pw" required></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호 확인" size="14"
						name="m_pw_ok" required></td>
				</tr>
			</table>
			<div class="join_btn">
				<input type="submit" value="회원가입">
			</div>
		</div>
	</form>


	<!-- 	<div class="login_space">
		<div class="login_box">
			<div class="input_item.id" id="input_item.id">
				<input type="text" placeholder="아이디" size="14" name="m_id" required>
			</div>
		</div>
		<div class="login_box">
			<input type="password" placeholder="비밀번호" size="14" name="m_pw"
				required>
		</div>
		<div class="login_button">
			<input type="submit" value="로그인">
		</div>
	</div> -->

	<script>
		function btn() {
			alert('버튼이 클릭되었습니다');
		}
	</script>

</body>
</html>