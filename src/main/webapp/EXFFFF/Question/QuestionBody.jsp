<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
<script>
	if(<%= session.getAttribute("MBNUM") %> != null){
	 	var mbnum = '<%= String.valueOf(session.getAttribute("MBNUM")) %>';
	}
	function writeQuestion() {
		if(mbnum == null){
			alert("로그인을 해주세요");
			return false;
		}
		else{
			location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBoard.jsp'
		}
	}
</script>
</head>
<body>
	<h2 align=center>불만사항이 있으시다면 알려주세요. 총알같은 속도로 처리해볼게요.</h2>
	<input type="button" value="문의하기" onclick="writeQuestion()" >
</body>
</html>