<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find PWD- 비밀번호 찾기</title>
<style>
.text{
text-align: right;
}
#email {
  border-style: solid;
}
#email:valid {
  border-color: green;
}
#email:invalid {
  border-color: red;
}
</style>
</head>
<body>
	<div>
		<h2>PassWord</h2>
		<form name="findPwdForm" action="FindPassChange.jsp" onsubmit="return validateForm(this);">
			<table>
				<tr>
					<td><input type="text" name="memberId" id="email" placeholder="아이디" required></td>
				</tr>
				<tr>
					<td><input type="email" name="memberIdEmail" id="email" placeholder="이메일" pattern=".+@gmail\.com" required></td> 
					<td><input type="button" value="확인"></td>
				</tr>
				<tr>
					<td><input type="text" name="findCode" placeholder="인증코드" required></td>
					<td><input type="button" value= "인증" onclick=""></td>
				</tr>
			</table>
				<input type="submit" value="비밀번호 찾기">
		</form>
	</div>
</body>
</html>