<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - QuestionBoard</title>
<style>
textarea{
Width: 1100px;
height: 500px;
resize: none;
}
input[type="button"]{
padding: 10x;
display: inline-block;
}
.mainborad{
position: static;
width: 1200px;
display: inlline-block;
background-color:blue;
}
</style>
</head>
<body>
<form name="QuestionForm" action="QuestionProcess.jsp" onsubmit="return validateForm(this);">
	<table border ="1" class="mainborad">
	<tr>
		<td align = "center" colspan="2">
			제목: <input type ="text" name="QuTitle">
		</td>
	</tr>
	<tr>
		<td >
			<select name = "Qucate">
				<option value = "title">이용 문의</option>
				<option value = "content">오류 신고</option>
			</select> </td>
			<td><textarea name="QuContent" cols="30" placeholder="문의하실내용을 입력해주세요" required></textarea></td>
	</tr>
	<tr> <td colspan="2"> <input type = "submit"  value = "문의하기"> </td> </tr>
	</table>
	</form>
</body>
</html>