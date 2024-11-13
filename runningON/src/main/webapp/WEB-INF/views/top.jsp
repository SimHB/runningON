<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RunningON</title>
		<link href="/resources/SHB/css/top.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<%
		    String loginchk = (String) session.getAttribute("loginchk");
			Integer msg = (Integer) session.getAttribute("msg");
		%>
		<script>
		    $(document).ready(function() {
		        var loginchk = "<%= loginchk %>";
		        var msg = <%= msg != null ? msg : 0 %>; // msg가 null일 때 0으로 기본값 설정
		
		        if (loginchk === "ok" && msg > 0) {
		            $(".note-num").show();
		        } else {
		            $(".note-num").hide();
		        }
		    });
		    
		 	function dynamic_go(f) {
				f.action = "/emp_dynamic_search";
				f.submit();	
			} 
		</script>
	</head>
	<body>
		<div id="navbox">
			<header class="navbar">
				<div class="navbar_logo">
					<a class="index_a" href="/home"><img alt="로고" src="resources/KGW/images/logowhite.png"></a>
				</div>
		
				<!-- 검색창 -->
				<form method="post" onsubmit="dynamic_go(this); return false;">
					<input class="search_space" type="text" name="keyword" placeholder="검색" autofocus>
					<input class="search_button" type="button"  onclick="dynamic_go(this.form)">
				</form>
		
				<ul class="navbar_link">
					<c:choose>
						<c:when test="${loginchk == 'ok' }">
							<li><a class="index_a" href="/logout_logout">로그아웃</a></li>
							<li><a id="MY" class="index_a" href="/mypage">MY<span class="note-num"><%= msg %></span></a></li>
						
						</c:when>
						<c:otherwise>
							<li><a class="index_a" href="/loginForm">로그인</a></li>
						
						</c:otherwise>
					</c:choose>
				</ul>
			</header>
			
			<nav class="navbar_bottom">
				<div class="navbar_blank">
					<!-- 메뉴를 중간으로 두기위해.. -->
				</div>
		
				<ul class="navbar_search">
					<li><a class="index_a" href="/board?board_idx=2">HOT</a></li>
					<li><a class="index_a" href="/board?board_idx=3">자유</a></li>
					<li><a class="index_a" href="/board?board_idx=4">코스추천</a></li>
					<li><a class="index_a" href="/board?board_idx=5">러닝모임</a></li>
					<li><a class="index_a" href="/board?board_idx=6">마라톤 대회</a></li>
					<li><a class="index_a" href="/board?board_idx=7">플리추천</a></li>
					<li><a class="index_a" href="/board?board_idx=8">러닝용품</a></li>
				</ul>
				<div class="navbar_blank">
					<!-- 메뉴를 중간으로 두기위해.. -->
				</div>
			</nav>
		</div>
	</body>
</html>
