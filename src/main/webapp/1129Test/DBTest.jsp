<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB테스트</title>
</head>
<body>
	<h2>DB테스트 1</h2>
	<%
	JDBConnect jdbc1 = new JDBConnect();
	
	String sql = "SELECT * FROM member_login";
	Statement stmt = jdbc1.con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next()){
		String mn = rs.getString(1);
		String id = rs.getString(2);
		String pwd = rs.getString(3);
		
		out.println(String.format("%s %s %s", mn, id, pwd));
	}
	jdbc1.close();
	
	%>
</body>
</html>

