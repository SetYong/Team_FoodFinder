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
	var memberPhone = form.memberPhone.value;
	if(memberPhone == "" || memberPhone.length !== 11){
		alert("핸드폰 번호를 11자리로 입력해주세요.");
		return false;
	}
}
  </script>
<Style>

.smbt{
  width: 100%;
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
 border-radius: 10px;
 margin-top: 10px;
 margin-left: 5px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button{
-webkit-appearance: none;
}
.password{ 
	-webkit-text-security: disc;
	width: 100%;
	height: 40px;
	text-align:center;
}

.FindIDnameAndPhone{
    width: 100%;
    height: 40px;
    text-align: center;
    }
.FindIDmemberCn{
    width: 98%;
    height: 40px;
    text-align: center;
}
</Style>
</head>
<body>
<div align=center>
	<h2 align="center">ID</h2>
	<form name="findIdForm" action="../Member/FindIdHome.do" onsubmit="return validateForm(this);">
		<table>
			<tr>
				<td colspan = "3"><input type="text"  name="memberName" class = "FindIDnameAndPhone" placeholder="이름을 입력해 주세요." size="20" maxlength=5 autofocus></td>
			</tr>
			<tr>
				<td><input type="number" name="memberCn1" class = "FindIDmemberCn" placeholder="주민등록번호를" maxlength=6 oninput="maxLengthCheck(this)"></td>
				<td><span style="padding-left: 4px; font-size:15pt;">-</span></td>
				<td><input type="number" name="memberCn2" class=password placeholder ="입력해 주세요." maxlength=7 oninput="maxLengthCheck(this)"> </td>
			</tr>
			<tr>
				<td colspan = "3"><input type="number" name="memberPhone" class="FindIDnameAndPhone" placeholder="핸드폰 번호를 입력해 주세요." maxlength="11" oninput="maxLengthCheck(this)"></td>
			</tr>
			<tr>
				<td colspan ="3"> <input class="smbt" type="submit" value="아이디찾기"> </td>
			</tr>
		</table>
		<table style="margin-top: 1%; margin-left: 1%;">
			<tr>
				<td> 
					<span style = "font-size: 1.2em;">
					<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
					</span>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>