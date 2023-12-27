<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - 아이디 중복확인</title>
<script type="text/javascript">
function sendid(){
	window.opener.document.getElementById("userid").value = document.getElementById("checkid").value;
	window.close();
}
</script>
</head>
<body>
	<h3>아이디 중복확인</h3>
	<form name="idcheck" onsubmit="../Member/Newmembercheck.do">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="checkid" id="checkid"/></td>
				<td><button type="submit">중복확인</button>
			</tr>
			<tr>
			<td><input type="button" onclick="sendid();" value="창 닫기"></td>
			</tr>
		</table>
	</form>
</body>
</html>