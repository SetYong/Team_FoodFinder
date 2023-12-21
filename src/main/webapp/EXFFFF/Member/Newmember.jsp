<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String checkmessage = "";
if(request.getAttribute("checkmessage")!=null){
	checkmessage = (String)request.getAttribute("checkmessage");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Member</title>
<script type="text/javascript">
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }
  } 
function validateform(){
	var form = document.newform;
	if (form.id.value.length==0 || form.id.value==""){
		alert("아이디 입력하세요.");
		form.id.focus();
		return false;
	}else if (form.pass.value.length==0 || form.pass.value==""){
		alert("비밀번호를 입력하세요.");
		form.pass.focus();
		return false;
	}else if (form.passcheck.value.length==0 || form.passcheck.value==""){
		alert("비밀번호를 다시 입력해주세요.");
		form.passcheck.focus();
		return false;
	}else if(form.pass.value != form.passcheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		form.passcheck.focus();
		return false;
	}else if (form.name.value==""){
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
	}else if (form.memberCn1.value==""){
		alert("주민등록번호를 입력하세요.");
		form.memberCn1.focus();
		return false;
	}else if (form.memberCn2.value==""){
		alert("주민등록번호를 입력하세요.");
		form.memberCn2.focus();
		return false;
	}else if (form.memberPhone1.value==""){
		alert("핸드폰 번호를 입력하세요.");
		form.memberPhone1.focus();
		return false;
	}else if (form.memberPhone2.value==""){
		alert("핸드폰 번호를 입력하세요.");
		form.memberPhone2.focus();
		return false;
	}else if (form.memberPhone3.value==""){
		alert("핸드폰 번호를 입력하세요.");
		form.memberPhone3.focus();
		return false;
	}else if (form.e-mail.value==""){
		alert("이메일을 입력하세요.");
		form.e-mail.focus()
		return false;
	}else if (form.Nickname.value==""){
		alert("닉네임을 입력하세요.");
		form.Nickname.focus();
		return false;
	}else {
		form.method="post";
		form.action="../Main/Newmember.do";
	}
}
function checkid(){
	var form = document.newform;
	var id = form.id.value;
	if(id.length==0 || id==""){
		alert("아이디를 입력해주세요.");
		form.id.focus();
	}else {
		window.open("Newmembercheck.jsp","아이디 중복확인", "width=500, height=300");
	}
	
}
</script>
</head>
<body>
	<div align="center">
		<h2>회원가입</h2>
		<form name="newform" id="test" onsubmit="return validateform()">
			<table>
				<tr height="50">
					<td height="50">아이디</td>
					<td height="50"><input type="text" name="id"></td>
					<td height="50"><button type="button" onclick="checkid()">중복확인</button>
					&nbsp;<%=checkmessage %>
					<input type="hidden" name="idcheckpass" value="idUncheck"/>
					</td>
				</tr>
				<tr height="50">
					<td height="50">비밀번호</td>
					<td height="50"><input type="password" name="pass"></td>
				</tr>
				<tr height="50">
					<td height="50">비밀번호 확인</td>
					<td height="50"><input type="password" name="passcheck"></td>
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
					<td height="50"><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>