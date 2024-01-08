<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - IntroSide</title>
<link rel="stylesheet" href="../css/custom.css">
<style>
.content {
	padding: 0 18px;
	text-decoration-color: black;
	background-color: #f1f1f1;	
}
.intro:hover{
	cursor: pointer;
	outline: none;
	color: gray;
}
.intro:link{
	color: black;
}
</style>
</head>
<body>
<div class="content">
	<a class="intro" style="text-decoration-line: none;" href="../Intro/IntroList.do">공지사항</a>
	<br>
	<a class="intro" style="text-decoration-line: none;" href="../Intro/IntroListEvent.do">이벤트</a>
	<br>
	<a class="intro" style="text-decoration-line: none;" href="../Main/Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../API/MapSearchView.jsp">마트찾기</a>
	</div>
</body>
</html>