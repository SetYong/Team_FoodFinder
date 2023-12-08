<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - QuestionBoard</title>
<style>
label:hover {
	color: white;
	background-color: gray;
}
</style>
</head>
<body>
	<label onclick="location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp'">문의하기</label>
	<br>
	<label onclick="location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/MemberBoard.jsp'">자유게시판</label>
</body>
</html>