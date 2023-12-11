<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>회원가입</h2>
		<form method="post" action="./Newmember.do">
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
					<td><input type="number" name="memberCn1" maxlength=6 oninput="maxLengthCheck(this)"> -</td>
					<td><input type="number" name="memberCn2" class=password maxlength=7 oninput="maxLengthCheck(this)"></td>
				</tr>
				<tr height="50">
					<td height="50">핸드폰 번호</td>
					<td><input type="number" name="memberPhone1" maxlength="3" oninput="maxLengthCheck(this)"> -</td>
					<td><input type="number" name="memberPhone2" maxlength="4" oninput="maxLengthCheck(this)"> -</td>
					<td><input type="number" name="memberPhone3" maxlength="4" oninput="maxLengthCheck(this)"></td>
				</tr>
				<tr height="50">
					<td height="50">이메일</td>
					<td height="50"><input type="text" name="e-mail"></td>
				</tr>
				<tr height="50">
					<td height="50">닉네임</td>
					<td height="50"><input type="text" name="Nickname"></td>
				</tr>
				<tr height="50">
					<td height="50"><input type="submit" value="회원가입"
						onclick="location.href='Main.jsp';"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>