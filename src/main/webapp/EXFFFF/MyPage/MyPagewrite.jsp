<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function validateform(form){
		if (form.title.value==""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.date.value==""){
			alert("날짜를 선택하세요.");
			form.date.focus();
			return false;
		}
		if (form.timeCate.value==""){
			alert("시간을 선택해주세요.");
			form.timeCate.focus();
			return false;
		}
		if (form.text.value==""){
			alert("내용을 입력해주세요.");
			form.text.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form name="MyPageDiary" action="../MyPage/MyPagewrite.do" method="post" onsubmit="validateform(this)">
		<input type="hidden" name="MBNUM" value="<%=session.getAttribute("MBNUM")%>"/>
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
				<td colspan="3" align="center"><textarea name="text" cols="20" placeholder="식단을 입력해주세요"></textarea></td>
			</tr>
			<tr>
			<td colspan="3" align="right">
			<button type="reset">다시 작성</button>
			<button type="submit">일기 작성 완료</button>
			<button type="button" onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageList.jsp';">
			목록으로 돌아가기</button>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>