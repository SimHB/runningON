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
	<link href="/resources/KGW/css/navL.css" rel="stylesheet">
</head>
<body>
	<div class="navL">
        <ul>
            <li><a href="/my_info" id="myInfoLink">마이페이지</a>
                <ul id="ul1">
                    <li><a href="/my_info" id="myInfo">나의 정보</a></li>
                    <li id="act"><a href="/my_act" id="myActivity">나의 활동</a>
                        <ul class="ul2" id="act1">
                            <li><a href="/my_act" id="myPosts">내가 쓴 게시글</a></li>
                            <li><a href="/my_comment" id="myComments">내가 쓴 댓글</a></li>
                            <li><a href="/my_scrap" id="myScrap">스크랩</a></li>
                        </ul>
                    </li>
                    <li id="group"><a href="/my_join_group" id="myGroups">나의 모임</a>
                        <ul class="ul2" id="group2">
                            <li><a href="/my_create_group?board_idx=5" id="createdGroups">내가 만든 모임</a></li>
                            <li><a href="/my_join_group" id="joinedGroups">내가 참여한 모임</a></li>
                            <li><a href="/my_interest_group" id="interestedGroups">나의 관심 모임</a></li>
                        </ul>
                    </li>
                    <li id="text"><a href="/my_msg_receive" id="myMessages">나의 쪽지</a>
                        <ul class="ul2" id="text2">
                            <li><a href="/my_msg_write" id="writeMessage">쪽지 쓰기</a></li>
                            <li><a href="/my_msg_receive" id="receivedMessages">받은 쪽지</a></li>
                            <li><a href="/my_msg_send" id="sentMessages">보낸 쪽지</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
	
	<script type="text/javascript">
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
		
		// 페이지가 로드될 때 로컬 스토리지에서 active 상태를 가져와 설정
        $(document).ready(function() {
            const activeLinkId = localStorage.getItem("activeLinkId");
            if (activeLinkId) {
                $("#" + activeLinkId).addClass("active");
                $("#" + activeLinkId).closest(".ul2").addClass("active-parent");
            }
        });

        // 클릭한 링크의 ID를 로컬 스토리지에 저장
        $(".navL a").on("click", function() {
            // 모든 링크에서 active 클래스 제거
            $(".navL a").removeClass("active");
            $(".ul2").removeClass("active-parent");

            // 클릭한 링크에 active 클래스 추가
            $(this).addClass("active");

            // 상위 .ul2 요소에 active-parent 클래스 추가
            $(this).closest(".ul2").addClass("active-parent");

            // 클릭한 링크의 ID를 로컬 스토리지에 저장
            localStorage.setItem("activeLinkId", $(this).attr("id"));
        });
	</script>
</body>
</html>