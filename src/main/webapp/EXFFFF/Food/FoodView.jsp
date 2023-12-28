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
	<h2>Food View</h2>
	<table>
		<tr>
			<td> 제목 : ${ dto.title } </td>
			<td> 작성일 : ${ dto.fooddate } </td>
		</tr>
		<tr>
			<td> 작성자 :${ nickName } </td>
			<td> 공감 수 : ${ dto.heartcount } </td>
		<tr>
			<td colspan = "2"> 재료 : ${ dto.content } </td>
		</tr>
		<tr>
			<td colspan = "2"> 레시피 :${ dto.recipe } </td>
		<tr>
	</table>
	<table>
		<tr>
			<td> <input type = "button"  value = "공감"> </td> 
		</tr>
		<tr>
			<td> <input type = "text"> </td>
			<td> <input type = "submit" value = "댓글 달기"> </td>
		</tr>
	</table>
	<table>
	<c:choose>
		<c:when test="${empty replyList}">
        	<tr>
				<td colspan="6" align="center">
					등록된 댓글이 없습니다.
				</td>
			</tr>
        </c:when>
        <c:otherwise>
        <tr>
			<td> 작성자 : ${ replyList.replembnum }  </td>
			<td> ${ replyList.repletext } </td>
		</tr>
		</c:otherwise>
		</c:choose>
	</table>
</body>
</html>