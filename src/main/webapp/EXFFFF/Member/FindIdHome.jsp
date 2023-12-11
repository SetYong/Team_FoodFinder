<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID - 아이디 찾기</title>
<script>
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }
  }
  
function validateForm(form){
	if(!form.memberName.value){
		alert("이름를 입력해주세요.");
		return false;
	}
	if(form.memberCn1.value == "" || form.memberCn2.Value ==""){
		alert("주민등록번호를 입력해주세요.");
		return false;
	}
	if(form.memberPhone1.value =="" && form.memberPhone2.value =="" && form.memberPhone3.value==""){
		alert("핸드폰 번호를 입력해주세요.");
		return false;
	}
}
  </script>
<Style>

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
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
-webkit-appearance: none;
}

input[type="number"]{
width: 8em;
}
.password{ -webkit-text-security: disc;}
</Style>
</head>
<body>
<div align=center>
	<h2 align="center">ID</h2>
	<form name="findIdForm" action="FindIdProcess.jsp" onsubmit="return validateForm(this);">
		<table>
			<tr>
				<td><input type="text" name="memberName" placeholder="이름" size="20" maxlength=5 autofocus></td>
			</tr>
			<tr>
				<td><input type="number" name="memberCn1" placeholder="주민등록번호" maxlength=6 oninput="maxLengthCheck(this)"> - </td>
				<td><input type="number" name="memberCn2" class=password maxlength=7 oninput="maxLengthCheck(this)"> </td>
			</tr>
			<tr>
				<td><input type="number" name="memberPhone1" placeholder="핸드폰" maxlength="3" oninput="maxLengthCheck(this)"> - </td>
				<td><input type="number" name="memberPhone2" maxlength="4" oninput="maxLengthCheck(this)"> - </td>
				<td><input type="number" name="memberPhone3" maxlength="4" oninput="maxLengthCheck(this)"> </td>
			</tr>
		</table> <br>
		<span style = "font-size: 1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
		</span> <br>
		<input class="smbt" type="submit" value="아이디찾기">
	</form>
</div>
</body>
</html>