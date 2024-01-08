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
.eventTitle{
	margin-left: 8%
}
</style>
</head>
<body>
	<table style = "width:100%;">
		<tr style = "font-size: 15pt; font-weight: bold;">
			<td style = "width:8%; text-align: center;"> <font color = "#CF9ED2"> 이벤트 </font> </td>
			<td style = "width:95%;">${ dto.title } </td>
		</tr>
		<tr>
			<td colspan = "2"> ${ dto.postdate } </td>
		</tr>
			<tr>
				<td colspan = "2"> <img class ="evnetImg" src="../img/Event/${ dto.image }" alt="이벤트 이미지" /> </td>
			</tr>
		<tr>
			<td colspan = "2">
				<input type = "button" value = "목록 바로가기" onclick = "history.back()">
			</td>
		</tr>
	</table>
</body>
</html>