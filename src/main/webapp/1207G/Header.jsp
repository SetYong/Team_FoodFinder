<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>today's food</title>
<style>
label:hover {
	color: white;
	background-color: gray;
}</style>
</head>
<body>
<%
	if(session.getAttribute("user_Id")==null){
%>
	<div align="right">
	<label onclick="location.href='Main.jsp?contentPage=Login.jsp'" class="menu_login">
	로그인
	</label>
	&nbsp;&nbsp;&nbsp;
	<label onclick="location.href='Main.jsp?contentPage=Newmember.jsp'" class="menu_login">
	회원가입
	</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
<%
	} else{	
%>
	<div align="right">
	<label onclick="location.href='Main.jsp?contentPage=Logout.jsp'" class="menu_login">
	로그아웃
	</label>
	</div>
<%
}
%>
	
	&nbsp;&nbsp;&nbsp;
	<div align="left">
		<a href="Main.jsp">
		<img class="logo_img" src="../img/test2.jpeg">
		</a>
		
		<label onclick="location.href='Main.jsp?sidePage=IntroSide.jsp&contentPage=IntroBody.jsp'" class="menu_intro">안내</label>
		<label onclick="location.href='Main.jsp?sidePage=foodside.jsp&contentPage=foodbody.jsp'" class="menu_food">음식</label>
		<label onclick="location.href='Main.jsp?sidePage=QuestionSide.jsp&contentPage=QuestionBody.jsp'" class="menu_qna">고객문의</label>
		<label onclick="location.href='Main.jsp?sidePage=MyPageSide.jsp&contentPage=MyPageBody.jsp'" class="menu_mypage">마이페이지</label>
	</div>
	&nbsp;
</body>
</html>