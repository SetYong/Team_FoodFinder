<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("MBNUM", session.getAttribute("MBNUM"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - MyPage(write)</title>
<link rel="icon" href="data:;base64, iVBORwOKGgo=">
<style type="text/css">
textarea {
	Width: 600px;
	height: 300px;
	resize: none;
}
.diarywrite{
position: static;
width: 1000px;
display: inlline-block;
background-color:#BBBBBB;
}
</style>
</head>
<body>
	<form name="MyPageDiary" action="../MyPage/MyPagewrite.do" method="post">
		<table border="1" class="diarywrite">
			<tr>
				<td align="center" >제목 : <input type="text" name="title"></td>
				<td align="center">일자<input type="date" name="date" min="2023-12-01" max="2024-12-31" />
				<td align="center"><select name="timeCate">
						<option value="아침">아침</option>
						<option value="점심">점심</option>
						<option value="저녁">저녁</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="3" align="center">API 칼로리 계산기 넣기</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><textarea name="text" cols="20" placeholder="식단을 입력해주세요" required></textarea></td>
			</tr>
			<tr>
			<td colspan="3" align="right"><button type="submit">일기 작성 완료</button></td>
			</tr>
		</table>
	</form>
</body>
</html>