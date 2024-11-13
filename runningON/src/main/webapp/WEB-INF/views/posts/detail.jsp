<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
		function updateClike(comment_idx) {
		    // FormData 객체 생성
		    let formData = new FormData();
		    formData.append("comment_idx", comment_idx);

		    // fetch 요청에 FormData 객체 사용
		    fetch('/comment_like', {
		        method: 'POST',
		        body: formData // body에 FormData 객체를 넣어 보내기
		    })
		    .catch(error => console.error('Error:', error));
			setTimeout(function() {
			    window.location.href = '${delayedRedirect}';
			}, 500);  // 딜레이 1초
		}
		function updatePlike(post_idx) {
		    // FormData 객체 생성
		    let formData = new FormData();
		    formData.append("post_idx", post_idx);

		    // fetch 요청에 FormData 객체 사용
		    fetch('/post_like', {
		        method: 'POST',
		        body: formData // body에 FormData 객체를 넣어 보내기
		    })
		    .catch(error => console.error('Error:', error));
			setTimeout(function() {
			    window.location.href = '${delayedRedirect}';
			}, 500);  // 딜레이 1초
		}
		function updatePdislike(post_idx) {
		    // FormData 객체 생성
		    let formData = new FormData();
		    formData.append("post_idx", post_idx);

		    // fetch 요청에 FormData 객체 사용
		    fetch('/post_dislike', {
		        method: 'POST',
		        body: formData // body에 FormData 객체를 넣어 보내기
		    })
		    .catch(error => console.error('Error:', error));
			setTimeout(function() {
			    window.location.href = '${delayedRedirect}';
			}, 500);  // 딜레이 1초
		}
	
		function scrapPost(post_idx) {
			// FormData 객체 생성
		    let formData = new FormData();
		    formData.append("post_idx", post_idx);

		    // fetch 요청에 FormData 객체 사용
		    fetch('/post_scrap', {
		        method: 'POST',
		        body: formData // body에 FormData 객체를 넣어 보내기
		    })
		    .catch(error => console.error('Error:', error));
			alert("게시글이 스크랩되었습니다.");
		}
		function reportPost(post_idx) {
			// FormData 객체 생성
		    let formData = new FormData();
		    formData.append("post_idx", post_idx);
			alert("게시글이 신고 되었습니다.")
		    // fetch 요청에 FormData 객체 사용
		    fetch('/post_report', {
		        method: 'POST',
		        body: formData // body에 FormData 객체를 넣어 보내기
		    })
		    .catch(error => console.error('Error:', error));
		    
		}
		function reportComment(comment_idx) {
			// FormData 객체 생성
		    let formData = new FormData();
		    formData.append("comment_idx", comment_idx);
		    alert("댓글이 신고 되었습니다.")
		    // fetch 요청에 FormData 객체 사용
		    fetch('/comment_report', {
		        method: 'POST',
		        body: formData // body에 FormData 객체를 넣어 보내기
		    })
		    .catch(error => console.error('Error:', error));
		    
		}
		function upd(f) {
			f.action = "/update";
			f.submit();
		}
		function del(f) {
			f.action = "/delete";
			f.submit();	
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
			<div id="post-title">${pvo.post_title}</div>
			<div id="post-meta">
				<span>${pvo.post_created_at}</span> <span>조회수 </span><span>${pvo.post_views}</span>
			</div>
		</div>

		<!-- 작성자 정보 및 수정 삭제-->
		<div id="author-info">
			<a id="author-avatar" href="/mypage">
				<img class="profile"
					onerror="this.src='/resources/KGW/images/basic.webp'"
					src="/resources/upload/${uvo.user_profileImg}">
			</a>
			<a id="author-name" href="/mypage">${pvo.user_id}</a>
			<div id="update-delete">
			<form method="post">			
				<c:choose>
		            <c:when test="${pvo.user_id == uvo.user_id}">
		           		<input type="hidden" name="post_idx" value="${pvo.post_idx}">
		           		<input type="hidden" name="board_idx" value="${pvo.board_idx}">
					    <input type="hidden" name="cPage" value="${cPage}">
						<input type="button" value="수정" onclick="upd(this.form)">
						<input type="button" value="삭제" onclick="del(this.form)">
		            </c:when>
	            </c:choose>
			</form>
			</div>
		</div>

		<!-- 게시글 내용 -->
		<div id="post-content">
			<!-- 업로드된 이미지 표시 -->
			<div>${pvo.post_content}</div>
		</div>

		<!-- 좋아요, 싫어요, 조회수 -->
		<div id="post-actions">
			<span> 
				<i class="like-button" onclick="updatePlike(${pvo.post_idx})">👍</i>
				<span id="like-count-${pvo.post_idx}" class="like-count">${pvo.post_likes}</span>
			</span>
			<span> 
				<i class="dislike-button" onclick="updatePdislike(${pvo.post_idx})">👎</i>
				<span id="dislike-count-${pvo.post_idx}" class="dislike-count">${pvo.post_dislikes}</span>
			</span>
			<button id="scrap-button" onclick="scrapPost(${pvo.post_idx})">스크랩</button>
			<button id="report-button" onclick="reportPost(${pvo.post_idx})">🛑 신고</button>
		</div>
		
		<%-- 댓글 입력 창 --%>
		<div style="padding: 10px; width: 90%; margin: 0 auto">
			<form action="/comment_insert" method="post">
				<fieldset class="comment_fieldset">
					<h2>댓글 쓰기</h2>
					<textarea style="width: 80%;" name="comment_content"></textarea>
					<%-- 댓글 저장시 어떤 원글의 댓글인지 저장해야 한다. --%>
					<input type="hidden" name="post_idx" value="${pvo.post_idx}">
					<input type="hidden" name="cPage" value="${cPage}">
					<input type="submit" value="댓글저장">
				</fieldset>
			</form>
		</div>
		<!-- 댓글 섹션 -->
		<div id="comment-section">
			<h3>댓글</h3>
			<%-- 댓글 출력 창 --%>
			<div style="display: table; margin: 0 auto;">
				<c:forEach var="k" items="${clist}">
					<div class="comment-box">
						<form action="/comment_delete" method="post">
							<div class = "comment-header">
							<span>${k.user_id}</span> 
							<span>${k.comment_created_at}</span>
							</div>
							<p class="comment-content">${k.comment_content} 
								<span class="comment-actions"> 
									<i class="like-button" onclick="updateClike(${k.comment_idx})">👍</i>
									<span id="like-count-${k.comment_idx}" class="like-count">${k.likeCount}</span>
									<button type="button" class="report-button" style="margin: 0 20px" onclick="reportComment(${k.comment_idx})">신고</button>
									<c:if test="${uvo.user_id == k.user_id}">
										<input type="submit" value="댓글삭제" class="delete-button">
									</c:if>
								</span>
							</p>
							

							<%-- 실제는 로그인 성공후  관리자이거나 글쓴 본인 경우만 삭제가능--%>
							<%-- 컨틀로러가서 DB 삭제후 다시 이곳으로 와야 한다.(나중에 ajax로 변경하자)  --%>
							<input type="hidden" name="comment_idx" value="${k.comment_idx}">
							<input type="hidden" name="post_idx" value="${k.post_idx}">
							<input type="hidden" name="cPage" value="${cPage}">
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>
