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
<style>
</style>
</head>
<body>
<br>
	<h2 style=text-align:center>공지사항</h2>
<br>
	
	<!-- 검색 폼 -->
	<form method="get">
	<table border="1" width="100%" class="table table-hover table-striped">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색하기" class="btn btn-outline-primary" />
		</td>
	</tr>
	</table>
	</form>
	
	<!-- 목록테이블 -->
	<table border="1" width="100%" class="table table-hover table-striped table-bordered">
		<tr>
			<th width="10%" style=text-align:center>번호</th>
			<th width="*" style=text-align:center>제목</th>
			<th width="13%" style=text-align:center >날짜</th>
			<th width="15%" style=text-align:center>조회수</th>
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
					<a style="text-decoration-line: none;" href="../Intro/IntroView.do?headnum=${ row.headnum }">${row.title }</a>
				</td>
				<td>${ row.postdate }</td>
				<td>${ row.visitcount }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	
	<table border="1" width="100%" >
		<tr align="center" style=text-align:center>
			<td>
				${ map.pagingImg }
			</td>
		</tr>
	</table>
	
</body>
</html>