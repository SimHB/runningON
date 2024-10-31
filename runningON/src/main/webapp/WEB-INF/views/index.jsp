<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RunningON</title>
		<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
		<link href="/resources/SHB/css/index.css" rel="stylesheet">
		<link href="/resources/SHB/css/board.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<div id="navbox">
			<header class="navbar">
				<div class="navbar_logo">
					<a class="index_a" href="/home"> RUNNINGON </a>
					<a class="index_a" href="/main"> 관리자페이지 </a>
				</div>
		
				<!-- 검색창 -->
				<input type="text" placeholder="검색" autofocus>
		
				<ul class="navbar_link">
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
		
		<div id="content">
			<section class="daily_weather">
				<h2><a href="/weather">날씨</a></h2>
				<p>날씨 정보..</p>
				<p>날씨 정보..</p>
				<p>날씨 정보..</p>
				<p>날씨 정보..</p>
			</section>
		
			<div id="loadPage">
				<section id="mainPage">
					<!-- navbar_link 에서 게시판 클릭시 오른쪽 아래 화면에 해당 게시판 나오게하기 -->
					<!-- 게시판 파일(jsp 파일) 불러오는 공간, 처음엔 공지사항 화면 -->
					<div id="board_body">
						<div id="board_header">
							<b id="board_name">공지사항</b> <!-- 동적으로 게시판 이름 출력 -->
							<%-- <h2>${board.board_name}</h2> <!-- 동적으로 게시판 이름 출력 --> --%>
							<div class="sort_box">
								<button class="board_btn" type="button" onclick="newest">최신순</button>
								<button class="board_btn" type="button" onclick="popularity">인기순</button>
							</div>
						</div>
						<table>
							<thead>
								<tr id="thead_tr">
									<th class="num">번호</th>
									<th class="category">카테고리</th>
									<th class="title">제목</th>
									<th class="user">작성자</th>
									<th class="views">조회수</th>
									<th class="likes">좋아요수</th>
									<th class="regdate">작성일</th>
								</tr>
							</thead>
							<!-- 게시글 데이터 동적처리 DB에서 idx역순으로 불러오기 3 2 1순으로 위에 올라오게 10개만 11이후는 아래에서 페이지 넘기면 -->
							<tbody id="tbody">
								<!-- 예시 -->
								<%-- <c:forEach var="post" items="${posts}">
									<tr>
										<td class="num">${post.id}</td>
										<td class="category">${board.board_name}</td>
										<td class="title">${post.title}</td>
										<td class="user">${post.username}</td>
										<td class="views">${post.views}</td>
										<td class="likes">${post.likes}</td>
										<td class="regdate">${post.createdAt}</td>
									</tr>
								</c:forEach> --%>
								<tr>
									<td class="num">10</td>
									<td class="category">공지</td>
									<td class="title"><a class="post_link" href="/detail">제목</a></td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">9</td>
									<td class="category">공지</td>
									<td class="title"><a class="post_link" href="/detail">제목</a></td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">8</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">7</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">6</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">5</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">4</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">3</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">2</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
								<tr>
									<td class="num">1</td>
									<td class="category">공지</td>
									<td class="title">제목</td>
									<td class="user">작성자</td>
									<td class="views">조회수</td>
									<td class="likes">좋아요수</td>
									<td class="regdate">작성일</td>
								</tr>
							</tbody>
						</table>
						<div id="footer">
							<!-- 게시글 페이지 동적처리(해당 게시판의 게시글 페이지 = 게시글 갯수/10 idx순서에 따라 클릭시 idx 10단위로 게시글 변경 -->
							<p id="page">&lt; 1 2 3 &gt;</p>
						</div>
					</div>
				</section>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			function loadContent(url) {
		        $("#loadPage").load(url); // 콘텐츠 로드
		        history.pushState({ url: url }, '', url); // 히스토리에 상태 저장
		    }
			
			$("a").on("click", function(e) {
				var url = $(this).attr("href"); // 클릭된 링크의 href 값 가져오기
				
				if(url !== "/home" && url !== "/main" && url !== "/login1" && url !== "/mypage"){
					e.preventDefault(); // 기본 링크 이동 동작 막기
					$("#loadPage").load(url);
				//	loadContent(url);
				}
			});

			$(document).on("click", "a",function(e) {
				var url = $(this).attr("href"); // 클릭된 링크의 href 값 가져오기
				
				if(url !== "/home" && url !== "/main" && url !== "/login1" && url !== "/mypage"){
					e.preventDefault(); // 기본 링크 이동 동작 막기
					$("#loadPage").load(url);
				//	loadContent(url);
				}
			});

			$(document).on("submit", "form", function(e) {
				var url = $(this).find("input[type='submit']").data("url" && url !== "/mypage"); // 클릭된 링크의 href 값 가져오기
				
				e.preventDefault(); // 기본 링크 이동 동작 막기
				$("#loadPage").load(url);
			//	loadContent(url);
			}); 
			
			
			
			// popstate 이벤트: 뒤로 가기/앞으로 가기 클릭 시 발생
		    $(window).on("popstate", function(e) {
		        var state = e.originalEvent.state;
		        if (state) {
		            $("#loadPage").load(state.url); // 저장된 URL로 콘텐츠 로드
		        }
		    });
			
		});
		
	</script>
</html>













