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
	response.setCharacterEncoding("UTF-8");
	String center = request.getParameter("center");
	String logout = request.getParameter("logout");
	if(logout!=null){
		//id���� null ���� ����
		session.setAttribute("id", null);
		//���ǽð� 0. �α׾ƿ� ó��
		session.setMaxInactiveInterval(0);
	}
	if(center==null){
		center = "center.jsp";
	}
%>
<!-- center -->
<tr height="300">
		<td width="300" align="center">
		<jsp:include page="<%=center %>"/>
</body>
</html>