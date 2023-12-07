<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의</title>
<Style>

input[type="button"]{
padding: 10x;
display: inline-block;
}
.mainborad{
position: static;
width: 1200px;
margin-left: 18%;
display: inlline-block;
background-color:blue;
}
.sidetable{
float: left;
border: 1px solid;
width: 200px;
height: 200px;
margin-left:2%;
text-align: center;
display: inline-block;
background-color:green;
}
label:hover{
color: white;
background-color: gray;
}
</Style>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>
	
	<input type="button" name="mbBoardWrite" id="WriteBtn" value="글작성" onclick="location.href='memberBoardWrite'"> <br>
	
	<div class="sidetable">
		<label onclick="location.href='QuestionBoard.jsp'">문의하기</label> <br>
		<label onclick="location.href='MemberBoard.jsp'">자유게시판</label>
	</div>
	
	<table border ="1" class="mainborad">
	<tr>
		<td align = "center">
			<select name = "searchField">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
			</select>
			<input type = "text"  name = "searchWord" />
			<input type = "submit"  value = "검색하기" />
		</td>
	</tr>
	</table>
	
	<table border="1" class="mainborad">
		<tr>
			<th width = "10%">번호</th>
			<th width = "50%">제목</th>
			<th width = "15%">작성자</th>
			<th width = "10%">조회수</th>
			<th width = "15%">작성일</th>
		</tr>
		<tr>
		<td colspan="5" align="center">
		</td>
		<tr align="center">
			<td>1</td>
			<td>가나다</td>
			<td>홍길동</td>
			<td>1</td>
			<td>2023-12-05</td>
	</tr>
	</table>
</body>
</html>