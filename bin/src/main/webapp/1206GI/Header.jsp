<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>today's food</title>
<script type="text/javascript">
	function changeView(value){
		
		if(value == "0"){
			location.href="Main.jsp?contentPage=MainIntro.jsp";
		}
		else if(value == "1"){
			location.href="Main.jsp?sidePage=foodside.jsp&contentPage=foodbody.jsp";
		}
		else if(value == "2"){
			location.href="Main.jsp";
		}
		else if(value == "3"){
			location.href="Main.jsp?sidePage=MyPageSide.jsp&contentPage=MyPageBody.jsp";
		}
		else if(value == "11"){
			location.href="Main.jsp?contentPage=LoginPage.jsp";
		}
		else if(value == "12"){
			location.href="Main.jsp?contentPage=Newmember.jsp";
		}
	}
</script>
</head>
<body>
	<div align="right">
	<a href="#" onclick="changeView(11)" class="menu_login">
	로그인
	</a>
	&nbsp;&nbsp;&nbsp;
	<a href="#" onclick="changeView(12)" class="menu_login">
	회원가입
	</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	&nbsp;&nbsp;&nbsp;
	<div align="left">
		<a href="Main.jsp">
		<img class="logo_img" src="../img/test2.jpeg">
		</a>
		
		<a href="#" onclick="changeView(0)" class="menu_intro">안내</a>
		<a href="#" onclick="changeView(1)" class="menu_food">음식</a>
		<a href="#" onclick="changeView(2)" class="menu_qna">고객문의</a>
		<a href="#" onclick="changeView(3)" class="menu_mypage">마이페이지</a>
	</div>
	&nbsp;
</body>
</html>