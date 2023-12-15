<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contentPage = request.getParameter("contentPage");
String contentPageSize = "85%";
String mainbody = "mainbody";
if (contentPage == null)
	contentPage = "AdminBody.jsp";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Page</title>
<style>
.sidebar {
	float: left;
	border: 1px solid;
	width: 200px;
	height: 650px;
	margin-left: 1%;
	text-align: center;
	display: inline-block;
	background-color: green;
	text-align: center;
}
.sidebar_Profile{
	width: 200px;
	height: 200px;
	background-color: blue;
}
.sidebar_Image{
	margin: 10px;
	width:100px;
	height:100px;
	border-radius: 70%
}
.mainbody {
	border: 1px solid;
	margin-left: 250px;
	margin-right: 3%;
}
label:hover{
background-color:gray;}
</style>
</head>
<body>
	<div><a href="../Member/Logout.jsp"><img src="../img/exit.png" alt="로그아웃" style="float: right; width: 30px;"></a></div>
	<div>
		<div class="sidebar">
			<div class="sidebar_Profile">
				<h3 style="margin: auto;">내정보</h3>
				<img class="sidebar_Image" src="../img/test2.jpeg" alt="프로필"/>
				<p style="margin:auto;"> <%= request.getParameter("id") %> 님
			</div>
		<div>
			<label onclick="location.href='AdminMain.jsp?contentPage=AdminQuestion.jsp'">문의</label> <br>
			<label onclick="location.href='AdminMain.jsp'">권한</label>
		</div>
	</div>
	<div class="<%=mainbody%>"><jsp:include page="<%=contentPage%>" /></div></div>
	
</body>
</html>