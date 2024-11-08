<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 한글 안깨지게 해줌 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>날씨</title>
	
<style type="text/css">
    span { width: 150px; color : red;}
    input{border: 1px solid red;}
	table{width: 80%; margin: 0 auto;}
	table, th, td { border: 1px solid lightgray; text-align: center;}
	h2{text-align: left;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
</head>
<body>
<h2>날씨</h2>
<!-- <button id="btn1">날씨 UPDATE</button> -->
<hr>
<div id="result"></div>
	<script type="text/javascript">
	$("#result");
	$.ajax({
		url : "/test03",       // 서버주소   
		method : "post",       // 전달방식 
		dataType:"xml",        // 가져오는 결과 데이터 타입    
	   success : function(data) {
		 let table = "<table>";
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
