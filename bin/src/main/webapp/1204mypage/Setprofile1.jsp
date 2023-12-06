<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String nickname = "밥도둑";
String mail = "abc@gmail.com";
String phone = "010-1234-5678";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>FoodFinder - MyPage(profile)</title>
</head>
<body>
	<div>
		<table class="setprofile_table">
			<tr>
				<td width="85%"><h2 align="left" class="setprofile_head">내 정보</h2>
					<div align="center" class="setprofile_box">
						<img class="setprofile_img" src="../img/test2.jpeg">
						<p align="left">
							<br>별명 :
							<%=nickname%>
							<br>
							<br> 이메일 :
							<%=mail%>
							<br> <br> 핸드폰 :
							<%=phone%>
						</p>
					</div></td>
			</tr>
		</table>
	</div>
</body>
</html>