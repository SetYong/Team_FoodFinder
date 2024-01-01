<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 100%; height: auto;">
		<tr>
			<td> <h2 style="text-align:center; font-size:30px;">공지사항</h2> </td>
		</tr>
		<tr>
			<td> <input type = "button" value = "공지작성" style="width: 100px; height: 36px;border-radius: 20%;font-size: 18px;float: right;"> </td>
		</tr>
		<c:choose>
        	<c:when test="${empty boardLists}">
        		<tr>
					<td colspan="4" style="text-align: center;">
					등록된 게시물이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td> 종류 </td>
					<td> 제목 </td>
					<td> 조회수 </td>
					<td> 날짜 </td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>