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
}</style>
</head>
<body>
	<div  style="float:left">
		<table>
			<tr>
				<td><label onclick="location.href='Main.jsp?sidePage=IntroSide.jsp&contentPage=IntroBody.jsp'" class="intro_1">소개</label></td>
			</tr>
			<tr>
				<td><label class="intro_2">공지사항</label></td>
			</tr>
			<tr>
				<td><label class="intro_3">이벤트</label></td>
			</tr>
			<tr>
				<td><label class="intro_4">마트찾기</label></td>
			</tr>
		</table>
	</div>
</body>
</html>