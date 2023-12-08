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
		
		<label onclick="location.href='Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../Intro/IntroBody.jsp';" class="menu_intro">안내</label>
		<label onclick="location.href='Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/foodbody.jsp';" class="menu_food">음식</label>
		<label onclick="location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp';" class="menu_qna">고객문의</label>
<%
if(session.getAttribute("user_Id")==null){
	System.out.println(session.getAttribute("user_Id"));
%>
<label onclick="location.href='Main.jsp?contentPage=Login.jsp'" class="menu_mypage">마이페이지</label>
<%
} else {
System.out.println("나야!" + session.getAttribute("user_Id"));
%>
<label onclick="location.href='Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageBody.jsp'" class="menu_mypage">마이페이지</label>
<%		
}		
%>
	</div>
	&nbsp;
</body>
</html>