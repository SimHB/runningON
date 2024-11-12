<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 편집</title>
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
<link href="/resources/KGW/css/thumbs1.css" rel="stylesheet">

</head>
<body class="body">
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	    <div id="main_page">
			<div class="container">
			  <div class="profile-picture">
			    <div class="title">프로필 사진</div>
			    <c:choose>
			        <c:when test="${empty k.user_profileImg }">
			            <div class="circle">
			                <img id="profileImg" src="/resources/KGW/images/basic.webp">
			            </div>
			            <b>기본이미지</b>
			        </c:when>
			        <c:otherwise>
			            <div class="circle">
			                <a href="#">
			                <img id="profileImg" src="/resources/upload/${k.user_profileImg}" ></a>
			            </div>
			        </c:otherwise>
			    </c:choose>
					<b style="text-align: center;">${k.user_profileImg}</b><br>
			    <div>
			      <button onclick="openFilePicker()">사진변경</button>
			      <button onclick="resetImage()">삭제</button>
			    </div>
			    <div>현재 별명 : <span id="currentNickname">${k.user_nickName}</span></div>
			  </div>
			  <div class="nickname">
			    <div class="title">별명</div>
			    <input type="text" id="nicknameInput" placeholder="별명을 입력하세요">
			    <div>
			      <button onclick="updateNickname()">별명변경</button>
			    </div>
			  </div>
			  <div class="buttons">
			    <button onclick="applyChanges()">적용</button>
			    <a href="/cancel" style="none;">
			    <button>취소</button>
			    </a>
			  </div>
			</div>
		</div>
	</div>
<!-- 숨겨진 파일 입력 -->
<input type="file" id="fileInput" style="display: none;" onchange="displayImagePreview()"/>
<script>
let deleteimage = false;
function openFilePicker() {
    document.getElementById("fileInput").click();
}

function displayImagePreview() {
    var fileInput = document.getElementById("fileInput");
    var file = fileInput.files[0];
    
    if (file) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            // 선택한 이미지를 미리보기로 표시
            document.getElementById("profileImg").src = e.target.result;
        };
        
        reader.readAsDataURL(file);
    }
}

function resetImage() {
    // 기본 이미지를 src로 설정
    document.getElementById("profileImg").src = "/resources/KGW/images/basic.webp";
    // 파일 입력 값도 초기화
    document.getElementById("fileInput").value = null;
    deleteimage = true;
}

function updateNickname() {
    // 별명 입력 필드의 값을 가져옴
    var newNickname = document.getElementById("nicknameInput").value;
    // 입력된 별명을 별명 표시 영역에 반영
    document.getElementById("currentNickname").innerText = newNickname;
    // 입력 필드 초기화
    document.getElementById("nicknameInput").value = "";
}

function applyChanges() {
    var fileInput = document.getElementById("fileInput");
    var newNickname = document.getElementById("currentNickname").innerText;
    var formData = new FormData();
    
    // 이미지 파일이 선택되었는지 확인
    if (fileInput.files[0]) {
        formData.append("profileImage", fileInput.files[0]);
    } else {
        // 파일이 선택되지 않았다면 기본 이미지로 설정하는 것을 추가
        formData.append("profileImage", ""); // 기본 이미지 파일 이름 또는 null로 설정
    }
    
    formData.append("nickname", newNickname);
	formData.append("deleteimage", deleteimage);
    deleteimage = false;
    fetch("/my_info_update", {
        method: "POST",
        body: formData
    }).then(response => {
        // 성공적으로 처리된 후 추가 작업을 할 수 있습니다.
        alert("적용 완료");
        console.log('Changes applied successfully');
    }).catch(error => {
        // 오류가 발생한 경우
        console.error('Error applying changes:', error);
    });
}

</script>
</body>
</html>