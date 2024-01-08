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
	<h2 style = "text-align:center;">${ dto. title }</h2>
	
	<table border = 1 style = "width:100%;">
		<colgroup>
			<col width="15%"/> <col width="35%"/>
			<col width="15%"/> <col width="*"/>
		</colgroup>
		
		<tr>
			<td style = "width: 10%">문의 종류</td> <td>${ dto.qucate }</td>
			<td>작성자</td> <td>${ dto.mbnum }</td>
			<td>작성일</td> <td>${ dto.qudate }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5" height="100">${ dto.content }</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<button type="button" style="width: 10%;height: 30px;margin-top: 10px;margin-bottom: 10px;"onclick="history.back()">목록 바로가기</button>
			</td>
		</tr>
	</table>
	<c:if test="${ dto.readadmin ==  '1' }">
		<table border = 1 style="width:100%;">
			<tr>
				<td style = "width:5%; text-align:center;"> 답글 </td>
				<td style = "text-align:center;"> ${ dto.answer } </td>
			</tr>
		</table>
	</c:if>
</body>
</html>