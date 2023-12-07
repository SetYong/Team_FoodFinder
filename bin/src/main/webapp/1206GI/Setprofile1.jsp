<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String nickname = (String)session.getAttribute("nickname");
String mail = (String)session.getAttribute("mail");
String phone = (String)session.getAttribute("phone");
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