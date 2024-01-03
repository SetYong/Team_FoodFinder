<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title>Login</title>
<style>
input[type=text]{
	width: 20%;
	height: 30px;
}
input[type=password]{
	width: 20%;
	height: 30px;
	margin-bottom: 5px;
}
label{
	cursor: pointer;
	font-size: 9pt;
}
span{
	font-size: 9pt;
}
.FindID{
	margin-left:10%;
}
.LoginBtn{
	cursor: pointer;
    width: 20%;
    height: 40px;
    margin-top: 8px;
    margin-bottom: 8px;
}
.RegisterBtn{
	cursor: pointer;
    width: 20%;
    height: 40px;
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
	<table style="width: 100%;">
		<tr>
			<td> <input type = "text" name="id" placeholder="아이디를 입력해주세요"/> </td>
		</tr>
		<tr>
			<td> <input type = "password" name="password" placeholder="비밀번호를 입력해주세요"/> </td>
		</tr>
		<tr>
			<td> 
				<label class = "FindID" onclick="location.href='Main.jsp?contentPage=../Member/FindIdHome.jsp'">아이디찾기</label>
				<span style = "width:1px; height:10px; margin: 3px 6px 0; backgorund-color:#333;">|</span>
				<label class = "FindPWD" onclick="location.href='Main.jsp?contentPage=../Member/FindPassHome.jsp'">비밀번호찾기</label>
			</td>
		</tr>
		<tr>
			<td> <input class = "LoginBtn" type = "submit" value = "로그인"> </td>
		</tr>
		<tr>
			<td> <input class = "RegisterBtn" type = "button" value = "회원가입" onclick = "location.href = '../Main/Main.jsp?contentPage=../Member/Newmember.jsp'"> </td>
		</tr>
	</table>
</form>
<%
}
%>

</body>
</html> 