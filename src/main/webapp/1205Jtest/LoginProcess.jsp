<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setCharacterEncoding("UTF-8");
		String center = request.getParameter("center");
		String logout = request.getParameter("logout");
		if (logout != null) {
			//id값에 null 값을 넣음
			session.setAttribute("id", null);
			//세션시간 0. 로그아웃 처리
			session.setMaxInactiveInterval(0);
		}
		if (center == null) {
			center = "Main.jsp";
		}
		%>
	<!-- center -->
	<tr height="300">
		<td width="300" align="center"><jsp:include page="<%=center%>" />
		</td>
	</tr>
	</table>

</body>
</html>