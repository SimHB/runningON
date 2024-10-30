<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet"> -->
		<link href="/resources/SHB/css/board.css" rel="stylesheet">
	</head>
	<body>
		<div id="board_body">
			<div id="board_header">
				<b id="board_name">자유게시판</b> <!-- 동적으로 게시판 이름 출력 -->
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
					<!-- 데이터는 AJAX 요청으로 동적 로딩 -->
				</tbody>
				<!-- 게시글 페이지 동적처리(해당 게시판의 게시글 페이지 = 게시글 갯수/10 idx순서에 따라 클릭시 idx 10단위로 게시글 변경 -->
				<tfoot id="page">
					<tr>
						<td colspan="4">
							<ol class="paging">
								<!-- 페이징 목록은 AJAX 요청으로 동적 로딩 -->
							</ol>
						</td>
						<td>
							<input type="button" value="글쓰기" onclick="bbs_write()" />
						</td>
					</tr>
				</tfoot>
			</table>
			<div id="footer">
				<div class="sort_box">
					<!-- 게시글 작성버튼 -->
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
						data: { cPage: cPage },
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
					let tbody = $("#bbs tbody");
					tbody.empty();
					if (list.length === 0) {
						tbody.append("<tr><td colspan='5'><h3>게시물이 존재하지 않습니다</h3></td></tr>");
					} else {
					list.forEach(function(item) {
						let row = "<tr>" +
							"<td>" + item.b_idx + "</td>";
						
						if (item.active == 1) {
							row += "<td><span style='color: lightgray'>삭제된 게시물 입니다</span></td>";
						} else {
							row += "<td><a href='/bbs_detail?b_idx=" + item.b_idx + "&cPage=" + item.nowPage + "'>" + item.subject + "</a></td>";
						}
						
						row += "<td>" + item.writer + "</td>" +
							"<td>" + item.write_date + "</td>" +
							"<td>" + item.hit + "</td>" +
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
				
				// 글쓰기 버튼 클릭 시 이동 함수
				window.bbs_write = function() {
					location.href = "/bbs_write";
				}
			
			
			});
		</script>
		
		<!--
			success : function(data){
				console.log(data);
				let tbody = "";
				$(data).find("post").each(function(){
					tbody += "<tr>";
					tbody += "<td>" + $(this).find("post_idx").text() + "</td>";
					tbody += "<td>" + $(this).find("board_idx").text() + "</td>";//board_idx의 이름출력
					tbody += "<td>" + $(this).find("post_title").text() + "</td>";
					tbody += "<td>" + $(this).find("user_id").text() + "</td>";//user_id의 닉네임 출력
					tbody += "<td>" + $(this).find("post_views").text() + "</td>";
					tbody += "<td>" + $(this).find("post_").text() + "</td>";// 좋아요 수 외래키 참조
					tbody += "<td>" + $(this).find("post_created_at").text() + "</td>";// 작성일
					tbody += "</tr>";
				});
				$("#tbody").append(tbody);
			},
			error : function(){
				alert("읽기실패");
			}
		-->
		
	</body>
</html>