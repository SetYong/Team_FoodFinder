<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<meta charset="UTF-8">
<body>
<h2 align="center">로그인</h2>
<%
if(session.getAttribute("user_Id")==null){
%>
<script>
function validateForm(form){
if(!form.id.value){
	alert("아이디를 입력하세요.");
	return false;
	}
if(form.password.value == ""){}	
alert("비밀번호를 입력하세요.");
return false;
	}
}
</script>
<h4>${loginMessage}</h4>
<a href="/EXFFF/Login.do">으아아아아아아아악</a>
<form align="center" action="/EXFFF/Login.do" method="post"name="loginFrm" onsubmit="return validateFrom(this);">
아이디 : &nbsp;&nbsp;&nbsp;<input type = "text" name="id"/><br/>
비밀번호 : <input type = "password" name="password"/><br/>
<input align="center" type = "submit" value="로그인"/>
</form>
<%
} 
%>

</body>
</html> 