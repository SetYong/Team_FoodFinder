<%@ page import = "java.util.List" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "java.util.Map" %>
<%@ page import = "questionBoard.QuestionBoardDAO" %>
<%@ page import = "questionBoard.QuestionBoardDTO" %>
<%@ page import = "questionBoard.QuestionPage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
QuestionBoardDAO dao = new QuestionBoardDAO();

Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);

int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals("")){
	pageNum = Integer.parseInt(pageTemp);
}

int start = (pageNum -1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start",start);
param.put("end",end);

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
	<h2>문의 사항 - 현재 페이지 :  <%= pageNum %></h2>
	<form method ="get">
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
	</form>
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
		<td align = "center">
			<c:if test="${ dto.getReadadmin() ==  '0' }">
				<font color="#F15F5F">미답변</font>
			</c:if>
			<c:if test="${ dto.getReadadmin() == '1' }">
				<font color="#4374D9">답변완료</font>
			</c:if> ${ requestScope.dtoo.mbnum } : ${ dtoo.mbnum } : <%= dto.getReadadmin() %>
		</td>
	</tr>
<%	} 
}
%>
	</table>
	
	<table border="1" style="width: 90%;">
		<tr align="center" >
			<td>
			<%= QuestionPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
		</tr>
	</table>
</body>
</html>