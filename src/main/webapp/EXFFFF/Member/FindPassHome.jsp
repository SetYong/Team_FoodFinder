<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find PWD- 비밀번호 찾기</title>
<script type="text/javascript">
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
        	object.value = object.value.slice(0, object.maxLength);
      	}
    }
	
	function validateForm(form){
		if(!form.memberId.value){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(form.memberIdEmail.value == ""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		var memberPhone = form.memberPhone.value;
		if(memberPhone == "" || memberPhone.length !== 11){
			alert("핸드폰 번호를 11자리로 입력해주세요.");
			return false;
		}
	}
</script>
<style>
.FindPwd{
text-align: center;
width: 95%;
height: 30px;
}
#email {
  border-style: solid;
}
#email:valid {
  border-color: green;
}
#email:invalid {
  border-color: red;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
-webkit-appearance: none;
}
</style>
</head>
<body>
	<h2 style = "text-align: center;">PassWord</h2>
	<form name="findPwdForm" action="../Member/FindPassCheck.do" onsubmit="return validateForm(this);">
		<table style="width: 20%;margin-left: 41%;">
			<tr>
				<td><input type="text" name="memberName" class = "FindPwd" id="email" placeholder="이름" required></td>
			</tr>
			<tr>
				<td><input type="email" name="memberIdEmail" class = "FindPwd" id="email" placeholder="이메일" required></td> 
			</tr>
			<tr>
				<td><input type="number" name="memberPhone" class = "FindPwd" placeholder="핸드폰 번호를 입력해 주세요." maxlength="11" oninput="maxLengthCheck(this)"></td>
			</tr>			
			<tr>
				<td>
					<input type="submit" value="비밀번호 찾기" style="width: 55%;height: 30px;margin-top:10px;margin-left: 21%;">
				</td>
			</tr>
			<tr>
				<td> 
					<span style = "font-size: 1em;">
					<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
					</span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>