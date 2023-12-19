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
			<tr>
				<td>닉네임&nbsp; : &nbsp;<input type="text" name="nickname"/></td>
			</tr>
			<tr>
				<td>이메일&nbsp; : &nbsp;<input type="text" name="email"/></td>
			</tr>
			<tr>
				<td>핸드폰&nbsp; : &nbsp;<input type="text" name="phone"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="정보 변경하기"/></td>
			</tr>
		</table>
		<input type="hidden" name="MBNUM" value="<%= session.getAttribute("MBNUM")%>"/>
	</form>
</body>
</html>