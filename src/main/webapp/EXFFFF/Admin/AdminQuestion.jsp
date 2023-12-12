<%@ page import = "java.util.List" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "java.util.Map" %>
<%@ page import = "questionBoard.QuestionBoardDAO" %>
<%@ page import = "questionBoard.QuestionBoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
QuestionBoardDAO dao = new QuestionBoardDAO();

Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
List<QuestionBoardDTO> boardLists = dao.selectList(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>문의 사항</h2>
	<table>
		<tr>
			<td align = "center">
				<select name = "searchField">
					<option value = "title">제목</option>
					<option value = "content">내용</option>
					<option value = "Qucate">카테고리</option>
				</select>
				<input type = "text"  name = "searchWord" />
				<input type = "submit"  value = "검색하기" />
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>카테고리</td>
			<td>작성일</td>
			<td>읽음</td>
		</tr>
<%
if (boardLists.isEmpty()){
%>
		<tr>
			<td colspan="5" align="center">처리할 게시물이 없습니다.</td>
		</tr>
<%
}
else{
for(QuestionBoardDTO dto : boardLists){
%>
<tr align = "center">
		<td><%= dto.getHeadnum() %> </td>
		<td align = "left"><%= dto.getTitle() %></td>
		<td align = "center"> <%= dto.getQucate() %></td>
		<td align = "center"> <%= dto.getQudate() %></td>
		<td align = "center"> <%= dto.getReadadmin() %></td>
	</tr>
<%	}
}
%>
	</table>
</body>
</html>