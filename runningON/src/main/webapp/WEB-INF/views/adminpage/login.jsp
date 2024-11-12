<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
div#login-wrapper{
position : absolute;
top: 40%;
left: 40%;
border: solid 1px gray;
width: 400px;
height: 200px;
margin: center;
text-align: center;
}

</style>
<title> Admin Login Page</title>
</head>
<body>

<div id="login-wrapper">
	<br>
	<img src="/resources/MJS/images/logob.png" width="100" />
	<br>
	<br>
	<form action="/loginAction" method="post">
		<div>
			<input type="text" id="id" name="id" maxlength="24" placeholder="ID">
		</div>
		<div>
			<!-- <label>Password</label> -->
			<input type="password" id="pwd" name="pw" maxlength="24" placeholder="PW">
		</div>
		<br>
		<button type="submit" id="btn_login">로그인</button>
	</form>
</div>


</body>
</html>