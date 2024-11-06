<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
	<link href="/resources/JSJ/css/post_detail.css" rel="stylesheet">
	<script>
		function previewImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('image-preview');
				output.src = reader.result;
				output.style.display = 'block';
			}
			reader.readAsDataURL(event.target.files[0]);
		}
		// 초기 좋아요, 싫어요 상태 변수
		let liked = false;
		let disliked = false;
	
		function toggleLike() {
			const likeCountElement = document.getElementById("like-count");
			const dislikeCountElement = document.getElementById("dislike-count");
	
			if (!liked) {
				// 좋아요 활성화
				liked = true;
				likeCountElement.textContent = parseInt(likeCountElement.textContent) + 1;
	
				// 만약 싫어요가 활성화된 상태라면, 싫어요를 취소
				if (disliked) {
					disliked = false;
					dislikeCountElement.textContent = parseInt(dislikeCountElement.textContent) - 1;
				}
			} else {
				// 좋아요 취소
				liked = false;
				likeCountElement.textContent = parseInt(likeCountElement.textContent) - 1;
			}
		}
	
		function toggleDislike() {
			const likeCountElement = document.getElementById("like-count");
			const dislikeCountElement = document.getElementById("dislike-count");
	
			if (!disliked) {
				// 싫어요 활성화
				disliked = true;
				dislikeCountElement.textContent = parseInt(dislikeCountElement.textContent) + 1;
	
				// 만약 좋아요가 활성화된 상태라면, 좋아요를 취소
				if (liked) {
					liked = false;
					likeCountElement.textContent = parseInt(likeCountElement.textContent) - 1;
				}
			} else {
				// 싫어요 취소
				disliked = false;
				dislikeCountElement.textContent = parseInt(dislikeCountElement.textContent) - 1;
			}
		}
		function reportPost() {
			alert("게시글이 신고되었습니다.");
		}
	
		function reportComment() {
			alert("댓글이 신고되었습니다.");
		}
		function scrapPost() {
			alert("게시글이 스크랩되었습니다.");
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/side_left.jsp" />
		</div>
		<div id="post-container">
			<!-- 게시글 제목 및 날짜 -->
			<div id="post-header">
				<div id="post-title">자유게시글 제목</div>
				<div id="post-meta">
					<span>2024.10.05 19:24</span> <span>조회수 24</span>
				</div>
			</div>
	
			<!-- 작성자 정보 -->
			<div id="author-info">
				<div id="author-avatar">
					<img class="profile"
						onerror="this.src='/resources/JSJ/images/no-img.png'"
						src="/resources/JSJ/images/img01.jpg">
				</div>
				<div id="author-name">런너</div>
			</div>
	
			<!-- 게시글 내용 -->
			<div id="post-content">
				<!-- 업로드된 이미지 표시 -->
				<img class="post-image" src="/resources/JSJ/images/img01.jpg" alt="게시글 이미지">
				<img class="post-image" src="/resources/JSJ/images/img01.jpg" alt="게시글 이미지">
				<p>게시글 내용 게시글 내용 게시글 내용 게시글 내용 게시글 내용 게시글 내용</p>
				<p>게시글 내용 게시글 내용 게시글 내용 게시글 내용 게시글 내용 게시글 내용 게시글 내용</p>
			</div>
	
			<!-- 좋아요, 싫어요, 조회수 -->
			<div id="post-actions">
				<span> <i class="like-button" onclick="toggleLike()">👍</i> <span
					id="like-count">24</span>
				</span> <span> <i class="dislike-button" onclick="toggleDislike()">👎</i>
					<span id="dislike-count">7</span>
				</span>
				<button id="scrap-button" onclick="scrapPost()">스크랩</button>
				<button id="report-button" onclick="reportPost()">🛑 신고</button>
			</div>
	
			<!-- 댓글 섹션 -->
			<div id="comment-section">
				<h3>댓글</h3>
				<table>
					<thead>
						<tr>
							<th>닉네임</th>
							<th>댓글 내용</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>런너</td>
							<td>댓글내용 댓글내용 댓글내용</td>
							<td>
								<div class="comment-actions">
									5 <i class="like-button">👍</i>
									<button id="report-button" onclick="reportComment()">🛑
										신고</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>런너</td>
							<td>댓글내용 댓글내용 댓글내용</td>
							<td>
								<div class="comment-actions">
									3 <i class="like-button">👍</i>
									<button id="report-button" onclick="reportComment()">🛑
										신고</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>런너</td>
							<td>댓글내용 댓글내용 댓글내용</td>
							<td>
								<div class="comment-actions">
									0 <i class="like-button">👍</i>
									<button id="report-button" onclick="reportComment()">🛑
										신고</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>런너</td>
							<td>댓글내용 댓글내용 댓글내용</td>
							<td>
								<div class="comment-actions">
									1 <i class="like-button">👍</i>
									<button id="report-button" onclick="reportComment()">🛑
										신고</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
