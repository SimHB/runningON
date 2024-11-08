<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보낸 쪽지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
<link href="/resources/KGW/css/thumbs9.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	    <div id="main_page">
			<div class="tabs">
				<a href="/my_msg_receive">받은 쪽지함</a> 
				<a href="/my_msg_send" class="active">보낸 쪽지함</a>
			</div>
		
			<table>
				<tr>
					<th>제목</th>
					<th>받는 사람</th>
					<th>보낸 시간</th>
				</tr>
				<tr>
					<td class="message-title"><a href="/my_msg_detail">쪽지 제목</a></td>
					<td>홍길동</td>
					<td>10.10. 15:35</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>