<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String headnum = request.getParameter("headnum");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea{
Width: 1180px;
height: 500px;
resize: none;
}
input[type="submit"]{
width: 100px;
margin-left: 45%;
height: 50px;
border-radius: 10px;
}
</style>
</head>
<body>
	<form name="WriteAdminForm" action="../Admin/QuestionWrite.do?">
	<table>
		<tr><td><h2> ${ param.headnum }번 답신 페이지입니다.</h2></td></tr>
		<tr>
			<td>
			<textarea name="answer" cols="30" placeholder="답신하실내용을 입력해주세요" required></textarea>
			<input type="hidden" name="headnum" value=<%= headnum %>>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value ="답신 완료">
		</tr>
	</table>
	</form>
</body>
</html>