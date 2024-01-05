<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder</title>
</head>
<body>
	<h2>이벤트</h2>
	
	<table border="1" style = "width: 100%">
	<c:choose>
		<c:when test="${ empty boardLists }">
			<tr>
				<td colspan="6" align="center">
					등록된 이벤트가 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
			<tr align="center">
				<td> <img src="../img/Event/${ row.titleimage }" alt="${ row.titleimage }"></td>
				<td>${ row.visitcount }</td>
				<td>${ row.postdate }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
</body>
</html>