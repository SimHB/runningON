<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쪽지 내용</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/resources/KGW/css/thumbs11.css" rel="stylesheet">

</head>
<body>
	<!--
		쪽지 내용은 받은 쪽지와 보낸 쪽지 내용 분류하기
		ex) 받은 쪽지는 보낸 사람 과 답장하기가 화면에 출력되지만
			보낸 쪽지는 받은 사람 이 출력되고 답장하기 버튼은 비활성화
	-->
		 <table>
        <tr>
            <th>제목</th>
            <th>보낸 사람</th>
            <th>보낸 시간</th>
        </tr>
        <tr>
            <td>쪽지 제목</td>
            <td>홍길동</td>
            <td>10.10. 15:35</td>
        </tr>
    </table>

    <div class="message-content">
        쪽지 내용 ~~~~~~
    </div>

    <a href="/my_msg_write" class="button">1. 답장하기</a>
			
	



</body>
</html>