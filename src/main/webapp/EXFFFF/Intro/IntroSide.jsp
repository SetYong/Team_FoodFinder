<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - IntroSide</title>
<style>
label:hover {
	color: white;
	background-color: gray;
}
</style>
</head>
<body>
	<a class="intro_1" href="../Intro/IntroList.do">공지사항</a>
	<br>
	<label class="intro_2" onclick="location.href='../Main/Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../Intro/Introevent.jsp';">이벤트</label>
	<br>
	<label class="intro_3" onclick="location.href='..//Main/Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../API/MapSearchView.jsp';">마트찾기</label>
</body>
</html>