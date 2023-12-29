<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String authmessage = "";
if(request.getAttribute("authmessage")!=null){
	authmessage = (String)request.getAttribute("authmessage");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foodfinder - exit</title>
</head>
<body>
	<h2> 회원 탈퇴 </h2>
	<p>비밀번호 확인</p>
	<form method="post" action="../MyPage/MyPageExitpass.do" name="MyPageExitpass">
		<input type="password" name="pwd"/>
		<input type="hidden" name="MBNUM" value="<%=session.getAttribute("MBNUM") %>"/>
		<input type="submit" value="확인"/>&nbsp;<%=authmessage%>
	</form>	
	<br>
	<c:if test="${exitpass=='0'}">
	<form method="post" action="../MyPage/MyPageExit.do" name="MyPageExit">
		<input type="hidden" name="MBNUM" value="<%=session.getAttribute("MBNUM") %>"/>
		<input type="submit" value="탈퇴하기"/>
	</form>
	</c:if>
</body>
</html>