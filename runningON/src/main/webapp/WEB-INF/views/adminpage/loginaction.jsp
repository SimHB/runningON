<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginAction</title>
</head>
<body>
    <c:if test="${sessionScope.adminVO != null}">
        <script type="text/javascript">
            window.location.href = '/main';
        </script>
    </c:if>
    <c:if test="${sessionScope.adminVO == null}">
        <script type="text/javascript">
            window.location.href = '/login';
        </script>
    </c:if>
</body>
</html>