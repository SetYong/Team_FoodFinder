<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID - 아이디찾기</title>
<Style>
button{
width:100px;
height: 50px;
text-align: center;
float: center;
background-color: red;
}
</Style>
</head>
<body>
	<h2 align="center">ID</h2>
	<form>
		<div align="center">
		<%= request.getAttribute("memberName") %>님 <br>
		아이디 : "<%= request.getAttribute("memberId") %>"를 찾았습니다<br>
		<button type="button" onclick="location.href='../Main/Main.jsp?contentPage=../Member/Login.jsp'">확인</button>
		</div>
	</form>
</body>
</html>