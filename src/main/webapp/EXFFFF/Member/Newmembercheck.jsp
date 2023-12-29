<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - 아이디 중복확인</title>
<script type="text/javascript">
	function sendid() {
		window.opener.document.getElementById("userid").value = document
				.getElementById("checkid").value;
		window.close();
	}
function setmsg(){
	const element = document.getElementById("msg_div");
	var form = document.idcheck;
	var id = form.userId.value;
	if( id != "" ) {
		form.method = "post";
		form.action = "../Member/Newmembercheck.do";
		form.submit();
	} else if(id == ""){
		element.innerHTML = '<div style="color: red">아이디를 입력해주세요</div>';
		element.style.color = "red";
	}
}
</script>
</head>
<body>
	<h3>아이디 중복확인</h3>
	<form name="idcheck">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" id="checkid" /></td>
				<td><input type="button" value="중복확인" onclick="setmsg()"/>
			</tr>
		</table>
		<div id="msg_div"></div>
		<input type="button" onclick="sendid();" value="사용하기">
	</form>
	
</body>
</html>