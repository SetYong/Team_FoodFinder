<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID - 아이디 찾기</title>
<script>
function checkNumber(event) {   
	if(event.key >= 0 && event.key <= 9) {
		return true;
		}
		return false;
}
	</script>
<Style>
form {
  position: absolute;
	top: 10%;
	left: 30%;
	width: 500px;
	height: 100px;
	padding: 30px;
	margin: auto;
	font-color: black;
	text-align: center;
	border: 3px solid black;
	display: block;
	background-color: gray;
}
div{
	background-color: green;}
input{
	text-align:center; 
}
</Style>
</head>
<body>
	<form name="findIdForm" action="FindIdProcess.jsp" onsubmit="return validateForm(this);">
	<h2 align="center">ID</h2>
	<div>
		이름 <input type="text" name="memberName" placeholder="홍길동" size="3" autofocus> <br>
		주민등록번호 
			<input type="text" name="memberCn1" maxlength=6 onkeypress='return CheckNum(key)' size="5"> - 
			<input type="password" name="memberCn2" maxlength=7 size="5"> <br> 
		핸드폰 
			<input type="text" name="memberPhone1" onkeypress='return CheckNum(key)' size="3" maxlength="3"> - 
			<input type="text" name="memberPhone2" size="3" maxlength=4> - 
			<input type="text" name="memberPhone3" size="3" maxlength=4> <br>
		<input type="submit" value="아이디찾기">
	</div>
	가나다라마바사ㅏㄹ아ㅏㄹ홓ㄹㅇㅀㅇㄹㄴㄴㅇ놀
	</form>
</body>
</html>