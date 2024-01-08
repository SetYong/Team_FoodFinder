<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String mbnum = session.getAttribute("MBNUM").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - QuestionBoard</title>
<style>
textarea{
Width: 99%;
height: 420px;
resize: none;
margin-left: 3px;
}
input[type="submit"]{
width: 10%;
height: 50px;
border-radius: 15px;
}
.mainborad{
position: static;
width: 100%;
}
</style>
</head>
<body>
<script>  
function validateForm(form){
	var form = document.QuestionForm;
	if(form.QuTitle.value==""){
		alert("제목을 입력해주세요.");
		return false;
	}
	if (confirm("문의 하시겠습니까?")) {
		alert("문의가 완료되었습니다!")
	} 
	else {
		return false;
		}
	}
</script>
<form name="QuestionForm" method="post" action="../Question/QuestionBoard.do" onsubmit="return validateForm(this);">
	<table border ="1" class="mainborad">
	<tr>
		<td style="text-align: center; width: 85%;">
			제목: <input type ="text" name="QuTitle" style="width: 80%;height: 30px;"> <input type="hidden" name="MBNUM" value=<%= mbnum %>> 
		</td>
		<td style="text-align: center;">
			<select name = "QuCate">
				<option value = "이용문의">이용 문의</option>
				<option value = "오류신고">오류 신고</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td colspan ="2"><textarea name="QuContent" cols="30" placeholder="문의하실내용을 입력해주세요" required></textarea></td>
	</tr>
	<tr> <td colspan="2" style="text-align: center;"> <input type = "submit"  value = "문의하기"> </td> </tr>
	</table>
	</form>
</body>
</html>