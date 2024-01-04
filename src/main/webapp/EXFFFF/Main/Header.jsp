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
	if(session.getAttribute("MBNUM") == null) {
%>
	<div align="right">
	<label onclick="location.href='../Main/Main.jsp?contentPage=../Member/Login.jsp'" class="menu_login">
	로그인
	</label>
	&nbsp;&nbsp;&nbsp;
	<label onclick="location.href='../Main/Main.jsp?contentPage=../Member/Newmember.jsp'" class="menu_login">
	회원가입
	</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
<%
	} else {	
%>
	<div align="right">	
	<label onclick="location.href='../Member/Logout.jsp'" class="menu_login">
	로그아웃
	</label>
	</div>

<%
}
%>
	
	&nbsp;&nbsp;&nbsp;
	<div align="left">
		<a href="../Main/Main.jsp">
		<img class="logo_img" src="../img/foodfinder_title.png">
		</a>
		
		<a href="../Intro/IntroList.do" class="menu_intro">소식</a>
		<label onclick="location.href='../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do';" class="menu_food">커뮤니티</label>
		<label onclick="location.href='../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp';" class="menu_qna">고객문의</label>
<%
if(session.getAttribute("MBNUM")==null){
	System.out.println("header jsp 로그인 아직 : " + session.getAttribute("MBNUM"));
%>
<label onclick="location.href='../Main/Main.jsp?contentPage=../Member/Login.jsp'" class="menu_mypage">마이페이지</label>
<%
} else {
System.out.println("header jsp 로그인 성공 : " + session.getAttribute("MBNUM"));
%>
<label onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageBody.jsp'" class="menu_mypage">마이페이지</label>
<%
}
%>
	</div>
	&nbsp;
</body>
</html>