<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contentPage = request.getParameter("contentPage");
String leftPage = request.getParameter("leftPage");
if (contentPage == null)
	contentPage = "Recomand.jsp";
if (leftPage == null) {
	leftPage = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - Main</title>
</head>
<body>
	 
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>
	<div id="main">
		<table>
			<tr>
				<td><jsp:include page="<%=leftPage%>" /></td>
				<td><jsp:include page="<%=contentPage%>" /></td>
			</tr>
		</table>
	</div>
	<div id="footer"></div>
</body>
</html>