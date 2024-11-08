<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>날씨</title>
		<link href="/resources/SHB/css/side_left.css" rel="stylesheet">
		<link href="/resources/CSH/css/weather.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="daily_weather">
			<h2 style="text-align: center; margin-top: 20px;"><a href="/weather">날씨</a></h2>
			<!-- <button id="btn1">날씨 UPDATE</button> -->
			<hr>
			<div id="result"></div>
		</div>
		
		<script type="text/javascript">
			$("#result");
			$.ajax({
				url : "/test03",       // 서버주소   
				method : "post",       // 전달방식 
				dataType:"xml",        // 가져오는 결과 데이터 타입    
			   success : function(data) {
				 let table = "<table class='weather_table'>";
				 table += "<thead><tr><th>지역</th><th>온도</th><th>상태</th><th>아이콘</th></tr></thead>" ;
				 table += "<tbody>";
				  $(data).find("local").each(function() {
				     let local = $(this).text();
				     
				     if ($.trim(local) === "서울") {
				     let ta = $(this).attr("ta");
				     let desc = $(this).attr("desc");
				     let icon = $(this).attr("icon");
				     
				     table += "<tr>";
				     table += "<td>" + local + "</td>";
				     table += "<td>" + ta + "</td>";
				     table += "<td>" + desc + "</td>";
				     table += "<td><img src='https://www.kma.go.kr/images/icon/NW/NB" + icon+ ".png'></td>";
				     table += "</tr>";
				     }
				  });
				 table += "</tbody>";
				 table += "</table>";
				 $("#result").append(table);
			   },
			   error:function() {
				 alert("읽기실패")
			   }
			});
		</script>
	</body>
</html>
