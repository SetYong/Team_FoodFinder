<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>
	
	<div class="sidetable">
		<label onclick="location.href='QuestionBoard.jsp'">문의하기</label> <br>
		<label onclick="location.href='MemberBoard.jsp'">자유게시판</label> <br>
		<label>내 문의내역</label>
	</div>
	<h2>블라블라</h2>
	<input type="button" value="문의하기" onclick="location.href='QuestionBoard.jsp'" >
</body>
</html>