<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의</title>
</head>
<body>
<% if(session.getAttribute("MBNUM") == null)
{ 
%>
	<script>
		
		if(confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?" )){
			location.href='../Main/Main.jsp?contentPage=../Member/Login.jsp';
		}
		else{
			location.href='../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp';
		}
	</script>
<%
} else{ 
%>
	<table border=1 style="width: 1195px;">
		<tr>
			<th width = "10%">번호</th>
			<th width = "50%">제목</th>
			<th width = "15%">카테고리</th>
			<th width = "15%">작성일</th>
			<th width = "10%">읽음</th>
		</tr>

		<tr>
			<td colspan="5" align="center">작성된 내용이 없어요!</td>
		</tr>
		
		<tr>
		
		</tr>
	</table>
<%
} 
%>
</body>
</html>