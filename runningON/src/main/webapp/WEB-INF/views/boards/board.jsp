<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${board_name.board_name}</title>
		<!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet"> -->
		<link href="/resources/SHB/css/board.css" rel="stylesheet">
	</head>
	<body>
		<div id="board_body" data-board-name="${board_name.board_name}">
			<div id="board_header">
				<b id="board_name">${board_name.board_name}</b> <!-- 동적으로 게시판 이름 출력 -->
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
				<tbody id="tbody">
					<!-- 데이터는 AJAX 요청으로 동적 로딩 -->
				</tbody>
			</table>
			<div id="footer">
				<ol class="paging">
					<!-- 페이징 목록은 AJAX 요청으로 동적 로딩 -->
				</ol>
				<div class="sort_box">
					<!-- 게시글 작성버튼 board_idx=2 (HOT게시글)인 경우에는 글쓰기 비활성화  -->
					<a class="board_btn" href="/write">글쓰기</a>
				</div>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
				$(document).ready(function() {
				// 페이지 로드 시 첫 페이지 데이터 요청
				loadPostList(1);
				
				function loadPostList(cPage) {
					$.ajax({
						url: '/posts_ajax',
						type: 'GET',
						data: {
							cPage: cPage,
							board_idx: $("#board_body").data("board-name")  // data 속성에서 board_idx 가져오기
						},
						dataType: 'json',
						success: function(response) {
							renderTable(response.list);
							renderPagination(response.paging);
						},
						error: function(error) {
							console.log("Error:", error);
						}
					});
				}
				
				function renderTable(list) {
					let tbody = $("#board_body tbody");
					let boardName = $("#board_body").data("board-name");
					tbody.empty();
					if (list.length === 0) {
						tbody.append("<tr><td colspan='8'><h3>게시물이 존재하지 않습니다</h3></td></tr>");
					} else {
					list.forEach(function(item) {
						let row = "<tr><td>" + item.post_idx + "</td>";
							row += "<td>" + boardName + "</td>";
						if (item.active == 1) {
							row += "<td><span style='color: lightgray'>삭제된 게시물 입니다</span></td>";
						} else {
							row += "<td><a href='/detail?post_idx=" + item.post_idx + "&cPage=" + item.nowPage + "'>" + item.post_title + "</a></td>";
						}
						
						row +=	"<td>" + item.user_id + "</td>" +
								"<td>" + item.post_views + "</td>" +
								"<td>" + item.post_views + "</td>" +
								"<td>" + item.post_created_at + "</td>" +
								"</tr>";
						
						tbody.append(row);
						});
					}
				}
				
				function renderPagination(paging) {
					let pagination = $("ol.paging");
					pagination.empty();
					// 이전 버튼
					let prevItem = $("<li>");
					if (paging.beginBlock <= paging.pagePerBlock) {
						// 비활성화 상태
						prevItem.addClass("disable").text("이전으로");
					} else {
						// 활성화 상태
						let prevLink = $("<a>").attr("href", "#").text("이전으로");
						prevLink.on("click", function (e) {
							e.preventDefault();
							loadPostList(paging.beginBlock - paging.pagePerBlock);
						});
						prevItem.append(prevLink);
					}
					pagination.append(prevItem);
				
					// 페이지 번호
					for (let k = paging.beginBlock; k <= paging.endBlock; k++) {
						let pageItem = $("<li>");
						
						if (k === paging.nowPage) {
							// 현재 페이지 (링크 없이 표시)
							pageItem.addClass("now").text(k);
						} else {
							// 다른 페이지 (링크 추가)
							let pageLink = $("<a>").attr("href", "#").text(k);
							pageLink.on("click", function (e) {
								e.preventDefault();
								loadPostList(k);
							});
							pageItem.append(pageLink);
						}
						
						pagination.append(pageItem);
					}
				
				 // 다음 버튼
					let nextItem = $("<li>");
					if (paging.endBlock >= paging.totalPage) {
						// 비활성화 상태
						nextItem.addClass("disable").text("다음으로");
					} else {
						// 활성화 상태
						let nextLink = $("<a>").attr("href", "#").text("다음으로");
						nextLink.on("click", function (e) {
							e.preventDefault();
							loadPostList(paging.beginBlock + paging.pagePerBlock);
						});
						nextItem.append(nextLink);
					}
					pagination.append(nextItem);
				}
			
			
			});
		</script>
	</body>
</html>