<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
	<h2>목록 보기(list)</h2>
	
	<!-- 검색 폼 -->
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색하기" />
		</td>
	</tr>
	</table>
	</form>
	
	<!-- 목록테이블 -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="15%">제목</th>
			<th width="*">내용</th>
			<th width="13%">날짜</th>
			<th width="15%">kcal</th>
		</tr>
	<c:choose>
		<c:when test="${empty boardLists }">
			<tr>
				<td colspan="5" align="center">
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
				<td align="left">
					<a href="../MyPage/MyPageView.do?idx=${ row.idx }&MBNUM=<%=session.getAttribute("MBNUM")%>">${row.title }</a>
				</td>
				<td>${ row.content }</td>
				<td>${ row.postdate }</td>
				<td>${ row.kcal }kcal</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	
	<!--  바로가기, 글쓰기 -->
	<table border="1" width="90%">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
			<td width="100"><button type="button" onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPagewrite.jsp'">작성하기</button>
			</td>
		</tr>
	</table>
</body>
</html>