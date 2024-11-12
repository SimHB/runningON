<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>view8</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
<link href="/resources/KGW/css/thumbs8.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	    <div id="main_page">
		<form method="post" action="/msg_write_ok">
			<label for="recipients">받는 사람</label> <input type="text"
				id="recipients" name="msg_receiver_id" value="${rewrite}"
				placeholder="여러 명은 쉼표(,) 또는 세미콜론(;)구분(최대10명)" maxlength="100" required>
			<input type="text" name="msg_subject" placeholder="제목" required>
			<textarea id="message" name="msg_content" placeholder="쪽지 내용을 입력하세요..."
				maxlength="1000"></textarea>

			<div class="char-count" id="char-count">0 / 1000자</div>

			<div class="submit-button">
				<input type="submit" value="보내기" >
			</div>
		</form>
		</div>
	</div>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const messageInput = document.getElementById('message');
			const charCount = document.getElementById('char-count');

			messageInput.addEventListener('input', function() {
				const currentLength = messageInput.value.length;
				charCount.textContent = `${currentLength} / 1000자`;
			});
		});
	</script>


</body>
</html>