<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>FoodFinder - MyPage(Tab)</title>
<style>
label:hover {
	color: white;
	background-color: gray;
}
</style>
</head>
<body>
	<label
		onclick="location.href='Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageBody.jsp'"
		>내 정보</label>
	<br>
	<label
		onclick="location.href='Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPagediary.jsp'"
		>밥 일기</label>
	<br>
	<label
		onclick="location.href='Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageSetprofile.jsp'"
		>정보 수정</label>

</body>
</html>