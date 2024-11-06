<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			    <div class="circle"></div>
			    <div>
			      <button>사진변경</button>
			      <button>삭제</button>
			    </div>
			  </div>
			  <div class="nickname">
			    <div class="title">별명</div>
			    <input type="text" placeholder="별명을 입력하세요">
			  </div>
			  <div class="buttons">
			    <button>적용</button>
			    <button>취소</button>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>