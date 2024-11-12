<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>프로필 및 게시글 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
	<link href="/resources/KGW/css/navL.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			localStorage.setItem("activeLinkId", "myInfoLink");
			$(".navL a").removeClass("active");
		    $(".ul2").removeClass("active-parent");
	
		    // 클릭한 링크에 active 클래스 추가
		    $("#myInfoLink").addClass("active");
	
		    // 상위 .ul2 요소에 active-parent 클래스 추가
		    $("#myInfoLink").closest(".ul2").addClass("active-parent");
		});
	</script>
</body>
</html>