<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foodfinder - adminevent</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>a{text-decoration:none;
color: black;}</style>
</head>
<body>
<br>
	<br>
	<h2 class="text-center" >이벤트</h2>
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
	
	<!-- 목록테이블 -->
	<table border="1" width="90%" class="table">
		<tr align="center" class="table-default">
			<th width="10%">번호</th>
			<th width="15%">카테고리</th>
			<th width="50%">이벤트 이미지</th>
			<th width="15%">작성일</th>
			<th width="10%">조회수</th>
		</tr>
	</table>
	<table border="1" width="90%" class="table table-hover table-striped">
	<c:choose>
		<c:when test="${empty boardLists }">
			<tr>
				<td colspan="5" align="center">
					등록된 공지사항이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
			<tr align="center">
				<td width="10%">
					${ map.totalCount - (((map.pageNum-1)*map.pageSize)+loop.index)}
				</td>
				<td align="center" width="15%">${row.cate}</td>
				<td align="left" width="50%">
					<a href="../Intro/Event.do?headnum=${ row.headnum }">${row.title }</a>
				</td>
				<td align="center" width="15%">${row.postdate}</td>
				<td align="center" width="10%">${ row.visitcount }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	
	<!--  바로가기, 글쓰기 -->
	<table border="1" width="90%" class="table">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
			<td width="100"><button type="button" onclick="">작성하기</button>
			</td>
		</tr>
	</table>
</body>
</html>