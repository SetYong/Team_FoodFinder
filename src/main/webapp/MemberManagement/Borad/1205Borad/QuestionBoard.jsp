<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의</title>
<Style>

input[type="button"]{
padding: 10x;
display: inline-block;
}
.mainborad{
position: static;
width: 1200px;
margin-left: 18%;
display: inlline-block;
background-color:blue;
}
.sidetable{
float: left;
border: 1px solid;
width: 200px;
height: 200px;
margin-left:2%;
text-align: center;
display: inline-block;
background-color:green;
}
label:hover{
color: white;
background-color: gray;
}
textarea{
Width: 1100px;
height: 500px;
resize: none;
}
</Style>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>
	
	<div class="sidetable">
		<label onclick="location.href='QuestionBoard.jsp'">문의하기</label> <br>
		<label onclick="location.href='MemberBoard.jsp'">자유게시판</label>
	</div>
	<form name="QuestionForm" action="QuWriteProcess.jsp" onsubmit="return validateForm(this);">
	<table border ="1" class="mainborad">
	<tr>
		<td align = "center" colspan="2">
			제목: <input type ="text" name="QuTitle">
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