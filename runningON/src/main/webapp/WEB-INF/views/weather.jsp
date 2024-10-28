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
	h2{text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
</head>
<body>
<h1>
	날씨
</h1>
<button id="btn1">날씨 update</button>

<hr>
<div id="result"></div>

	<script type="text/javascript">
	$("#btn1").click(function() {
		$("#result").empty();
		$.ajax({
			url : "/weather",        // 서버주소   
			method : "post",        // 전달방식 
			dataType:"json",        // 가져오는 결과 데이터 타입    
		    success : function(data) {
			  let items = data.response.body.items.item;
			 // console.log(items);
			  
			  let table = "<table>";
			  table += "<thead><tr><th>날짜</th><th>최소온도</th><th>최대온도</th></tr></thead>";
			  table +="<tbody>";
			  
			  $.each(items, function(index, obj) {
				
				 for (let i = 3; i < 11; i++) {
					
					// 오늘 구하기 
					let today = new Date();
					today.setDate(today.getDate() + (i-1)); // 몇일 후 날짜
					
					// 날짜형식을 YYYY-MM-DD로 변환
					// toISOString() => YYYY-MM-DDHH:mm.ss
					// split('T')[0] => YYYY-MM-DD
					let r_date = today.toISOString().split('T')[0];
					
					table +="<tr>";
					table += "<td>"+ r_date +"</td>";	
					table += "<td>"+obj["taMin" + i]+"</td>";	
					table += "<td>"+obj["taMax" + i]+"</td>";	
					table +="</tr>";
				  }
			  });
			  
			  table +="</tbody>";
			  table +="</table>";
			  $("#result").append(table);
			
		    }, 
		    error:function() {
			 alert("읽기실패")
		    }
		});
	});
	
	</script>


<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
