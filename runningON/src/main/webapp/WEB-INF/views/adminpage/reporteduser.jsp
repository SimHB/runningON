<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저제재내역 조회</title>
    <link rel="stylesheet" href="testweb.css" />
    <style>
        /* 기본적인 스타일링 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* a 태그 스타일 */
        a {
            text-decoration: none;
            padding: 16px 50px;
            display: block;
        }

        a:hover {
            font-size: 16px;
            background-color: black;
            color: white;
        }

        /* 전체 레이아웃 설정 */
        body {
            display: flex;
            min-height: 100vh;
            overflow: hidden; /* 화면 크기를 벗어나지 않도록 설정 */
        }

        /* 헤더 스타일 */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: gray;
            padding: 10px 20px;
            z-index: 1000; /* 좌측 메뉴와 겹치지 않도록 */
        }

        .navbar a {
            color: white;
        }

        .navbar_logo img {
            width: 150px;
        }

        .navbar_link {
            list-style: none;
        }

        .navbar_link li {
            display: inline-block;
        }

        /* 좌측 메뉴 고정 및 스타일 */
        .wrap {
            position: fixed; /* 항상 좌측에 고정 */
            top: 94px; /* 헤더 아래로 배치하여 간격을 추가 */
            left: 0;
            width: 250px;
            height: calc(100vh - 80px); /* 헤더를 제외한 화면 높이 */
            background-color: #f0f0f0;
            padding-top: 20px;
            overflow-y: auto; /* 메뉴가 많을 경우 스크롤 */
        }

        .list_box {
            margin-bottom: 0px; /* 리스트 박스 간의 간격 */
        }

        .list_box .inner_area {
            display: none; /* 기본적으로 숨겨져 있는 내부 메뉴 */
        }

        .list_box .toggle_btn.on + .inner_area {
            display: block; /* 토글 버튼이 활성화되면 내부 메뉴 표시 */
        }

        /* 화살표 아이콘 스타일 */
        .list_box .toggle_btn::after {
            content: '';
            width: 10px;
            height: 10px;
            border-top: 2px solid #666;
            border-right: 2px solid #666;
            display: inline-block;
            transform: rotate(135deg);
            position: absolute;
            right: 30px;
            bottom: 27px;
        }

        .list_box .toggle_btn.on::after {
            transform: rotate(315deg); /* 활성화 시 화살표 방향 변경 */
            bottom: 22px;
        }

        /* 토글 버튼 스타일 */
        .toggle_btn {
            background-color: gray;
            color: white;
            border: none;
            box-sizing: border-box;
            padding: 10px 30px; /* 버튼 내부 여백 */
            font-size: 15px;
            font-weight: bold;
            width: 100%;
            position: relative;
            cursor: pointer; /* 마우스 포인터 모양 변경 */
        }

        .toggle_btn:hover {
            background-color: black; /* 마우스 오버 시 배경색 변경 */
        }

        /* 내부 메뉴 버튼 스타일 */
        .m_btn1 {
            background-color: skyblue;
            color: white;
            border: none;
            padding: 10px 30px; /* 버튼 내부 여백 */
            font-size: 15px;
            font-weight: bold;
            width: 100%;
            height: 40px; /* 버튼 높이 */
            margin: 0px 0; /* 버튼 간의 간격 */
        }

        .m_btn1:hover {
            background-color: red; /* 마우스 오버 시 배경색 변경 */
        }

        /* 중앙 본문 영역 */
        .container {
            margin-left: 250px; /* 좌측 메뉴 너비만큼 오른쪽으로 밀림 */
            padding: 20px;
            flex: 1;
            height: calc(100vh - 94px); /* 헤더를 제외한 높이 */
            background-color: white; /* 흰색 배경으로 통일 */
            display: flex;
            justify-content: center;
            align-items: center; /* 중앙 정렬 */
            flex-direction: column; /* 세로 방향으로 정렬 */
        }

        .box {
            width: 80%;
            max-width: 1200px;
            min-width: 600px;
            background-color: white; /* 박스 내부 흰색 */
            padding: 20px;
            text-align: left; /* 텍스트 왼쪽 정렬 */
            border: 1px solid #ccc; /* 박스 테두리 */
        }

        /* 표 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse; /* 테이블 경계선 겹침 방지 */
        }

        .table th, .table td {
            padding: 10px; /* 셀 내부 여백 */
            border: 1px solid #ccc; /* 셀 경계선 */
            text-align: left; /* 셀 내용 왼쪽 정렬 */
        }

        .table th {
            background-color: #f9f9f9; /* 헤더 셀 배경색 */
        }

        /* 검색 박스 스타일 */
        .search-container {
            display: flex;
            justify-content: flex-end; /* 오른쪽 정렬 */
            margin-bottom: 10px; /* 표와의 간격 */
        }

        .search-input {
            width: calc(80% - 100px); /* 검색 입력 크기 조정 */
            padding: 10px;
            border: 1px solid #ccc; /* 테두리 */
            border-radius: 4px; /* 모서리 둥글게 */
            font-size: 14px;
        }

        .search-button {
            padding: 10px 20px;
            background-color: gray; /* 버튼 색상 */
            color: white; /* 글자 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 4px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
            font-size: 14px;
            margin-left: 10px; /* 입력창과 버튼 간의 간격 */
        }

        .search-button:hover {
            background-color: black; /* 마우스 오버 시 배경색 변경 */
        }

        /* 페이지 번호 스타일 */
        .pagination {
            margin-top: 20px; /* 테이블과의 간격 */
            display: flex;
            justify-content: center; /* 중앙 정렬 */
        }

        .pagination span {
            margin: 0 5px; /* 페이지 번호 간의 간격 */
            font-size: 16px;
        }

        .pagination button {
            background-color: gray;
            color: white;
            border: none;
            padding: 5px 10px; /* 버튼 내부 여백 */
            cursor: pointer; /* 커서 모양 변경 */
        }

        .pagination button:hover {
            background-color: black; /* 마우스 오버 시 배경색 변경 */
        }
    </style>
</head>
<body>

    <!-- 최상단 헤더 -->
    <header class="navbar">
        <div class="navbar_logo">
            <a href="http://localhost:8080/main"><img src="/resources/MJS/images/logow.png" alt="로고"></a>
        </div>
        <div class="navbar_blank"></div>
        <ul class="navbar_link">
            <li><a href="http://localhost:8080">로그아웃</a></li> <!-- 로그아웃 링크 -->
        </ul>
    </header>

    <!-- 좌측 메뉴 -->
    <div class="wrap">
        <!-- 공지사항 메뉴 -->
        <div class="list_box">
            <button type="button" class="toggle_btn" onClick="location.href='/announcement'">공지사항</button>
        </div>
        <!-- 유저정보 메뉴 및 서브 메뉴 -->
        <div class="list_box">
            <button type="button" class="toggle_btn">유저정보</button>
            <div class="inner_area">
                <ul>
                    <li><button class="m_btn1" onClick="location.href='/userlist'">유저목록</button></li>
                    <li><button class="m_btn1" onClick="location.href='/usercomment'">댓글정보</button></li>
                    <li><button class="m_btn1" onClick="location.href='/userboard'">게시물</button></li>
                    <li><button class="m_btn1" onClick="location.href='/test'">TEST</button></li>
                </ul>
            </div>
        </div>
        <!-- 신고정보 메뉴 및 서브 메뉴 -->
        <div class="list_box">
            <button type="button" class="toggle_btn" onClick="location.href='#'">신고정보</button>
            <div class="inner_area">
                <ul>
                    <li><button class="m_btn1" onClick="location.href='/reportedcomment'">신고유저</button></li>
                    <li><button class="m_btn1" onClick="location.href='/reportedboard'">게시물</button></li>
                    <li><button class="m_btn1" onClick="location.href='/reporteduser'">유저제재내역</button></li>
                    <li><button class="m_btn1" onClick="location.href='#'">고객센터</button></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 중앙 본문 -->
    <div class="container">
        <div class="box">
            <div class="search-container">
                <input type="text" class="search-input" placeholder="검색..." />
                <button class="search-button">검색</button>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>닉네임</th>
                        <th>제재내역</th>
                        <th>제재사유</th>
                        <th>일자</th>
                        <th>담당자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr onclick="location.href='/user_information';" style="cursor: pointer;">
                        <td>1</td>
                        <td>런닝맨99</td>
                        <td>영구활동정지</td>
                        <td>허위사실 및 비방목적 댓글</td>
                        <td>20XX. X. X</td>
                        <td>관리자1</td>
                    </tr>
                </tbody>
            </table>

            <!-- 페이지 네비게이션 추가 -->
            <div class="pagination">
                <button onclick="previousPage()">이전</button>
                <span>1</span>
                <button onclick="nextPage()">다음</button>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var itemli = $('.toggle_btn');
        itemli.click(function () {
            $(this).toggleClass('on'); // 클릭한 버튼에 'on' 클래스 토글
            itemli.not($(this)).removeClass('on'); // 다른 버튼에서 'on' 클래스 제거
        });

        function previousPage() {
            // 이전 페이지 로직 구현
            alert("이전 페이지");
        }

        function nextPage() {
            // 다음 페이지 로직 구현
            alert("다음 페이지");
        }
    </script>
</body>
</html>
