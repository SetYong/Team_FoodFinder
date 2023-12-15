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
		onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageBody.jsp'"
		>내 정보</label>
	<br>
	<form action="../MyPage/MyPageView.do" method="post" name="MyPageVuew">
	<input type="hidden" value="<%=session.getAttribute("MBNUM") %>" name="MBNUM"/>
	<input type="submit" value="밥 일기" name="diary"/>
	</form>
	<br>
	<label
		onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageSetprofilepass.jsp'"
		>정보 수정</label>

</body>
</html>