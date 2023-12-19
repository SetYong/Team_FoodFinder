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
	width: 200px;
	height: 650px;
	margin-left: 1%;
	text-align: center;
	display: inline-block;
	text-align: center;
}
.sidebar_Profile{
	width: 200px;
	height: 180px;
	border: solid 1px;
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
	margin-right: 75px;
}
label:hover{
background-color:gray;}
</style>
</head>
<body>
	<div><a href="../Member/Logout.jsp"><img src="../img/exit.png" alt="로그아웃" style="float: right; width: 30px; margin-right: 20px;"></a></div>
	<div>
		<div class="sidebar">
			<div class="sidebar_Profile">
				<h3 style="margin: auto;">내정보</h3>
				<img class="sidebar_Image" src="../img/test2.jpeg" alt="프로필"/>
				<p style="margin:auto;"> 관리자님
			</div>
		<div style="line-height: 30px">
			<label onclick="">공지사항</label> <br>
			<label onclick="location.href='AdminMain.jsp?contentPage=AdminQuestion.jsp'">문의 사항</label> <br>
			<label onclick="location.href='AdminMain.jsp'">권한 관련</label>
		</div>
	</div>
	<div class="<%=mainbody%>"><jsp:include page="<%=contentPage%>" /></div></div>
	
</body>
</html>