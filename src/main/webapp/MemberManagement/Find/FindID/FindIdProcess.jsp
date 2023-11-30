<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID - 아이디찾기 받기</title>
</head>
<body>
<%
String name = request.getParameter("memberName");
String cn = request.getParameter("memberCn1");
String cn2 = request.getParameter("memberCn2");

response.sendRedirect("FindIdResult.jsp");
%>
</body>
</html>