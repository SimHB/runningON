<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 및 게시글 목록</title>
<link href="/resources/kgw/css/thumbs2.css" rel="stylesheet">
</head>
<body>

    <div class="profile">
        <img src="https://via.placeholder.com/80" alt="프로필 이미지">
        <div class="profile-info">
            <h2>닉네임</h2>
            <span>카페 멤버 아이디</span><br>
            <span>방문 92 · 작성글 3 · 구독멤버 0</span>
        </div>
    </div>

    <div class="tabs">
        <a href="#" class="active">작성글</a>
        <a href="/view3">작성댓글</a>
        <a href="/view4">스크랩</a>
    </div>

    <table>
        <tr>
            <th class="checkbox"><input type="checkbox"></th>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회</th>
        </tr>
        <tr>
            <td class="checkbox"><input type="checkbox"></td>
            <td>19350</td>
            <td>작성글 제목 <span class="comment-count">[8]</span> 작성글의 댓글 수 표시</td>
            <td>2024.04.17.</td>
            <td>148</td>
        </tr>
        <tr>
            <td class="checkbox"><input type="checkbox"></td>
            <td>18465</td>
            <td>작성글 제목 <span class="image-count">[9]</span> 이미지가 있을 경우 이미지 표시</td>
            <td>2024.04.16.</td>
            <td>769</td>
        </tr>
        <tr>
            <td class="checkbox"><input type="checkbox"></td>
            <td>18423</td>
            <td>작성글 제목 <span class="gray-icon"></span></td>
            <td>2024.04.16.</td>
            <td>206</td>
        </tr>
    </table>

    <div class="action-buttons">
        <button>삭제</button>
        <button class="write-button">글쓰기</button>
    </div>

</body>
</html>