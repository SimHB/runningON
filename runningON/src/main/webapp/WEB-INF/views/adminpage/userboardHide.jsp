<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result eq 1}">
        <script type="text/javascript">
        	alert("성공")
            window.location.href = '/userboard';
        </script>
	</c:if>
	<c:if test="${result eq 0}">
        <script type="text/javascript">
        	alert("실패")
            window.location.href = '/main';
        </script>
	</c:if>
</body>
</html>