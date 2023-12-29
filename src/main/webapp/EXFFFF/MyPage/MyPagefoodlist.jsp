<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>a{text-decoration:none;
color: black;}</style>
</head>
<body>
	<br>
	<h2 class="text-left" >나의 레시피</h2>
	<br>
	<!-- 검색 폼 -->
	<form method="get">
	<table border="1" width="90%" class="table">
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
	<table border="1" width="90%" class="table table-hover table-striped">
	<c:choose>
		<c:when test="${empty boardLists }">
			<tr>
				<td colspan="5" align="center">
					등록된 레시피가 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
			<tr align="center">
				<td width="10%">
					${ map.totalCount - (((map.pageNum-1)*map.pageSize)+loop.index)}
				</td>
				<td align="left" width="20%">
					<a href="../MyPage/MyPageView.do?idx=${ row.idx }&MBNUM=<%=session.getAttribute("MBNUM")%>">${row.title }</a>
				</td>
				<td width="*"><a href="../MyPage/MyPageView.do?idx=${ row.idx }&MBNUM=<%=session.getAttribute("MBNUM")%>">${ row.content }</a></td>
				<td width="13%">${ row.postdate }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	<table border="1" width="90%" class="table">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
		</tr>
	</table>
</body>
</html>