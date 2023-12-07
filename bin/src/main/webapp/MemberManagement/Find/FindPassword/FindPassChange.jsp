<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find PWD - 비밀번호 찾기</title>
</head>
<body>
<div>
	<h2>PassWord</h2>
	<%= request.getParameter("memberId") %>, <%= request.getParameter("memberIdEmail")%>
	<form>
		<table>
			<tr>
				<td><input type="password" name="memberNewPwd" placeholder="비밀번호"></td> 
			</tr>
			<tr>
				<td><input type="password" name="memberNewPwd" placeholder="비밀번호 확인"></td> 
			</tr>
			<tr>
				<td><input type="button" value="확인" onclick="location.href='FindPassResult.jsp'"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>