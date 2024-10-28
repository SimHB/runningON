<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>모임 생성</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<link rel="stylesheet" href="resources/LHN/css/summernote-lite.css">
	<link rel="stylesheet" href="/resources/LHN/css/groupstart.css">
	<!-- 
		설명:
			onchange="submitForm()": 
			드롭다운에서 선택이 변경될 때 submitForm() 함수를 호출합니다.
			submitForm(): 이 함수는 폼을 자동으로 제출합니다.
			your_action_page.jsp: 폼의 action 속성에 
			원하는 페이지 URL을 넣어야 합니다.
			이렇게 하면 사용자가 드롭다운에서 옵션을 선택할 때마다 
			자동으로 폼이 제출됩니다.
	 -->
	<script>
		function submitForm() {
			document.getElementById("groupForm").submit();
		}
	</script>
</head>
<body>
	<form id="groupForm" method="post" enctype="multipart/form-data" action="/group_board">
		<div>
			<div class="form-container">
				<ul>
					<li class="section-title">모임 이름</li>
					<li><input type="text" name="new_gr_name" class="input-box"
						size="50" placeholder="모임명은 짧을수록 이해하기 쉬워요." required></li>
				</ul>
				<div class="form-group">
					<ul>
						<li class="section-title">모임 대표 사진</li>
						<li><input type="file" name="new_gr_file"></li>
					</ul>
				</div>
			</div>
			<br>
			<div class="group_count">
				<ul>
					<li class="section-title">모임 규모</li>
					<li><select name="new_gr_count" id="select"
						onchange="submitForm()" style="width: 50%;">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
					</select></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="form-group">
			<ul>
				<li class="section-title" style="text-align: left;">모임 소개</li>
				<li><textarea rows="10" style="width: 99%" name="new_gr_into" id="new_gr_content"></textarea></li>
			</ul>
		</div>
		<div class="button-group" style="text-align: center;">
			<input type="submit" value="완료">
			<input type="reset" value="취소">
		</div>
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/LHN/js/summernote-lite.js"></script>
	<script src="resources/LHN/js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#new_gr_content").summernote({
				lang : 'ko-KR',
				height : 300,
				focus : true,
				placeholder : "활동 중심으로 모임을 소개해 주세요. 모임 설정에서 언제든지 바꿀 수 있어요.",
				callbacks : {
					onImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
				}
			});
		});

		function sendImage(file, editor) {
			// FormData 객체를 전송할 때 , jQuery가 설정
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg",
				data : frm,
				method : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					console.log(path, fname);
					$("#gb2_content").summernote("editor.insertImage",
							path + "/" + fname);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
	</script>
</body>
</html>