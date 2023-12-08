<%@ page import="memberMG.MemberDTO"%>
<%@ page import="memberMG.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String mbnum = (String) session.getAttribute("MBNUM");
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getProfile(mbnum);
dao.close();

String nickname = dto.getNickname();
String mail = dto.getEmail();
String phone = dto.getPhone();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>FoodFinder - MyPage(profile)</title>
</head>
<body>
	<table class="setprofile_table">
		<tr>
			<td width="85%"><h2 align="left" class="setprofile_head">내
					정보</h2>
				<div class="setprofile_box">
					<img class="setprofile_img" src="../img/test2.jpeg">
					<p align="left">
						<br>별명 :
						<%=nickname%>
						<br> <br> 이메일 :
						<%=mail%>
						<br> <br> 핸드폰 :
						<%=phone%>
					</p>
				</div></td>
		</tr>
	</table>
</body>
</html>