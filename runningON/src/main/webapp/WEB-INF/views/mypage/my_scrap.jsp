<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 및 게시글 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link href="/resources/KGW/css/thumbs2.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/mypage/mypage_side_left.jsp" />
		</div>
	    <div id="main_page">
    <div class="profile">
    <c:choose>
        <c:when test="${empty my.user_profileImg }">
        	<a href="/my_info">
			<img src="/resources/KGW/images/basic.webp"></a>
        	
        </c:when>
        <c:otherwise>
        	<a href="/my_info">
            <img src="/resources/upload/${my.user_profileImg}" ></a>
        </c:otherwise>
    </c:choose>
   		<div class="profile-info">
           	<h2>${my.user_nickName}</h2>
          		<span>${my.user_id}</span><br>
           	<span>방문 92 · 작성글 3 · 구독멤버 0</span>
       	</div>
    </div>

    <div class="tabs">
        <a href="/my_act">작성글</a>
        <a href="/my_comment">작성댓글</a>
        <a href="#" class="active">스크랩</a>
    </div>
	<form action="/delete_my_scrap" method="post" id="myForm">
    <table>
        <tr>
            <th class="checkbox"><input type="checkbox"  id="selectAll"></th>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회</th>
        </tr>
        <c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="5"><h3>게시물이 존재하지 않습니다.</h3></td></tr>
			</c:when>
		<c:otherwise>
			<c:forEach var="k" items="${list}" varStatus="c">
			<tr>
				<td class="checkbox"><input type="checkbox"  name="post_idx" class="post-item" value="${k.post_idx }"></td>
				<td>${k.post_idx }</td>
				<td ><a href="/detail?post_idx=${k.post_idx}">${k.post_title}</a></td>
				<td>${k.post_created_at}</td>
				<td>${k.post_views}</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
    </table>
    	<div class="action-buttons">
	        <button type="submit" id="delete" disabled>삭제</button>
	    </div>
	</form>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	localStorage.setItem("activeLinkId", "myScrap");
	$(".navL a").removeClass("active");
    $(".ul2").removeClass("active-parent");

    // 클릭한 링크에 active 클래스 추가
    $("#myScrap").addClass("active");

    // 상위 .ul2 요소에 active-parent 클래스 추가
    $("#myScrap").closest(".ul2").addClass("active-parent");
});

document.addEventListener('DOMContentLoaded', ()=>{
	const myform = document.querySelector("#myForm");
	const selectAll = document.querySelector("#selectAll");
	const checkboxs = document.querySelectorAll(".post-item");
	const proceed = document.querySelector("#delete");
	
	// 체크박스 상태 확인 후 버튼 활성화 / 비활성화
	function updateProceed() {
		//                 객체를 배열로 전환          true만 추출
	const anyChecked = Array.from(checkboxs).some(item => item.checked);
		if(anyChecked){
		proceed.classList.remove('disabled');  // 클래스 제거
		proceed.classList.add('enabled');      // 클래스 추가
		proceed.disabled= false ; // 버튼 활성화
		}else{
		proceed.classList.remove('enabled');
		proceed.classList.add('disabled');
		proceed.disabled= true ; // 버튼 비활성화
		}
}
	
	// 전체 선택 체크박스 제어
	selectAll.addEventListener("change", (e)=>{
		checkboxs.forEach(item => item.checked = selectAll.checked);
		updateProceed();
	});
	
	// 개별 체크박스 제어
	checkboxs.forEach(item =>{
		item.addEventListener("change",(e)=>{
			//          객체를 배열로 만든다.       주어진 조건을 만족하는지 확인
			const chk = Array.from(checkboxs).every(item => item.checked);
			selectAll.checked = chk;
			updateProceed();
			
		});
	});
});
</script>
</body>
</html>