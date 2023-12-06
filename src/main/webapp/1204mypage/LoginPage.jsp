<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Login</h2>
	ID
	<input type="text" name="id" placeholder="아이디를 입력해주세요.">
	<br /> PASSWORD
	<input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
	<%
	String id = (String)session.getAttribute("id");
	String center = request.getParameter("center");
	%>
	<%
	if(id!=null){
		%>
	<%=id %>
	님
	<button onclick="location.href='Main.jsp?logout=1'">로그아웃</button>
	<%
	}else if(center==null){
		//center에 값이 존재하는 경우에만 로그인버튼을 띄움.
		//처리를 안해주고 로그인 버튼을 누를시 LoginForm.jsp로 넘어가면 Top.jsp에 있는 로그인 버튼이 그대로 나옴.
		%>
	<button onclick="location.href='Main.jsp?center=Login.jsp'">로그인</button>
	<% 
	}	
	else{
		%>
	<%} 
	%>
</body>
</html>
