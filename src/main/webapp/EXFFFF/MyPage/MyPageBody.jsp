<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("nickname", request.getAttribute("nickname"));
session.setAttribute("email", request.getAttribute("email"));
session.setAttribute("phone", request.getAttribute("phone"));

String phone = (String)session.getAttribute("phone");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>FoodFinder - MyPage(home)</title>
</head>
	<table class="setprofile_table">
		<tr>
			<td width="85%"><h2 align="left" class="setprofile_head">내 정보</h2>
				<div class="setprofile_box">
					<img class="setprofile_img" src="../img/test2.jpeg">
					<p align="left">
						<br>별명 :
						<%=session.getAttribute("nickname")%>
						<br> <br> 이메일 :
						<%=session.getAttribute("email")%>
						<br> <br> 핸드폰 :
						<%=phone%>
					</p>
				</div></td>
		</tr>
	</table>
		<h4>공감한 레시피</h4>
		<table>
			<tr>
				<td>반갑습니다</td>
				<td>안녕하세요</td>
			</tr>
		</table>
</html>