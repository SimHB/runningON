<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>러닝모임 게시판</title>
		<!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet"> -->
		<link href="/resources/SHB/css/board.css" rel="stylesheet">
	</head>
	<body>
		<div id="board_body">
			<div id="board_header">
				<b id="board_name">러닝모임 게시판</b>
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
						<th class="group_img">대표이미지</th>
						<th class="title">제목</th>
						<th class="user">작성자</th>
						<th class="views">조회수</th>
						<th class="likes">좋아요수</th>
						<th class="regdate">작성일</th>
					</tr>
				</thead>
				<!-- 게시글 데이터 동적처리 DB에서 idx역순으로 불러오기 3 2 1순으로 위에 올라오게 5개만 6이후는 아래에서 페이지 넘기면 -->
				<tbody id="tbody">
					<!-- 예시 -->
					<%-- <c:forEach var="post" items="${posts}">
						<tr>
							<td class="num">${post.id}</td>
							<td class="category">${board.board_name}</td>
							<td class="group_img">대표이미지(그룹에서 이미지 가져오기)</td>
							<td class="title">${post.title}</td>
							<td class="user">${post.username}</td>
							<td class="views">${post.views}</td>
							<td class="likes">${post.likes}</td>
							<td class="regdate">${post.createdAt}</td>
						</tr>
					</c:forEach> --%>
					<tr>
						<td class="num">10</td>
						<td class="category">러닝모임</td>
						<td class="group_img"><img alt="그룹이미지" src="/resources/SHB/images/kitten-1.jpg"></td>
						<td class="title"><a class="post_link" href="/join_main">제목</a></td>
						<td class="user">작성자</td>
						<td class="views">조회수</td>
						<td class="likes">좋아요수</td>
						<td class="regdate">작성일</td>
					</tr>
					<tr>
						<td class="num">9</td>
						<td class="category">러닝모임</td>
						<td class="group_img"><img alt="그룹이미지" src="/resources/SHB/images/kitten-1.jpg"></td>
						<td class="title"><a class="post_link" href="/rungroup">제목</a></td>
						<td class="user">작성자</td>
						<td class="views">조회수</td>
						<td class="likes">좋아요수</td>
						<td class="regdate">작성일</td>
					</tr>
					<tr>
						<td class="num">8</td>
						<td class="category">러닝모임</td>
						<td class="group_img"><img alt="그룹이미지" src="/resources/SHB/images/kitten-1.jpg"></td>
						<td class="title">제목</td>
						<td class="user">작성자</td>
						<td class="views">조회수</td>
						<td class="likes">좋아요수</td>
						<td class="regdate">작성일</td>
					</tr>
					<tr>
						<td class="num">7</td>
						<td class="category">러닝모임</td>
						<td class="group_img"><img alt="그룹이미지" src="/resources/SHB/images/kitten-1.jpg"></td>
						<td class="title">제목</td>
						<td class="user">작성자</td>
						<td class="views">조회수</td>
						<td class="likes">좋아요수</td>
						<td class="regdate">작성일</td>
					</tr>
					<tr>
						<td class="num">6</td>
						<td class="category">러닝모임</td>
						<td class="group_img"><img alt="그룹이미지" src="/resources/SHB/images/kitten-1.jpg"></td>
						<td class="title">제목</td>
						<td class="user">작성자</td>
						<td class="views">조회수</td>
						<td class="likes">좋아요수</td>
						<td class="regdate">작성일</td>
					</tr>
				</tbody>
			</table>
			<div id="footer">
				<div class="sort_box">
					<!-- 게시글 작성버튼 -->
					<a class="board_btn" href="/groupstart">글쓰기</a>
				</div>
				
				<!-- 게시글 페이지 동적처리(해당 게시판의 게시글 페이지 = 게시글 갯수/5 idx순서에 따라 클릭시 idx 5단위로 게시글 변경 -->
				<p id="page">&lt; 1 2 &gt;</p>
			</div>
		</div>
		<script type="text/javascript">
			function newest(){
				
			}
			function popularity(){
				
			}
		
			// ajax를 이용해서 DB정보 가져오기 (첫 접속, 삭제, 삽입)
			function getPost(){
				$.ajax({
					url : "/post_db_list",
					method : "post",
					dataType : "xml",
					success : function(data){
						console.log(data);
						let tbody = "";
						$(data).find("post").each(function(){
							tbody += "<tr>";
							tbody += "<td>" + $(this).find("post_idx").text() + "</td>";
							tbody += "<td>" + $(this).find("board_idx").text() + "</td>";//board_idx의 이름출력
							tbody += "<td>" + $(this).find("group_image").text() + "</td>";//그룹 이미지 출력
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
				});
			};
			
			// getPost();
		</script>
	</body>
</html>