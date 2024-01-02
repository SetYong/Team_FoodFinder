<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title>Login</title>
<style>
input[type=text]{

}
</style>
</head>
<meta charset="UTF-8">
<body>
<h2 align="center">로그인</h2>
<% System.out.println("로그인시 ID : " + session.getAttribute("user_Id")); %>
<%
if(request.getAttribute("authMessage") == "로그인 실패"){ %>
	<script>
		alert("아이디와 비밀번호를 다시 한번 확인해주세요.");
	</script>
<%}
if(session.getAttribute("user_Id") == null){
%>
<script>
function validateForm(form){
if(!form.id.value){
	alert("아이디를 입력하세요.");
	form.id.focus();
	return false;
	}
if(form.password.value == ""){
	alert("비밀번호를 입력하세요.");
	form.password.focus();
	return false;
	}	
}
</script>
<form align=center action="../Member/Login.do" method="post" name="loginFrm" onsubmit="return validateForm(this);">
아이디 : &nbsp;&nbsp;&nbsp;<input type = "text" name="id"/><br/>
비밀번호 : <input type = "password" name="password"/><br/>
<label class=Find onclick="location.href='Main.jsp?contentPage=../Member/FindIdHome.jsp'">아이디찾기</label>
<label class=Find onclick="location.href='Main.jsp?contentPage=../Member/FindPassHome.jsp'">비밀번호찾기</label>
<br>
<input type = "submit" value="로그인"/>
</form>
<%
}
%>

</body>
</html> 