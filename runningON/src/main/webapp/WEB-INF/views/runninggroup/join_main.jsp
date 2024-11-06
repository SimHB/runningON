<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<p>우리 러닝은 영원히! 포에버런!</p>
			</div>
			<hr>
			<div class="container2">
				<div class="g_left"></div>
				<div class="g_center">모임 상세 보기</div>
				<div class="g_right">10/15</div>
			</div>
			<hr>
			<div id="box">
				<div class="leftbox">
					<div id="g_img">모임 사진</div>
					<div id="g_des">모임 소개 글</div>
				</div>
				<div class="rightbox">
					<div id="g_post">
						<h5 style="text-align: center; border: thick;">모임 수다</h5>
						<table style="width: 100%; margin-top: 10px;">
							<tr>
								<th>게시물 제목</th>
								<th>닉네임</th>
							</tr>
							<tr>
								<td>오늘 운동 너무 힘들었어요!</td>
								<td>장만호</td>
							</tr>
							<tr>
								<td>같이 뛸 사람 모집합니다~</td>
								<td>최기영</td>
							</tr>
						</table>
					</div>

					<div id="g_member">
						<h5 style="text-align: left:;">모임 멤버</h5>
						<ul style="text-align: left; margin-left: 15px; margin-top: 10px;">
							<li>러닝왕👑</li>
							<li>러닝보</li>
							<li>최기영</li>
							<li>양호석</li>
							<li>오연차</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="g_join_box">
				<div class="join_container">
					<div class="g_left"></div>

					<div class="g_center">
						<input type="submit" value="가입하기" id="joinbtn">
					</div>
					<div class="g_right" id="g_book_mark">
						<input type="submit" value="즐겨찾기" id="g_bmk">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
