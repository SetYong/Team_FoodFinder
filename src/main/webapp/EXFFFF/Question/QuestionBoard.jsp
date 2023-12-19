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
width: 800px;
display: inlline-block;
background-color:blue;
}
</style>
</head>
<body>
<form name="QuestionForm" method="post" action="../Question/QuestionBoard.do" onsubmit="return validateForm(this);">
	<table border ="1" class="mainborad">
	<tr>
		<td align = "center" colspan="2">
			제목: <input type ="text" name="QuTitle"> <input type="hidden" name="MBNUM" value=<%= mbnum %>> 
		</td>
	</tr>
	<tr>
		<td >
			<select name = "QuCate">
				<option value = "이용문의">이용 문의</option>
				<option value = "오류신고">오류 신고</option>
			</select> </td>
			<td><textarea name="QuContent" cols="30" placeholder="문의하실내용을 입력해주세요" required></textarea></td>
	</tr>
	<tr> <td colspan="2"> <input type = "submit"  value = "문의하기"> </td> </tr>
	</table>
	</form>
</body>
</html>