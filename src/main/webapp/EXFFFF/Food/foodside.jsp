<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String cate1 = "메인요리";
String cate2 = "식전요리";
String cate3 = "디저트";
String cate4 = "한중일식";
String cate5 = "다이어트식";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - Foodside</title>
<style>
</style>
<style>
.collapsible {
	background-color: #777;
	color: white;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
}

.active, .collapsible:hover {
	background-color: #555;
}

.content {
	padding: 0 18px;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	background-color: #f1f1f1;
}

.collapsible:after {
	content: '\002B';
	color: white;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}
</style>

<script>
	function collapse(element) {
		var before = document.getElementsByClassName("active")[0] // 기존에 활성화된 버튼
		if (before && document.getElementsByClassName("active")[0] != element) { // 자신 이외에 이미 활성화된 버튼이 있으면
			before.nextElementSibling.style.maxHeight = null; // 기존에 펼쳐진 내용 접고
			before.classList.remove("active"); // 버튼 비활성화
		}
		element.classList.toggle("active"); // 활성화 여부 toggle

		var content = element.nextElementSibling;
		if (content.style.maxHeight != 0) { // 버튼 다음 요소가 펼쳐져 있으면
			content.style.maxHeight = null; // 접기
		} else {
			content.style.maxHeight = content.scrollHeight + "px"; // 접혀있는 경우 펼치기
		}
	}
</script>
</head>
<body>
	<button type="button" class="collapsible" onclick="collapse(this);">카테고리</button>
	<div class="content">
	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do?searchField=<%=cate1%>">메인요리</a>
	<br>
	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do?searchField=<%=cate2%>">식전요리</a>
	<br>
	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do?searchField=<%=cate3%>">디저트</a>
	<br>
	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do?searchField=<%=cate4%>">한중일식</a>
	<br>
	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do?searchField=<%=cate5%>">다이어트식</a>
	<br>
	</div>
</body>
</html>