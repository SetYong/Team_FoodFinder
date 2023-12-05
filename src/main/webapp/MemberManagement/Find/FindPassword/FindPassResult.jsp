<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find PWD - 비밀번호 찾기</title>
</head>
<body>
 <div>
 	<h2>PassWord</h2>
 	<%= session.getAttribute("memberName") %>님 <br>
 	아이디 : <%= session.getAttribute("memberId") %> 비밀번호 변경 완료! <br>
 	<input type="button" value="확인" onclick="location.href='../../../1129Test/NewFile.jsp'">
 </div>
</body>
</html>