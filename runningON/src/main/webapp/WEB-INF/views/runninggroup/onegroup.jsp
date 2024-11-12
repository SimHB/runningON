<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>러닝모임 페이지</title>
<link href="/resources/LHN/css/onegroup.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모임 페이지</title>
<!-- 외부 CSS 파일 링크 -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<div id="layout">
		<div id="side_left">
			<jsp:include page="/WEB-INF/views/side_left.jsp" />
		</div>
		<div id="main_page">
			<div class="g_name">
				<h1>우리 러닝은 영원히! 포에버런!</h1>
			</div>
			<br>
			<hr>
			<br>
			<div class="g_gong">
				<p>러닝할때 노래 소리를 크게 틀어놓지 않도록 주의해 주시길 바랍니다.</p>
			</div>
			<hr>
			<div class="content_box">
				<!-- 모임 수다 -->
				<div class="content_sd">
					<h2>모임 수다</h2>
					<table class="content_table">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody id="suda_list">
							<tr>
								<td>1회 러닝</td>
								<td>사용자1</td>
							</tr>
							<tr>
								<td>2회 러닝</td>
								<td>사용자2</td>
							</tr>
							<tr>
								<td>3회 러닝</td>
								<td>관리자</td>
							</tr>
							<tr>
								<td>다음 모임 언제하나요?</td>
								<td>참여자1</td>
							</tr>
							<tr>
								<td>즐거운 시간이었어요!</td>
								<td>참여자2</td>
							</tr>
							<tr>
								<td>즐거운 시간이었어요!</td>
								<td>참여자2</td>
							</tr>
						</tbody>
					</table>
					<div id="t_foot">
							<b>이전</b>
							<b>현재페이지</b>
							<b>다음</b>
					</div>
				</div>
				<!-- 모임 사진 -->
				<div class="photo_section">
					<h2 style="text-align: center; margin: 20px;">모임 사진</h2>
					<hr>
					<div class="photo_table">
						<img alt="그림1" src="/resources/LHN/images/testlogo.png" class="photo1">
						<img alt="그림2" src="/resources/LHN/images/testlogo.png" class="photo2">
						<img alt="그림3" src="/resources/LHN/images/testlogo.png" class="photo3">
						<img alt="그림4" src="/resources/LHN/images/testlogo.png" class="photo4">
						<img alt="그림5" src="/resources/LHN/images/testlogo.png" class="photo5">
						<img alt="그림6" src="/resources/LHN/images/testlogo.png" class="photo6">
						<img alt="그림7" src="/resources/LHN/images/testlogo.png" class="photo7">
						<img alt="그림8" src="/resources/LHN/images/testlogo.png" class="photo8">
						<img alt="그림9" src="/resources/LHN/images/testlogo.png" class="photo9">
					</div>
					
					<div id="p_foot">
							<b>이전</b>
							<b>현재페이지</b>
							<b>다음</b>
					</div>
				</div>
		
				<div class="member">
					<h2>모임 멤버</h2>
					<ul>
						<li>관리자</li>
						<li>러너1</li>
						<li>러너2</li>
						<li>러너3</li>
						<li>러너4</li>
						<li>러너5</li>
						<li>러너6</li>
						<li>러너7</li>
						<li>러너8</li>
						<li>러너9</li>
					</ul>
					
					<div id="m_foot">
							<b>이전</b>
							<b>다음</b>
					</div>
				</div>
			</div>
			<!-- 06. 하단 버튼 -->
			<footer class="footer">
				<button class="action_button" id="j_writer">글쓰기</button>
			</footer>
		</div>
	</div>
	
	<script type="text/javascript">
	      $(document).ready(function() {
		
		let sortOrder = "newest"; // 기본 정렬 기준은 최신순

        // 페이지 로드 시 첫 페이지 데이터 요청
        loadPostList(1, sortOrder);
	      }

		function loadPostList(cPage, sortOrder) {
			$.ajax({
				url: '/posts_ajax',
				type: 'GET',
				data: {
					cPage: cPage,
					board_idx: ${board_t.board_idx},  // data 속성에서 board_idx 가져오기
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
		    // 현재 페이지에서 첫 번째 게시글의 시작 번호 계산
		    // nowPage 값이 1보다 작으면 항상 1로 고정되며, 아니라면 현재 페이지에 맞는 게시글 번호를 계산합니다.
		    let nowPage = ((paging.nowPage - 1) * paging.numPerPage) == 0 ? 1 : (((paging.nowPage - 1) * paging.numPerPage) + 1);

		    // 게시글 번호 설정: 전체 게시물 수에서 현재 페이지 시작 번호를 빼서, 게시글 번호가 최신 순으로 보이도록 함
		    let postNumber = paging.totalRecord - nowPage + 1;

		    // tbody의 내용을 비웁니다. 기존 게시글을 지우고 새로 가져온 게시글로 채우기 위한 준비
		    tbody.empty();

		    // 만약 게시글 목록이 비어 있다면, "게시물이 존재하지 않습니다" 메시지를 표에 표시
		    if (list.length === 0) {
		        tbody.append("<tr><td colspan='8'><h3>게시물이 존재하지 않습니다</h3></td></tr>");
		    } else {
		        // 게시글 목록을 순회하면서 각 게시글을 표 형식으로 추가
		        list.forEach(function(item, index) {
		            // 게시글 번호를 출력하는 첫 번째 열 추가
		            let row = "<tr><td class='num'>" + postNumber-- + "</td>";
		            
		            // 두 번째 열: 게시판 이름 추가
		            row += "<td class='category'>" + boardName + "</td>";
		            
		            // 게시글의 활성화 여부에 따라 비활성화된 게시글은 회색 텍스트로 표시
		            if (item.active == 1) {  // 비활성화된 게시물(삭제된 게시물)을 표시
		                row += "<td><span style='color: lightgray'>삭제된 게시물 입니다</span></td>";
		            } else {
		                // 활성화된 게시물의 경우, 제목을 링크로 제공하여 상세 페이지로 이동할 수 있도록 설정
		                row += "<td class='title'><a class='post_link' href='/detail?post_idx=" + item.post_idx + "&cPage=" + item.nowPage + "'>" + item.post_title + "</a></td>";
		            }

		            // 작성자의 아이디를 표시 (※ 주석에서 언급된 대로 아이디 대신 닉네임으로 변경이 필요할 수 있음)
		            row += "<td class='user'>" + item.user_id + "</td>";

		            // 조회수를 표시하는 열
		            row += "<td class='views'>" + item.post_views + "</td>";

		            // 좋아요 수를 표시하는 열 (조회수와 혼동되어 있는 코드 수정 필요)
		            row += "<td class='likes'>" + item.post_likes + "</td>";

		            // 게시글 작성일 표시하는 열
		            row += "<td class='regdate'>" + item.post_created_at + "</td>";

		            // 한 행의 끝을 마무리
		            row += "</tr>";
		            
		            // tbody에 작성한 행을 추가하여 화면에 표시
		            tbody.append(row);
		        });
		    }
		}
	</script>
</body>
</html>
