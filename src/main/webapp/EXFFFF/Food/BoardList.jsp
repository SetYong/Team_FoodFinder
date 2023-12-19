<%@ page import = "java.util.List" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "java.util.Map" %>
<%@page import="foodDB.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
FoodDAO dao = new FoodDAO();
Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}
int totalCount = dao.selectCount(param);
List<FoodDTO> boardLists= dao.selectList(param);
dao.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get">
<table border="1" width="90%">
<tr>
<td align="center">
<select name="searchField">
<option value="title">제목</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchWord"/>
<input type="submit" value="검색하기"/>
<input type="submit" value="새로고침"/>
</td>
</tr>
</table>
<table border="1" width="90%">
<tr>
<th width="10%">번호</th>
<th width="*" >내용</th>
<th width="15%">음식</th>
<th width="10%">조회수</th>
<th width="15%">작성일</th>
</tr>
<%
if(boardLists.isEmpty()){ 
%>
<tr>
<td colspan="5" align="center">
</td>
</tr>
<% 
}
else{
	int virtualNum=0;
	for(FoodDTO dto : boardLists)
	{
		virtualNum = totalCount--;
		%>
		<tr align="center">
		<td><%= dto.getHead_num()%></td>
		<td align="left"><%= dto.getText()%>
		</td>
		<td align="center"><%= dto.getTitle() %></td>
		<td align="center"><%= dto.getVisitcount() %></td>
 	    <td align="center"><%= dto.getFooddate() %></td>
 	    </tr>
<% 
	}
}
%>
</table>
<table border="1" width="90%">
<tr aligin="center">
<td>
</td>
<td width="100"><button type="button" onclick="location.href='BulletinBoardTest.jsp'">글쓰기</button>
</td>
</tr>
</table>
</form>
</body>
</html>