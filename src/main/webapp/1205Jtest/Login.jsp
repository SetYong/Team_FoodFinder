<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title>Insert title here</title></head>
<meta charset="UTF-8">
<body>
<h2>로그인</h2>
<%
if(session.getAttribute("USER_ID")==null){
%>
<script>
function validateForm(form){
if(!form.user_id.value){
	alert("아이디를 입력하세요.");
	return false;
	}
if(form.user_pwd.value == ""){}	
alert("비밀번호를 입력하세요.");
return false;
	}
}
</script>
<form action="LoginDateBase.jsp" method="post"name="loginFrm" onsubmit="return validateFrom(this);">
아이디 : <input type = "text" name="id"/><br/>
비밀번호 : <input type = "password" name="password"/><br/>
<input type = "submit" value="로그인"/>
</form>
<%
} else{
%>

<%= session.getAttribute("user_id") %> 회원님, 로그인하셨습니다.<br/>
<%
}
%>

</body>
</html> 