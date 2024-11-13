<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<meta charset="UTF-8">
<title>모임 가입 페이지</title>
<link href="/resources/LHN/css/join_main.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/side_left.jsp" />
		</div>
		<div id="main_page">
			<div id="g_name">
				<p>${gvo.group_title}</p>
			</div>
			<hr>
			<div class="container2">
				<div class="g_left"></div>
				<div class="g_center"><a href="/onegroup?group_idx=${gvo.group_idx }">모임 상세 보기</a></div>
				<div class="g_right">${gvo.group_currentCount}/${gvo.group_maxCount }</div>
			</div>
			<hr>
			<div id="box">
				<div class="leftbox">
					<div id="g_img"><img style="width: 100%; height: 100%; object-fit: contain;" alt="이미지" src="/resources/upload/${gvo.group_img}"> </div>
					<div id="g_des">${gvo.group_des}</div>
				</div>
				<div class="rightbox">
					<div id="g_post">
						<h5 style="text-align: center; border: thick;">모임 수다</h5>
						<table style="width: 100%; margin-top: 10px;">
						 <thead>
							<tr>
								<th>게시물 제목</th>
								<th>작성자</th>
							</tr>
						 </thead>
						 <tbody id="tbody">
						 <c:choose>
						 	<c:when test="${empty list}">
								<tr><td colspan="2"><h3>게시물이 존재하지 않습니다</h3></td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach  var="k" items="${list}">
								<tr>
									<td><a href="/detail?post_idx=${k.post_idx }">${k.post_title}</a></td>
									<td>${k.user_id}</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						 </c:choose>
							
						</table>
						</tbody>
					</div>

					<div id="g_member">
						<h5 style="text-align: left:;">모임 멤버</h5>
						<ul style="text-align: left; margin-left: 15px; margin-top: 10px;">
							<li>${gvo.user_id}👑</li><br>
							<c:forEach  var="j" items="${g_list}">
								<li>${j}</li><br>
							</c:forEach>
							
							
						</ul>
					</div>
				</div>
			</div>
			<form method="post" class="g_join_box">
					<input type="hidden" name="user_id" value="${gvo.user_id}">
					<input type="hidden" name="group_idx" value="${gvo.group_idx}">
				
				<div class="join_container">
					<div class="g_left"></div>
					<div class="g_center">
						<input type="button" value="가입하기" id="joinbtn" onclick="group_join_go(this.form)">
					</div>
					<div class="g_right" id="g_book_mark">
						<input type="submit" value="즐겨찾기" id="g_bmk" onclick="">
					</div>
				</div>
			</form>
		</div>
	</div>
   <script type="text/javascript">
   function group_join_go(f) {
		f.action = "/group_join_go";
		f.submit();
	}
   </script>
</body>
</html>