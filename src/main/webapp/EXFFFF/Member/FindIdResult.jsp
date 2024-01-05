<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID - 아이디찾기</title>
<Style>
button{
    width: 100px;
    height: 45px;
    text-align: center;
    margin-top: 12px;
    border-radius: 20px;
    font-size: 14pt;
    border: 1px solid;
}
</Style>
</head>
<body>
	<h2 align="center">ID</h2>
		<table style = "width: 20%; height: 30px; margin-left: 38%;">
			<tr>
				<td style="width: 45%; text-align: center;"> 사용자 </td>
				<td style="text-align: right"> ${ memberName }</td>
			</tr>
			<tr>
				<td style="width: 45%; text-align: center; color: #1773EF;"> 아이디 </td>
				<td style="text-align: right; color: #1773EF;"> ${ memberId } </td>
			</tr>
			<tr>
				<td colspan = "2" style="padding-left: 45%;"><button type="button" onclick="location.href='../Main/Main.jsp?contentPage=../Member/Login.jsp'">확인</button></td>
			</tr>
		</table>
</body>
</html>