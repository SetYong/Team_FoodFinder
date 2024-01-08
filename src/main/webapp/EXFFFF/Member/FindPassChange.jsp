<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find PWD- 비밀번호 찾기</title>
<script type="text/javascript">
	function passcheck(form) {
		if(form.memberpass.value != form. memberpasscheck.value){
			alert("비밀번호가 일치하지 않습니다.");
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
</style>
</head>
<body>
	<h2 style = "text-align: center;">PassWord</h2>
	<form name="findPwdForm" action="../Member/FindPassChange.do" onsubmit ="return passcheck(this)">
		<input type = "hidden" name ="mbnum" value = ${ dto.mbnum }>
		<table style="width: 20%;margin-left: 41%;">
			<tr>
				<td><input type="text" name="memberpass" class = "FindPwd" placeholder="비밀번호" required></td> 
			</tr>
			<tr>
				<td><input type="text" name="memberpasscheck" class = "FindPwd" placeholder="비밀번호 확인" required></td>
			</tr>			
			<tr>
				<td>
					<input type="submit" value="비밀번호 변경" style="width: 55%;height: 30px;margin-top:10px;margin-left: 21%;">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>