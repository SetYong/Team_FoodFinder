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

.sidetable {
	float: left;
	border: 1px solid;
	width: 200px;
	height: 200px;
	margin-left: 2%;
	text-align: center;
	display: inline-block;
	background-color: green;
}
</style>
</head>
<body>
	<div class="sidetable">
		<label onclick="location.href='QuestionBoard.jsp'">문의하기</label> <br>
		<label onclick="location.href='MemberBoard.jsp'">자유게시판</label>
	</div>
</body>
</html>