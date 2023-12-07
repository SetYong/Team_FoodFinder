<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - IntroSide</title>
<script>
	function changeView(value) {
		if (value == "31") {
			location.href = "Main.jsp?sidePage=IntroSide.jsp&contentPage=IntroBody.jsp";
		} else if (value == "32") {
			location.href = "#";
		} else if (value == "33") {
			location.href = "#";
		} else if (value == "34") {
			location.href = "#";
		}
	}
</script>
</head>
<body>
	<div  style="float:left">
		<table>
			<tr>
				<td><a href="#" onclick="changeView(31)" class="intro_1">소개</a></td>
			</tr>
			<tr>
				<td><a href="#" onclick="changeView(32)" class="intro_2">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="#" onclick="changeView(33)" class="intro_3">이벤트</a></td>
			</tr>
			<tr>
				<td><a href="#" onclick="changeView(33)" class="intro_4">마트찾기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>