<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은 쪽지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
<link href="/resources/KGW/css/thumbs10.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	    <div id="main_page">
		<div class="tabs">
        <a href="/my_msg_receive" class="active">받은 쪽지함</a>
        <a href="/my_msg_send">보낸 쪽지함</a>
    </div>

    <table>
        <tr>
            <th>제목</th>
            <th>보낸 사람</th>
            <th>보낸 시간</th>
        </tr>
        <c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="3"><h3>게시물이 존재하지 않습니다.</h3></td></tr>
			</c:when>
		<c:otherwise>
			<c:forEach var="k" items="${list}" varStatus="c">
			<tr>
				<td class="message-title"><a href="/my_msg_detail?msg_idx=${k.msg_idx}">${k.msg_subject}</a></td>
				<td>${k.msg_sender_id}</td>
				<td>${k.msg_sent_at }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
    </table>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	localStorage.setItem("activeLinkId", "receivedMessages");
	$(".navL a").removeClass("active");
    $(".ul2").removeClass("active-parent");

    // 클릭한 링크에 active 클래스 추가
    $("#receivedMessages").addClass("active");

    // 상위 .ul2 요소에 active-parent 클래스 추가
    $("#receivedMessages").closest(".ul2").addClass("active-parent");
});
</script>
</body>
</html>