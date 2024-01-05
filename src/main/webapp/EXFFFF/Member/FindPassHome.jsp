<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find PWD- 비밀번호 찾기</title>
<style>
.FindPwd{
text-align: center;
width: 95%;
height: 30px;
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
	<h2 style = "text-align: center;">PassWord</h2>
	<form name="findPwdForm" action="FindPassChange.jsp" onsubmit="return validateForm(this);">
		<table style="width: 20%;margin-left: 42%;">
			<tr>
				<td><input type="text" name="memberId" class = "FindPwd" id="email" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td><input type="email" name="memberIdEmail" class = "FindPwd" id="email" placeholder="이메일" pattern=".+@gmail\.com" required></td> 
				<td style = "width:5%"><input type="button" value="확인"></td>
			</tr>
			<tr>
				<td><input type="text" name="findCode" class = "FindPwd" placeholder="인증코드" required></td>
				<td><input type="button" value= "인증" onclick=""></td>
			</tr>			
			<tr>
				<td>
					<input type="submit" value="비밀번호 찾기" style="width: 55%;height: 30px;margin-top:10px;margin-left: 21%;">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>