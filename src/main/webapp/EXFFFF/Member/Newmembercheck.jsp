<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - 아이디 중복확인</title>
<script>
function clear(){
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
				<td><input type="text" name="id"/></td>
				<td><button type="submit">중복확인</button>
			</tr>
			<tr>
			<td><button type="button" onclick="clear()">완료</button></td>
			</tr>
		</table>
	</form>
</body>
</html>