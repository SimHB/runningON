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
			<li><a class="index_a">마이페이지</a>
				<ul id="ul1">
					<li><a class="index_a" href="/my_info">나의 정보</a></li>
					<li id="act"><a class="index_a" href="/my_act">나의 활동</a>
						<ul class="ul2" id="act1">
							<li><a class="index_a" href="/my_act">내가 쓴 게시글</a></li>
							<li><a class="index_a" href="/my_comment">내가 쓴 댓글</a></li>
							<li><a class="index_a" href="/my_scrap">스크랩</a></li>
						</ul>
					</li>
					<li id="group"><a class="index_a" href="/view6">나의 모임</a>
						<ul class="ul2" id="group2">
							<li><a class="index_a" href="/view5">내가 만든 모임</a></li> <!-- view5 => my_create_group -->
							<li><a class="index_a" href="/view6">내가 참여한 모임</a></li><!-- view6 => my_join_group -->
							<li><a class="index_a" href="/view7">나의 관심 모임</a></li> <!-- view7 => my_interest_group -->
						</ul>
					</li>
					<li id="text"><a class="index_a" href="my_msg_receive">나의 쪽지</a>
						<ul class="ul2" id="text2">
							<li><a class="index_a" href="/my_msg_write">쪽지 쓰기</a></li>
							<li><a class="index_a" href="/my_msg_receive">받은 쪽지</a></li>
							<li><a class="index_a" href="/my_msg_send">보낸 쪽지</a></li>
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
	</script>
</body>
</html>