<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder</title>
</head>
<body>
	<h2>이벤트</h2>
	<br><br>
	
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" name="검색하기"/>
		</td>
	</tr>
	</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
	<c:choose>
		<c:when test="${ empty boardLists }">
			<tr>
				<td colspan="6" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
			<tr align="center">
				<td>
					${ map.totalCount - (((map.pageNum-1)*map.pageSize)+loop.index)}
				</td>
				<td>${ row.name }</td>
				<td>${ row.visitcount }</td>
				<td>${ row.postdate }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
</body>
</html>