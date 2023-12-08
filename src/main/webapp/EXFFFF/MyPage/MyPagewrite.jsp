<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - MyPage(write)</title>
<style>
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
	<form name="MyPageDiary">
		<table border="1" class="diarywrite">
			<tr>
				<td align="center" colspan="2">제목 : <input type="text" name="diary"></td>
			</tr>
			<tr>
				<td><select name="MyCate">
						<option value="아침">아침</option>
						<option value="점심">점심</option>
						<option value="저녁">저녁</option>
				</select></td>
				<td rowspan="2"><textarea name="MyDiary" cols="20" placeholder="식단을 입력해주세요"
						required></textarea></td>
			</tr>
			<tr>
				<td>작성일 : <select name="MyDiaryDate"></select>
			</tr>
		</table>
	</form>
</body>
</html>