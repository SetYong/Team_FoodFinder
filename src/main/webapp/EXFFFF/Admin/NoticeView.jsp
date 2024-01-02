<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.evnetImg{
	margin-left: 8%;
}
</style>
</head>
<body>
	<table style = "width:100%;">
		<tr style = "font-size: 15pt; font-weight: bold;">
			<td style = "width:8%; text-align: center;"> 
			<c:if test = "${ dto.cate == 'notice' }"> 공지 </c:if>
			<c:if test = "${ dto.cate == 'noticecheck' }"> <font color = "#858FDE"> 점검 </font> </c:if>
			<c:if test = "${ dto.cate == 'event' }"> <font color = "#CF9ED2"> 이벤트 </font> </c:if>
			</td>
			<td style = "width:95%;">${ dto.title } </td>
		</tr>
		<tr>
			<td colspan = "2"> ${ dto.postdate } </td>
		</tr>
		<c:choose>
		<c:when test="${ dto.text != null }">
			<tr>
				<td colspan="2">
					<pre>${ dto.text }</pre>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan = "2"> <img class ="evnetImg" src="../img/Event/${ dto.image }" alt="이벤트 이미지" /> </td>
			</tr>
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan = "2"> <input type = "button" value = "목록 바로가기"> <input type = "button" value = "삭제하기"> </td>
	</table>
</body>
</html>