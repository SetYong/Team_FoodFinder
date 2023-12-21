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
	<h2>View</h2>
	
	<table border="1" width="90%">
		<colgroup>
			<col width="15%"/> <col width="35%"/>
			<col width="15%"/> <col width="*"/>
		</colgroup>
		
		<tr>
			<td>번호</td> <td>${ dto.headnum }</td>
			<td>작성자</td> <td>${ dto.mbnum }</td>
		</tr>
		<tr>
			<td>작성일</td> <td>${ dto.qudate }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${ dto. title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${ dto.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" onclick="location.href='../Admin/AdminMain.jsp?contentPage=QuestionWrite.jsp?headnum=${ param.headnum }';">답신하기</button>
				<button type="button" onclick="history.back()">목록 바로가기</button>
			</td>
		</tr>
	</table>
	<c:if test="${ dto.readadmin ==  '1' }">
		<table>
			<tr>
				<td> ${ dto.answer } </td>
			</tr>
		</table>
	</c:if>
</body>
</html>