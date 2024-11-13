<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>러닝모임 페이지</title>
<link href="/resources/LHN/css/onegroup.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모임 페이지</title>
<!-- 외부 CSS 파일 링크 -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/side_left.jsp" />
		</div>
		<div id="main_page">
			<div class="g_name">
				<h1>${gvo.group_title}</h1>
			</div>
			<br>
			<hr>
			<br>
			<div class="g_gong">
				<c:choose>
					<c:when test="${empty pvo2}">
						<tr>
							<td colspan="2"><h3>공지사항이 존재하지 않습니다</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
							<tr>
								<td><a href="/detail?post_idx=${pvo2.post_idx }">${pvo2.post_title}</a></td>
							</tr>
					</c:otherwise>
				</c:choose>
			</div>
			<hr>
			<div class="content_box">
				<!-- 모임 수다 -->
				<div class="content_sd">
					<h2>모임 수다</h2>
					<table class="content_table">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody id="suda_list">
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
						</tbody>
					</table>
					<div id="t_foot">
						<b>이전</b> <b>현재페이지</b> <b>다음</b>
					</div>
				</div>
				<!-- 모임 사진 -->
				<div class="photo_section">
					<h2 style="text-align: center; margin: 20px;">모임 사진</h2>
					<hr>
					<div class="photo_table">
						<c:forEach var="k" items="${list}" varStatus="status">
							<c:if test="${not empty k.post_img}">
							<a href="/detail?post_idx=${k.post_idx}"><img src="/resources/upload/${k.post_img}" style="width: 80px"></a>
							<!--  ${status.index + 1} -->
							</c:if>
							<c:if test="${(status.index + 1) % 3 == 0}">
          					  <br>
       						</c:if>
						</c:forEach>
						<br><img alt="그림8"src="/resources/LHN/images/cat01.png" class="photo8">
					</div>

					<div id="p_foot">
						<b>이전</b> <b>현재페이지</b> <b>다음</b>
					</div>
				</div>

				<div class="member">
					<h2>모임 멤버</h2>
					<ul>
						<li>${gvo.user_id}👑</li><br>
							<c:forEach  var="j" items="${g_list}">
								<li>${j}</li><br>
							</c:forEach>
					</ul>

					<div id="m_foot">
					</div>
				</div>
			</div>
			<!-- 06. 하단 버튼 -->
			<footer class="footer">
			<form action="/g_write" method="get">
				<input type="submit" value="글쓰기" class="action_button" id="j_writer">
			</form>
			</footer>
		</div>
	</div>
</body>
</html>