<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성 화면</title>
		<link rel="stylesheet" href="resources/JSJ/css/summernote-lite.css">
		<link href="/resources/JSJ/css/post_write.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="resources/JSJ/js/summernote-lite.js"></script>
		<script src="resources/JSJ/js/lang/summernote-ko-KR.js"></script>
	</head>
	<body>
		<!-- 게시글 작성 페이지 삽입 -->
		<section class="container">
			<form id="post_form" action="/" method="POST" enctype="multipart/form-data">
				<!-- 제목과 게시판 선택 -->
				<div class="title-and-board">
					<input type="text" id="title" name="title" placeholder="제목을 입력해 주세요"
						required> <select id="board" name="board" required>
						<option value="" disabled selected>게시판을 선택하세요</option>
						<option value="free">자유게시판</option>
						<option value="course">코스추천게시판</option>
						<option value="running_meetup">러닝모임게시판</option>
						<option value="marathon">마라톤대회게시판</option>
						<option value="playlist">플리추천게시판</option>
						<option value="running_gear">러닝용품게시판</option>
						<!-- 다른 게시판 옵션 추가 -->
					</select>
				</div>
	
				<!-- 본문 입력 -->
				<textarea id="mytextarea" name="content" required ></textarea>
	
				<!-- 버튼 -->
				<div class="button-container">
					<button type="submit">작성 완료</button>
					<!--
						글쓰기 버튼 누르면 load된 페이지 경로(url) 전달받음
						취소 버튼 클릭 시 url로 이동하게 수정
						즉 취소 누를 시 뒤로가기
					-->
					<button type="button" onclick="location.href='url">취소</button>
				</div>
			</form>
		</section>
	
		<script>
			$(function() {
				$("#mytextarea").summernote({
					lang : 'ko-KR',
					height : 300,
					focus : true,
					placeholder : "최대 3000자까지 쓸 수 있습니다.",
					callbacks : {
						onImageUpload : function(files) {
							for (let i = 0; i < files.length; i++) {
								sendImage(files[i]);
							}
						}
					}
				});
			});
	
			function sendImage(file) {
				let data = new FormData();
				data.append("file", file);
	
				$.ajax({
					url : '/uploadImage',
					type : 'POST',
					data : data,
					contentType : false,
					processData : false,
					success : function(url) {
						$('#mytextarea').summernote('insertImage', url,
								function($image) {
									$image.attr('alt', 'Uploaded Image');
								});
					},
					error : function() {
						alert("이미지 업로드에 실패했습니다.");
					}
				});
			}
		</script>
	</body>
</html>