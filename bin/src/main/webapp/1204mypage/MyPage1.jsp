<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>FoodFinder - MyPage(Tab)</title>
<script>
	function changeView(value) {
		if (value == "21") {
			location.href = "Main.jsp?contentPage=MyPage2.jsp";
		} else if (value == "22") {
			location.href = "Main.jsp";
		} else if (value == "23") {
			location.href = "Main.jsp";
		}
	}
</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td><a href="MyPage2.jsp" class="mypage_1">내 정보</a></td>
			</tr>
			<tr>
				<td><a href="#" onclick="changeView(22)" class="mypage_2">밥 일기</a></td>
			</tr>
			<tr>
				<td><a href="Setprofile1.jsp" class="mypage_3">정보 수정</a></td>
			</tr>
		</table>
	</div>
</body>
</html>