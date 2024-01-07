<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder</title>
</head>
<body>
	<form method="post" action="../MyPage/MyPageSetprofile.do" name="MyPageSetprofile">
		<table align="center">	
			<tr height="50">
				<td height="50">닉네임&nbsp; : &nbsp;</td>
				<td height="50"><input type="text" name="nickname"/></td>
				<td></td>
				<td></td>
			</tr>
			<tr height="50">
					<td height="50">핸드폰 번호&nbsp; : &nbsp;</td>
					<td><input type="number" name="memberPhone1" maxlength="3"
						oninput="maxLengthCheck(this)">&nbsp; - &nbsp;</td>
					<td><input type="number" name="memberPhone2" maxlength="4"
						oninput="maxLengthCheck(this)">&nbsp; - &nbsp;</td>
					<td><input type="number" name="memberPhone3" maxlength="4"
						oninput="maxLengthCheck(this)"></td>
				</tr>
				<tr height="50">
					<td height="50">이메일&nbsp; : &nbsp;</td>
					<td height="50"><input type="text" name="mail1">&nbsp; @ &nbsp;</td>
					<td height="50"><input type="text" name="mail2"></td>
					<td></td>
				</tr>
			<tr>
				<td><input type="submit" value="정보 변경하기"/></td>
			</tr>
		</table>
		<input type="hidden" name="MBNUM" value="<%= session.getAttribute("MBNUM")%>"/>
	</form>
</body>
</html>