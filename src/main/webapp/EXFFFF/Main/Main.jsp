<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contentPage = request.getParameter("contentPage");
String contentPageSize = "85%";
String sidePage = request.getParameter("sidePage");
String sidebar = "sidebar";
String mainbody = "mainbody";
String nickname = "정보가 없습니다.";
String email = "정보가 없습니다.";
String phone = "정보가 없습니다.";

System.out.println("contentPage :: " + contentPage);

if(session.getAttribute("MBNUM")==null){
session.setAttribute("MBNUM", request.getAttribute("MBNUM"));
session.setAttribute("nickname", request.getAttribute("nickname"));
session.setAttribute("email", request.getAttribute("email"));
session.setAttribute("phone", request.getAttribute("phone"));
}
if(request.getAttribute("change")!=null){
	session.setAttribute("nickname", request.getAttribute("nickname"));
	session.setAttribute("email", request.getAttribute("email"));
	session.setAttribute("phone", request.getAttribute("phone"));
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
	height: 520px;
	margin-left: 1%;
	text-align: center;
	display: inline-block;
	line-height: 30px;
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

	<div id="body2">
		<div class="<%=sidebar%>"><jsp:include page="<%=sidePage %>"/></div>
	</div>
	
	<div id="body">
		<div class="<%=mainbody%>"><jsp:include page="<%=contentPage%>" /></div>
	</div>
	
	<div id="footer"></div>
</body>
</html>