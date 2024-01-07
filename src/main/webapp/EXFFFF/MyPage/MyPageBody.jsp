<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<style>
table{
width:100%;
}
.foodbody{
}
input[type=button]{
    margin-left: 40%;
    border-radius: 10px;
    width: 120px;
    height: 30px;
    background-color: lightsteelblue;
    border: none;
}
.foodBoard{
text-align: center;
line-height: 20px;
}
img{
width:100%;
height: 250px;
}
a{text-decoration:none;}
a:link{color : black}
a:visited{color: black}
a:hover{color: gray}
</style>
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
						<%=session.getAttribute("phone")%>
					</p>
				</div></td>
		</tr>
	</table>
</html>