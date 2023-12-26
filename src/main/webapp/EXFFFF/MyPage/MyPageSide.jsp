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
a{
text-decoration:none;
color: black;
}
a:hover {
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
	<a href="../MyPage/MyPagelist.do?MBNUM=<%=session.getAttribute("MBNUM")%>">밥 일기</a>
	<br>
	<label
		onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageSetprofilepass.jsp'"
		>정보 수정</label>

</body>
</html>