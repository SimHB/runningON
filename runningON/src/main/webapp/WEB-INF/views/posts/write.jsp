<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성 화면</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
		<link rel="stylesheet" href="/resources/JSJ/css/post_write.css">
		<link rel="stylesheet" href="resources/JSJ/css/kakaomap_line.css">
		<link rel="stylesheet" href="resources/JSJ/css/summernote-lite.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/top.jsp" />
		<div id="layout">
			<div id="side_left">
				<jsp:include page="/WEB-INF/views/side_left.jsp" />
			</div>
			<!-- 게시글 작성 페이지 삽입 -->
			<section class="container">
				<form id="post_form" method="POST" encType="multipart/form-data">
					<!-- 제목과 게시판 선택 -->
					<div class="title-and-board">
						<input type="text" id="title" name="post_title" placeholder="제목을 입력해 주세요" required> 
						<select id="board" name="board_idx" required>
							<option value="" disabled selected>게시판을 선택하세요</option>
							<option value="3">자유게시판</option>
							<option value="4">코스추천게시판</option>
							<option value="6">마라톤대회게시판</option>
							<option value="7">플리추천게시판</option>
							<option value="8">러닝용품게시판</option>
							<!-- 다른 게시판 옵션 추가 -->
						</select>				
					</div>
		
					<!-- 본문 입력 -->
					<!-- 카카오맵 미완 -->
					<!-- <div id="map" style="width: 100%; height: 350px;"></div> -->
					<textarea id="mytextarea" name="post_content" required ></textarea>
					
					<!-- 버튼 -->
					<div class="button-container">
						<button type="submit" onclick="write_ok(this.form)">작성 완료</button>
						<!--
							글쓰기 버튼 누르면 load된 페이지 경로(url) 전달받음
							취소 버튼 클릭 시 url로 이동하게 수정
							즉 취소 누를 시 뒤로가기
						-->
						<button type="button" onclick="history.back()">취소</button>
					</div>
				</form>
			</section>
		</div>
		<!-- 카카오맵 미완 -->
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18d67ffd0093a972b35554370188ab50"></script>
		<script src="resources/JSJ/js/kakaomap_line.js"></script> -->
		<script src="resources/JSJ/js/summernote-lite.js"></script>
		<script src="resources/JSJ/js/lang/summernote-ko-KR.js"></script>
		<script>
			// 썸머노트 툴바 수정 버전
			$(function() {
				$("#mytextarea").summernote({
					lang : 'ko-KR',
					height : 300,
					focus : true,
					placeholder : "최대 3000자까지 쓸 수 있습니다.",
					toolbar: [
						['fontname', ['fontname']],
						['fontsize', ['fontsize']],
						['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
						['color', ['forecolor','color']],
						['table', ['table']],
						['para', ['ul', 'ol', 'paragraph']],
						['height', ['height']],
						['insert',['picture','link','video']],
						['view', []]
					],
					fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
					callbacks : {
						onImageUpload : function(files, editor) {
							for (let i = 0; i < files.length; i++) {
								sendImage(files[i], editor);
							}
						}
					}
				});
			});
			
			// 기본 썸머노트
			/* $(function() {
				$("#mytextarea").summernote({
					lang : 'ko-KR',
					height : 300,
					focus : true,
					placeholder : "최대 3000자까지 쓸 수 있습니다.",
					callbacks : {
						onImageUpload : function(files, editor) {
							for (let i = 0; i < files.length; i++) {
								sendImage(files[i], editor);
							}
						}
					}
				});
			}); */
			
	
			function sendImage(file, editor) {
				let data = new FormData();
				data.append("s_file", file);
	
				$.ajax({
					url : '/uploadImage',
					type : 'POST',
					data : data,
					contentType : false,
					processData : false,
					cache : false,
					dataType : "json",
					success : function(data) {
						const path = data.path;
						 const fname = data.fname ;
						 console.log(path, fname);
						 $("#mytextarea").summernote("editor.insertImage", path+"/"+fname);
					},
					error : function() {
						alert("이미지 업로드에 실패했습니다.");
					}
				});
			}
			function write_ok(f) {
				f.action = "/write_ok";
				f.submit();
			}
		</script>
	</body>
</html>