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
	</head>
	<body>
		<div id="navbox">
			<header class="navbar">
				<div class="navbar_logo">
					<a class="index_a" href="/home"><img alt="로고" src="resources/KGW/images/logowhite.png"></a>
				</div>
		
				<!-- 검색창 -->
				<input type="text" placeholder="검색" autofocus>
		
				<ul class="navbar_link">
					<li><a class="index_a" href="/main"> 관리자페이지 </a></li>
					<li><a class="index_a" href="/login1">로그인</a></li>
					<li><a class="index_a" href="/mypage">MY</a></li>
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
