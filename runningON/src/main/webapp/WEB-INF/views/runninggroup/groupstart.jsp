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

</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/side_left.jsp" />
		</div>
		<div id="main_page">
			<form  id="groupForm" method="post" enctype="multipart/form-data">
				<div>
					<div class="form-container">
						<ul>
							<li class="section-title">모임 이름</li>
							<li><input type="text" name="group_title" class="input-box"
								size="50" placeholder="모임명은 짧을수록 이해하기 쉬워요." required></li>
						</ul>
						<div class="form-group">
							<ul>
								<li class="section-title">모임 대표 사진</li>
								<li><input type="file" name="file_name"></li>
							</ul>
						</div>
					</div>
					<br>
					<div class="group_count">
						<ul>
							<li class="section-title">모임 규모</li>
							<li><select name="group_maxCount" id="select" style="width: 50%;">
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
					</ul>
						<textarea id="new_gr_content" rows="10" style="width: 99%" name="group_des" ></textarea>
				</div>
				<div class="button-group" style="text-align: center;">
				    <input type="hidden" name="cPage" value="${cPage }" >
					<input type="button" value="완료" id="join_ok" onclick="group_start_ok(this.form)"> 
					<input type="button" value="취소" id="join_no" onclick="group_list_go(this.form)">
				</div>
			</form>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
<script src="resources/LHN/js/summernote-lite.js" ></script>
<script src="resources/LHN/js/lang/summernote-ko-KR.js" ></script>
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
		 const fname = data.fname ;
		 console.log(path, fname);
		 $("#new_gr_content").summernote("editor.insertImage", path+"/"+fname);
	  },
	  error : function() {
		alert("읽기실패");
	}
  });
}
</script>
<script type="text/javascript">
  function group_start_ok(f) {
	  
	f.action = "/group_start_ok";
	f.submit();
}
  
  function group_list_go(f) {
		f.action = "/group_list_go";
		f.submit();
	}
</script>
</body>
</html>
