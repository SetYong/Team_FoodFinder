<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contentPage = request.getParameter("contentPage");
String contentPageSize = "85%";
String mainbody = "mainbody";

System.out.println("contentPage :: " + contentPage);

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
			<label onclick="location.href='../Admin/AdminMain.jsp?contentPage=AdminNotice.do'">공지사항</label> <br>
			<label onclick="location.href='../Admin/AdminMain.jsp?contentPage=AdminEvent.do'">이벤트</label> <br>
			<label onclick="location.href='../Admin/AdminMain.jsp?contentPage=AdminQuestion.do'">문의사항</label> <br>
			<label onclick="location.href='../Admin/AdminMain.jsp?contentPage=AdminFoodList.do'">게시글승인</label>
		</div>
	</div>
	<div class="<%=mainbody%>"><jsp:include page="<%=contentPage%>" /></div></div>
	
</body>
</html>