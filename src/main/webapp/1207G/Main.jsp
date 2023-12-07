<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contentPage = request.getParameter("contentPage");
String contentPageSize = "85%";
String sidePage = request.getParameter("sidePage");
if (contentPage == null)
	contentPage = "MainBody.jsp";
if (sidePage == null) {
	sidePage = "";
	contentPageSize = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoonFinder - MainPage</title>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>

	<div id="body">
		<table width="100%">
			<tr>
				<td style="margin-left:8%"><jsp:include page="<%=sidePage %>"/></td>
				<td width="<%=contentPageSize%>"><jsp:include page="<%=contentPage%>" /></td>
			</tr>
		</table>
	</div>

	<div id="footer"></div>
</body>
</html>