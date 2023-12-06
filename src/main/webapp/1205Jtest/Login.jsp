<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function login(value){
	value = session.getAttribute("loginvalue");
	if(value=="1"){
		
	} else {
		alert("다시");
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
<%@if (session.getAttribute("USER_ID")==null) {%>
<form action="LoginDateBase.jsp" onsubmit="login(this);">
	 <h2>Login</h2>
      ID <input type = "text" name="id" placeholder="아이디를 입력해주세요."><br/>
      PASSWORD <input type = "password" name="password" placeholder="비밀번호를 입력해주세요.">
      <p>
        <button type="submit">로그인</button>
        <button type= "button" onclick="location.href='LoginProcess.jsp?center=Register.jsp'">회원가입</button>
      </p>
      </form>
      <%@
      } else{ 
      %>
      
      <%=session.getAttribute("UserID") %> 회원님, 로그인하셨습니다.<br/>
</body>
</html> 