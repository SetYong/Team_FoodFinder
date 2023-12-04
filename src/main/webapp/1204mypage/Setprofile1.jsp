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
<title>FoodFinder - MyPage</title>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>
	<div>
		<table class="setprofile_table">
			<tr>
				<td rowspan="2" style="vertical-align: top">
					<div style="float: left">
						<jsp:include page="MyPage1.jsp" />
					</div>
				</td>
				<td width="85%"><h2 align="left" class="setprofile_head">정보 수정</h2>
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
			<tr>
				<td><div align="right">
						<button type="button" onclick="location.href='Setprofile2.jsp';">정보
							수정</button>
					</div></td>
			</tr>
		</table>
	</div>



</body>
</html>