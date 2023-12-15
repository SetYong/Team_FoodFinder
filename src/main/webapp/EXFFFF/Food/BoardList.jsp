<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
if(session.getAttribute("title")==null){ 
session.setAttribute("title",request.getAttribute("title"));
session.setAttribute("visitcount",request.getAttribute("visitcount"));
session.setAttribute("fooddate",request.getAttribute("fooddate"));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="./BoardList.do">
<table border="1" width="90%">
<tr>
<td align="center">
<select name="title">
<option value="title">제목</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchWord"/>
<input type="submit" value="검색하기"/>
<input type="submit" value="새로고침"/>
<button type="submit" name="visitcount">방문횟수</button>
</td>
</tr>
</table>
<table border="1" width="90%">
<tr>
<th width="10%">번호</th>
<th width="*" >제목</th>
<th width="15%">작성자</th>
<th width="10%">조회수</th>
<th width="15%">작성일</th>
</tr>
<c:choose>
<c:when test="${empty boardList }">
<tr>
<td colspan="6" align="center">
등록된 게시물이 없습니다.
</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach items="${Fooddto}" var="row" varStatus="loop">
<tr align="center">
<td>${row.title}</td>
<td>${row.visitcount}</td>
<td>${row.fooddate}</td>
</tr>
</c:forEach>
</c:otherwise> 
</c:choose>  
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