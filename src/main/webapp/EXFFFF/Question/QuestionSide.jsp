<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
System.out.println("사이드바 : " + session.getAttribute("MBNUM"));
%>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - QuestionBoard</title>
<style>
label:hover {
	color: white;
	cursor: pointer;
	outline: none;
}

.content {
	padding: 0 18px;
	background-color: #f1f1f1;	
}

</style>
</head>
<body>
	<div class="content">
		<label
			onclick="location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp'">문의하기</label>
		<br> <label
			onclick="location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QeustionListUser.do'">내
			문의사항</label>
	</div>
</body>
</html>