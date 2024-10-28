<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정사각형 표</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            display: flex;
            flex-direction: column; /* 세로 방향으로 배치 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            min-height: 100vh; /* 최소 높이 설정 */
            margin: 0; /* 기본 여백 제거 */
            background-color: #f9f9f9; /* 배경색 */
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
		
        /* 표 스타일 */
        .square-table {
            border-collapse: collapse;
            width: 100%; /* 반응형으로 조정할 수 있는 너비 */
            max-width: 800px; /* 최대 너비를 20px 늘림 */
            height: auto; /* 자동 높이 조정 */
           	margin-top: 80px; /* 표 위에 여백 추가하여 아래로 내리기 */
        }

        .square-table th, .square-table td {
            border: 1px solid #ccc;
            text-align: center;
            vertical-align: middle;
            padding: 20px; /* 패딩 추가하여 공간 확보 */
            font-size: 16px; /* 글자 크기 조정 */
            height: 70px; /* 높이를 조정하여 여유 공간 추가 */
        }

        /* 병합된 셀 스타일 */
        .merged {
            background-color: #f0f0f0; /* 병합된 셀 배경색 */
            height: auto; /* 높이를 자동으로 조정 */
        }

        /* 버튼 스타일 */
        .btn {
            margin-top: 20px; /* 버튼과 표 사이의 간격 */
            padding: 10px 20px; /* 버튼 내부 여백 */
            background-color: #007bff; /* 버튼 배경색 */
            color: white; /* 버튼 글자 색 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 둥근 모서리 */
            cursor: pointer; /* 커서 변경 */
            font-size: 16px; /* 버튼 글자 크기 */
        }

        .btn:hover {
            background-color: #0056b3; /* 호버 시 배경색 변경 */
        }

        /* 반응형 디자인 */
        @media (max-width: 600px) {
            .square-table th, .square-table td {
                width: 100px; /* 작은 화면에서 셀 너비 조정 */
                height: 80px; /* 작은 화면에서 셀 높이 조정 */
            }

            .square-table {
                width: 100%; /* 작은 화면에서 표 너비 100% */
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


<table class="square-table">
    <tr>
        <th colspan="2" class="merged" rowspan="2">프로필 이미지</th> <!-- 추가로 병합된 셀 -->
        <th>이름</th>
        <th>김런닝</th>
        <th>생년월일</th>
        <th>XXXX년 XX월 XX일</th>
    </tr>
    <tr>
        <th>닉네임</th>
        <th>김런닝</th>
        <th>성별</th>
        <th>남</th>
    </tr>
    <tr>
        <th colspan="2" class="merged">이메일</th>
        <th colspan="2" class="merged">Running@naver.com</th>
        <th>가입일자</th>
        <th>XXXX년 XX월 XX일</th> <!-- 셀 분리됨 -->
    </tr>
    <tr>
        <th class="merged" colspan="2">제제내역</th> <!-- 행 4 병합 -->
        <th colspan="4" class="merged">XXXX년 XX월 XX일 3일 활동정지</th> <!-- 행 4 병합 -->
    </tr>
    <tr>
        <th class="merged" colspan="2">활동모임</th> <!-- 행 5 병합 -->
        <th colspan="4" class="merged">당근이네 런닝모임<br>당근이네 당근모임</th> <!-- 행 5 병합 -->
    </tr>
    <tr>
        <th class="merged" colspan="2">마이페이지 소개글</th> <!-- 행 6 병합 -->
        <th colspan="4" class="merged">강원도 마라톤 대회 참가</th> <!-- 행 6 병합 -->
    </tr>
</table>

<!-- 목록으로 버튼 -->
<button class="btn" onClick="location.href='/userlist'">목록으로</button>

</body>
</html>
