<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - IntroSide</title>
<style>
a:hover{
text-decoration: none;
	cursor: pointer;
	outline: none;
	color: gray;
}
a{text-decoration:none;}
a:link{ color: black; }
a:visited {color: black;}
.content {
	padding: 0 18px;
	text-decoration-color: black;
	background-color: #f1f1f1;	
}
</style>
</head>
<body>
<div class="content">
	<a class="intro_1" href="../Intro/IntroList.do">공지사항</a>
	<br>
	<a class="intro_2" href="../Intro/IntroListEvent.do">이벤트</a>
	<br>
	<a class="intro_3" href="../Main/Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../API/MapSearchView.jsp">마트찾기</a>
	</div>
</body>
</html>