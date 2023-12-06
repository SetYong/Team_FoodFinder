

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validateForm(form){
if(!from.User_id.value){
		alert("아이디를 입력해주세요.");
		return false;}
if(!from.User_pwd.value){
		alert("비밀번호를 입력해주세요.");
		return false;}
if(!from.name.value){
alert("이름을 입력해주세요.");
return false;}

if(!form.cn.value){
alert("주민등록번호를 입력해주세요.");
return false;
}
if(!form.mail.value{
alert("메일을 입력해주세요.");
return false;
}
if(!form.phone.value{
	alert("핸드폰 번호를 입력해주세요.");
	return false;
	}
if(!form.nickname.value{
	alert("닉네임을 입력해주세요.");
	return false;
	}
}
</script>
</head>
<body>

<form method="post" action="RegisterDateBase.jsp" onsubmit="validateForm(this);">

<table>
<tr height="50">
	<td height="50">아이디</td>
	<td height="50"><input type="text" name="id"></td>
</tr>
<tr height="50">
	<td height="50">패스워드</td>
	<td height="50"><input type="password" name="pass"></td>
</tr>
<tr height="50">
	<td height="50">이름</td>
	<td height="50"><input type="text" name="name"></td>
</tr>
<tr height="50">
	<td height="50">주민등록번호</td>
	<td height="50"><input type="text" name="resident registration number"></td>
</tr>
<tr height="50">
	<td height="50">이메일</td>
	<td height="50"><input type="text" name="phoneNumber"></td>
</tr>
<tr height="50">
	<td height="50">핸드폰번호</td>
	<td height="50"><input type="text" name="e-mail"></td>
</tr>
<tr height="50">
	<td height="50">닉네임</td>
	<td height="50"><input type="text" name="Nickname"></td>
</tr>
<tr height="50">
	<td height="50"><input type="submit" value="로그인"></td>
	
</tr>
</table>
</form>
</body>
</html>