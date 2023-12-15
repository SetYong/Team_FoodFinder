<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contentPage = request.getParameter("contentPage");
String contentPageSize = "85%";
String sidePage = request.getParameter("sidePage");
String sidebar = "sidebar";
String mainbody = "mainbody";
if(session.getAttribute("MBNUM")==null){
session.setAttribute("MBNUM", request.getAttribute("MBNUM"));
}
if (contentPage == null)
	contentPage = "MainBody.jsp";
if (sidePage == null) {
	sidePage = "";
	contentPageSize = "";
	sidebar ="";
	mainbody = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoonFinder - MainPage</title>
<style>
.sidebar {
	float: left;
	border: 1px solid;
	width: 200px;
	height: 500px;
	margin-left: 1%;
	text-align: center;
	display: inline-block;
	background-color: green;
	text-align: center;
}
.mainbody {
	border: 1px solid;
	margin-left: 250px;
	margin-right: 75px;	
}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>

	<div id="body">
		<div class="<%=sidebar%>"><jsp:include page="<%=sidePage %>"/></div>
		<div class="<%=mainbody%>"><jsp:include page="<%=contentPage%>" /></div>
	</div>
	
	<div id="footer"></div>
</body>
</html>