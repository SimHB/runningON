<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색 결과</title>
		<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
		<link href="/resources/SHB/css/board.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/top.jsp" />
		<div id="layout">
			<div id="side_left">
				<jsp:include page="/WEB-INF/views/side_left.jsp" />
			</div>
			<div id="board_body" data-board-name="검색 결과">
				<div id="board_header">
					<b id="board_name">검색 결과</b> <!-- 동적으로 게시판 이름 출력 -->
					<div class="sort_box">
						<button class="board_btn" type="button" onclick="newest()">최신순</button>
						<button class="board_btn" type="button" onclick="popularity()">인기순</button>
					</div>
				</div>
				<table>
					<thead>
						<tr id="thead_tr">
							<th class="num">번호</th>
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
				</div>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				let sortOrder = "newest"; // 기본 정렬 기준은 최신순
				let keyword = "${keyword}"; // JSP에서 전달된 keyword 가져오기
				
		        // 페이지 로드 시 첫 페이지 데이터 요청
		        loadPostList(1, sortOrder);

		        // 최신순 버튼 클릭 이벤트
		        window.newest = function() {
		            sortOrder = "newest";
		            loadPostList(1, sortOrder);
		        }

		        // 인기순 버튼 클릭 이벤트
		        window.popularity = function() {
		            sortOrder = "popular";
		            loadPostList(1, sortOrder);
		        }
				
				function loadPostList(cPage, sortOrder) {
					$.ajax({
						url: '/search_ajax',
						type: 'GET',
						data: {
							cPage: cPage,
							keyword: keyword, // 검색 키워드 전달
							sortOrder: sortOrder // 정렬 기준 전달
						},
						dataType: 'json',
						success: function(response) {
							renderTable(response.list, response.paging);
							renderPagination(response.paging);
						},
						error: function(error) {
							console.log("Error:", error);
						}
					});
				}
				
				function renderTable(list, paging) {
					let tbody = $("#board_body tbody");
					let boardName = $("#board_body").data("board-name");
					let user_id = "${uvo.user_id}" || "";
					
					// ((현재페이지 - 1) * 페이지당 들어갈 수 있는 게시글 개수)
					let nowPage = ((paging.nowPage-1)*paging.numPerPage);
					// 게시글 총 개수 - ((현재페이지 - 1) * 페이지당 들어갈 수 있는 게시글 개수)
					// 1페이지 인 경우 : 11 - 0
					// 2페이지 인 경우 : 11 - 5
					// 3페이지 인 경우 : 11 - 10
				    let postNumber = paging.totalRecord - nowPage;
					// 아래 forEach문에서 페이지에 게시글 넣는 작업 동안 postNumber--
					// 1페이지 인 경우 : 11 10 9 8 7
					// 2페이지 인 경우 : 6 5 4 3 2
					// 3페이지 인 경우 : 1
					
					tbody.empty();
					if (list.length === 0) {
						tbody.append("<tr><td colspan='6'><h3>검색 결과가 없습니다.</h3></td></tr>");
					} else {
					list.forEach(function(item, index) {
						let row = "<tr><td class='num'>" + postNumber-- + "</td>";	// 게시글 번호(번호)
						if (item.post_is_public == 0 || item.group_is_public == 0) {	// 삭제된 게시글은 검색해도 표시안함
						} else {
								// 게시글 제목(클릭 시 게시글 내용으로 이동(이동 시 해당 게시글의 idx를 같이 보냄))
								row += "<td class='title'><a class='post_link' href='/detail?post_idx=" + item.post_idx + "&cPage=" + item.nowPage + "'>" + item.post_title + "</a></td>";
						}
							
							row +=	"<td class='user'>" + item.user_id + "</td>" +		// 유저 닉네임
									"<td class='views'>" + item.post_views + "</td>" +		// 게시글 조회수
									"<td class='likes'>" + item.post_likes + "</td>" +		// 게시글 좋아요수
									"<td class='regdate'>" + item.post_created_at + "</td>" +	// 게시글 작성일
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
							loadPostList((paging.beginBlock - paging.pagePerBlock), sortOrder);
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
								loadPostList(k, sortOrder);
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
							loadPostList((paging.beginBlock + paging.pagePerBlock), sortOrder);
						});
						nextItem.append(nextLink);
					}
					pagination.append(nextItem);
				}
			});
			
		</script>
	</body>
</html>