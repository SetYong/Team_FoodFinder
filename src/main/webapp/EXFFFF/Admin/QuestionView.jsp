<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<h2 style="text-align: center; margin:3%;">View</h2>
	
	<table border="1" width="90%" class="table">
		<colgroup>
			<col width="15%"/> <col width="35%"/>
			<col width="15%"/> <col width="*"/>
		</colgroup>
		
		<tr>
			<td style="font-size:16pt;">작성자</td> <td style="font-size:14pt;">${ dto.mbnum }</td>
			<td style="font-size:16pt;">작성일</td> <td style="font-size:14pt;">${ dto.qudate }</td>
		</tr>
		<tr>
			<td style="font-size:16pt;">제목</td>
			<td colspan="3" style="font-size:14pt;">${ dto. title }</td>
		</tr>
		<tr>
			<td style="font-size:16pt;">내용</td>
			<td colspan="3" height="100" style="font-size:14pt;">${ dto.content }</td>
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