<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>연습페이지</title>
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
    background-color: lightblue;
    display: flex;
    justify-content: center;
    align-items: center;
    height: calc(100vh - 60px); /* 헤더를 제외한 높이 */
}

.box {
    width: 80%;
    max-width: 1200px;
    min-width: 600px;
    background-color: lightcoral;
    padding: 20px;
    text-align: center;
}

/* 반응형 미디어 쿼리 */
@media screen and (max-width: 600px) {
    .box {
        background-color: red; /* 화면 크기가 600px 이하일 때 배경색 변경 */
        width: 100%; /* 가로폭 100% */
        min-width: auto; /* 최소 너비 초기화 */
    }
}

@media screen and (min-width: 1200px) {
    .box {
        background-color: pink; /* 화면 크기가 1200px 이상일 때 배경색 변경 */
        width: 100%; /* 가로폭 100% */
        max-width: 1200px; /* 최대 너비 1200px */
    }
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
            <h1>반응형 본문 영역</h1>
            <p>화면 크기에 따라 배경색이 바뀌고 크기가 조절됩니다.</p>
        </div>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var itemli = $('.toggle_btn');
    itemli.click(function () {
        $(this).toggleClass('on'); // 클릭한 버튼에 'on' 클래스 토글
        itemli.not($(this)).removeClass('on'); // 다른 버튼에서 'on' 클래스 제거
    });
</script>
</html>
