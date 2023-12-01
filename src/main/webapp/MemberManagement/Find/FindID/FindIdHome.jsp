<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID - 아이디 찾기</title>
<Style>
form{
background-color: blue;
}
div{
background-color: green;
display: inline-block;
}
table{
background-color: red;
padding: 20px;
}
.smbt{
  color: black; 
  padding: 10px 25px;
  display: inline-block;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom-color: rgba(0,0,0,0.34);
  text-shadow:0 1px 0 rgba(0,0,0,0.15);
  box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
              0 2px 0 -1px rgba(0,0,0,0.13), 
              0 3px 0 -1px rgba(0,0,0,0.08), 
              0 3px 13px -1px rgba(0,0,0,0.21);
 margin: 9px;
 border-radius: 10px;
 align: center;
}
.text{
text-align: right;
}
</Style>
</head>
<body>
<div align=center>
	<h2 align="center">ID</h2>
	<form name="findIdForm" action="FindIdProcess.jsp" onsubmit="return validateForm(this);">
		<table>
			<tr>
				<td class="text">이름</td>
				<td><input type="text" name="memberName" placeholder="홍길동" size="5" maxlength=5 autofocus></td>
			</tr>
			<tr>
				<td class="text">주민등록번호</td>
				<td><input type="text" name="memberCn1" maxlength=6 size="5"> - </td>
				<td><input type="password" name="memberCn2" maxlength=7 size="5"> </td>
			</tr>
			<tr>
				<td class="text">핸드폰</td>
				<td><input type="text" name="memberPhone1" size="3" maxlength="3"> - </td>
				<td><input type="text" name="memberPhone2" size="3" maxlength="4"> - </td>
				<td><input type="text" name="memberPhone3" size="3" maxlength="4"> </td>
			</tr>
		</table>
		<input class="smbt" type="submit" value="아이디찾기">
	</form>
</div>
</body>
</html>