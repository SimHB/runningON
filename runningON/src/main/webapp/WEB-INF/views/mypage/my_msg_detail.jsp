<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쪽지 내용</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
<link href="/resources/KGW/css/thumbs11.css" rel="stylesheet">
<link href="/resources/KGW/css/thumbs.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	    <div id="main_page">
	<c:choose>
	<c:when test="${user_id != list.msg_sender_id }">
	<table>
        <tr>
            <th>제목</th>
            <th>보낸 사람</th>
            <th>보낸 시간</th>
        </tr>
        <tr>
            <td>${list.msg_subject }</td>
            <td>${list.msg_sender_id }</td>
            <td>${list.msg_sent_at }</td>
        </tr>
    </table>

    <div class="message-content">
        ${list.msg_content }
    </div>

    <a href="/my_msg_write?msg_receiver_id=${msg_receiver_id}" class="button">1. 답장하기</a>
			
	</c:when>
	<c:otherwise>
	<table>
        <tr>
            <th>제목</th>
            <th>받은 사람</th>
            <th>보낸 시간</th>
        </tr>
        <tr>
            <td>${list.msg_subject }</td>
            <td>${list.msg_receiver_id }</td>
            <td>${list.msg_sent_at }</td>
        </tr>
    </table>

    <div class="message-content">
        ${list.msg_content }
    </div>
	</c:otherwise>
	</c:choose>
		</div>
	</div>

</body>
</html>