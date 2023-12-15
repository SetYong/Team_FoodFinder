<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<h2 align="left" class="setprofile_head">정보 수정</h2>
		<p>비밀번호 확인</p>
		<form method="post" action="../MyPage/MyPageSetprofile.do" name="MyPageCheck">
		<input type="password" name="pwd"/>
		<input type="hidden" name="MBNUM" value="<%=session.getAttribute("MBNUM") %>"/>
		<input type="submit" value="확인"/>
		</form>	
</body>
</html>