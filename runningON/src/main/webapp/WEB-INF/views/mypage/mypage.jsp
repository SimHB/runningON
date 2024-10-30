<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>RunningON</title>
	<link rel="icon" type="image/x-icon" href="/resources/kgw/images/faviconrun.jpg">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- 초기화 css -->
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css
	"rel="stylesheet">
	<link href="/resources/KGW/css/header.css" rel="stylesheet">
	<link href="/resources/KGW/css/navL.css" rel="stylesheet">
	<link href="/resources/KGW/css/thumbs.css" rel="stylesheet">

</head>
<body>
	<header class="header">
		<div class="navbar">
			<div class="navbar_logo">
				<a href="/home"><img alt="로고"src="resources/KGW/images/logowhite.png" style="width: 150px"></a>
			</div>

			<!-- 검색창 -->
			<div class="header_center">
				<!-- onsubmit="return false;" 새로고침 방지  -->
				<form class="header_form" onsubmit="return false;">
					<input class="header_input_text" type="text" placeholder="보고싶은 동영상">
					<button class="header_input_button">검색</button>
				</form>
			</div>

			<ul class="navbar_link">
				<li><a href="/login1">로그인</a></li>
				<li><a href="/mypage">MY</a></li>
			</ul>
		</div>

		<nav class="navbar_bottom">
			<div class="navbar_blank">
				<!-- 메뉴를 중간으로 두기위해.. -->
			</div>

			<ul class="navbar_search">
				<li><a href="/my_info">HOT</a></li>
				<li><a href="/free_board">자유</a></li>
				<li><a href="/my_info">코스추천</a></li>
				<li><a href="/my_info">러닝모임</a></li>
				<li><a href="/my_info">마라톤 대회</a></li>
				<li><a href="/my_info">플리추천</a></li>
				<li><a href="/my_info">러닝용품</a></li>
			</ul>
			<div class="navbar_blank">
				<!-- 메뉴를 중간으로 두기위해.. -->
			</div>
		</nav>
	</header>

	<div class="navL">
		<ul>
			<li><a>마이페이지</a>
				<ul id="ul1">
					<li><a href="/my_info">나의 정보</a></li>
					<li id="act"><a href="/my_act">나의 활동</a>
						<ul class="ul2" id="act1">
							<li><a href="/my_act">내가 쓴 게시글</a></li>
							<li><a href="/my_comment">내가 쓴 댓글</a></li>
							<li><a href="/my_scrap">스크랩</a></li>
						</ul>
					</li>
					<li id="group"><a href="/view6">나의 모임</a>
						<ul class="ul2" id="group2">
							<li><a href="/view5">내가 만든 모임</a></li> <!-- view5 => my_create_group -->
							<li><a href="/view6">내가 참여한 모임</a></li><!-- view6 => my_join_group -->
							<li><a href="/view7">나의 관심 모임</a></li> <!-- view7 => my_interest_group -->
						</ul>
					</li>
					<li id="text"><a href="my_msg_recive">나의 쪽지</a>
						<ul class="ul2" id="text2">
							<li><a href="/my_msg_write">쪽지 쓰기</a></li>
							<li><a href="/my_msg_recive">받은 쪽지</a></li>
							<li><a href="/my_msg_send">보낸 쪽지</a></li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>

	

	<section class="thumbs">
		
			
	



	</section>
<script type="text/javascript">
$(document).ready(function() {
	function loadContent(url) {
        $(".thumbs").load(url); // 콘텐츠 로드
        history.pushState({ url: url }, '', url); // 히스토리에 상태 저장
    }
	
	$("a").on("click", function(e) {
		var url = $(this).attr("href"); // 클릭된 링크의 href 값 가져오기
		
		if(url !== "/home" && url !== "/main" && url !== "/login1" && url !== "/mypage"){
			e.preventDefault(); // 기본 링크 이동 동작 막기
			$(".thumbs").load(url);
		//	loadContent(url);
		}
	});
	
	$(document).on("click", "a",function(e) {
		var url = $(this).attr("href"); // 클릭된 링크의 href 값 가져오기
		
		if(url !== "/home" && url !== "/main" && url !== "/login1" && url !== "/mypage"){
			e.preventDefault(); // 기본 링크 이동 동작 막기
			$(".thumbs").load(url);
			loadContent(url);
		}
	});

	$(document).on("submit", "form", function(e) {
		var url = $(this).find("input[type='submit']").data("url" && url !== "/mypage"); // 클릭된 링크의 href 값 가져오기
		
		e.preventDefault(); // 기본 링크 이동 동작 막기
		$(".thumbs").load(url);
	//	loadContent(url);
	}); 
	
	
	// popstate 이벤트: 뒤로 가기/앞으로 가기 클릭 시 발생
    $(window).on("popstate", function(e) {
        var state = e.originalEvent.state;
        if (state) {
            $(".thumbs").load(state.url); // 저장된 URL로 콘텐츠 로드
        }
    });
	
});

$("#act").on({
	"mouseover focus" : function(){
		$("#act1").css("opacity","1");
		$("#act1").css("max-height","200px");
	},
	"mouseout blur" : function(){
		$("#act1").css("opacity","0");
		$("#act1").css("max-height","0");
	}
});
$("#group").on({
	"mouseover focus" : function(){
		$("#group2").css("opacity","1");
		$("#group2").css("max-height","200px");
	},
	"mouseout blur" : function(){
		$("#group2").css("opacity","0");
		$("#group2").css("max-height","0");
	}
});
$("#text").on({
	"mouseover focus" : function(){
		$("#text2").css("opacity","1");
		$("#text2").css("max-height","200px");
	},
	"mouseout blur" : function(){
		$("#text2").css("opacity","0");
		$("#text2").css("max-height","0");
	}
});
	
</script>
</body>
</html>