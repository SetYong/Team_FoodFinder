<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	//���� �����ð� ����
	session.setMaxInactiveInterval(60); //1�а� ���̵� ����
	response.sendRedirect("Main.jsp");
%>
</body>
</html>