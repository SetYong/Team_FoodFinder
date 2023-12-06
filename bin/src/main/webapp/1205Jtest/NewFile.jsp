<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<form>
<body>
	      <h2>Login</h2>
      ID <input type = "text" name="id" placeholder="아이디를 입력해주세요."><br/>
      PASSWORD <input type = "password" name="password" placeholder="비밀번호를 입력해주세요.">
      <p>
        <button type="submit" onclick="location.href='center.jsp?">로그인</button>
      </p>
<%
	String id = (String)session.getAttribute("USER_ID");
	String center = request.getParameter("center");
%>
<%
	if(id!=null){
		%>
		<%=id %> 님
		<button onclick="location.href='Main.jsp?logout=1'">로그아웃</button>
		<%
	}else if(center==null){
		//center에 값이 존재하는 경우에만 로그인버튼을 띄움.
		%>
		<button onclick="location.href='Main.jsp?center=Login.jsp'">회원가입</button>
		<% 
	}	
	else{
		%>
	<%} 
	%>
</form>
</body>
</html> 