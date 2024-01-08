<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String checkpass = "";
if(request.getAttribute("checkpass")==null){
	checkpass = "";
} else {
	checkpass = (String)request.getAttribute("checkpass");
}
String nickpass = "";
if(request.getAttribute("nickpass")==null){
	nickpass = "";
} else {
	nickpass = (String)request.getAttribute("nickpass");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Member</title>
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
-webkit-appearance: none;
}
.password{ -webkit-text-security: disc;}
</style>
<script type="text/javascript">
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }
  } 
function checkSpecialCharacters(inputElement) {
    var inputValue = inputElement.value;
    var regex = /[ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎㅏㅑㅓㅕㅗㅛㅜㅠㅡㅣㅐㅔ]/;
	var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
    
    if (regExp.test(inputValue)) {
        alert("특수문자는 입력할 수 없습니다.");
        inputElement.value = inputValue.replace(/[^\w]/gi, ''); // 특수문자 제거
    }
    if (regex.test(inputValue)){
        alert("한글 입력할 수 없습니다.");
        inputElement.value = inputValue.replace(/[^\w]/gi, ''); // 특수문자 제거	
    }
}
function validateform(){
	var form = document.newform;
	var checkpass = document.getElementById("checkpass").value;
	var nickpass = document.getElementById("nickpass").value;
	if (form.id.value.length==0 || form.id.value==""){
		alert("아이디 중복확인을 하세요.");
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
	}else if (form.mail.value==""){
		alert("이메일을 입력하세요.");
		form.mail.focus();
		return false;
	}else if (form.Nickname.value==""){
		alert("닉네임을 입력하세요.");
		form.Nickname.focus();
		return false;
	} else if (checkpass==""){
		alert("아이디 중복확인을 해주세요.");
		return false;
	} else if (nickpass==""){
		alert("닉네임 중복확인을 해주세요.");
		return false;
	} else {
		return true;
	}
}
function nickcheck(){
	var form = document.newform;
	var nickname = form.Nickname.value;
	var msg = document.getElementById("nickcheckmsg");
	if(nickname.length == 0 || nickname == ""){
		msg.innerHTML = "닉네임을 입력하세요.";
		msg.style.color = "red";
	} else {
		form.method = "post";
		form.action = "../Member/Newmembernickcheck.do";
		form.submit();
	}
}
function idcheck(){
	var form = document.newform;
	var id = form.id.value;
	var msg = document.getElementById("idcheckmsg");
	if(id.length == 0 || id == ""){
		msg.innerHTML = "아이디를 입력하세요.";
		msg.style.color = "red";
	} 
	else {
		form.method = "post";
		form.action = "../Member/Newmembercheck.do";
		form.submit();
		}
    }
function togglePasswordVisibility() {
    var membercnInput = document.getElementById("membercn2");
    var toggleButton = document.getElementById("toggleBtn");

    if (membercnInput.type === "password") {
    	membercnInput.type = "text";
        toggleButton.innerHTML = "가리기";
    } else {
    	membercnInput.type = "password";
        toggleButton.innerHTML = "보이기";
    }
}
</script>
</head>
<body>
	<div align="center">
		<h2>회원가입</h2>
		<form name="newform" method="post" action="../Member/Newmember.do"
			onsubmit="return validateform()">
			<table>
				<tr height="50">
					<td height="50">아이디</td>
					<td height="50"><input type="text" id="userid" name="id"
						class="input_id" oninput="checkSpecialCharacters(this)"></td>
					<td height="50">
					<input type="hidden" id="checkpass" name="checkpass" value="<%=checkpass%>"/>
					<input type="hidden" id="nickpass" name="nickpass" value="<%=nickpass%>"/>
					<button type="button" id="idck"
							class="check_id" onclick="idcheck()">중복확인</button>
					</td><td><div id="idcheckmsg"></div>
					</td>
				</tr>
				<tr height="50">
					<td height="50">비밀번호</td>
					<td height="50"><input type="password" name="pass"
						id="userpwd"></td>
				</tr>
				<tr height="50">
					<td height="50">비밀번호 확인</td>
					<td height="50"><input type="password" name="passcheck"></td>
				</tr>
				<tr height="50">
					<td height="50">이름</td>
					<td height="50"><input type="text" name="username"></td>
				</tr>
				<tr height="50">
					<td height="50">닉네임</td>
					<td height="50"><input type="text" name="Nickname"></td>
					<td height="50"><button type="button" id="nickck"
							class="check_nick" onclick="nickcheck()">중복확인</button></td>
					<td><div id="nickcheckmsg"></div></td>
				</tr>
				<tr height="50">
					<td height="50">주민등록번호</td>
					<td><input type="number" name="memberCn1" maxlength=6
						oninput="maxLengthCheck(this)"> -</td>
					<td><input type="password" name="memberCn2"
						maxlength=7 id = "membercn2" oninput="maxLengthCheck(this)"></td>
					<td><button type="button" id="toggleBtn" onclick="togglePasswordVisibility()">보이기</button>
</td>
				</tr>
				<tr height="50">
					<td height="50">핸드폰 번호</td>
					<td><input type="number" name="memberPhone1" maxlength="3"
						oninput="maxLengthCheck(this)"> -</td>
					<td><input type="number" name="memberPhone2" maxlength="4"
						oninput="maxLengthCheck(this)"> -</td>
					<td><input type="number" name="memberPhone3" maxlength="4"
						oninput="maxLengthCheck(this)"></td>
				</tr>
				<tr height="50">
					<td height="50">이메일</td>
					<td height="50"><input type="text" name="mail1">@</td>
					<td height="50"><input type="text" name="mail2"></td>
				</tr>
				<tr height="50">
					<td height="50"><input type="submit" value="회원가입" id="targetbtn"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>