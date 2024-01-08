<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - intro</title>
</head>
<body>
	<h2>intro view</h2>
	<table border="1" width="90%">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>

		<!-- 게시글 정보 -->
		<tr>
			<td>번호</td>
			<td>${ dto.headnum }</td>
			<td>작성자</td>
			<td>관리자</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${ dto.postdate }</td>
			<td>조회수</td>
			<td>${ dto.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${ dto.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100"> <pre> ${ dto.text } </pre></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button"
					onclick="location.href='../Intro/IntroList.do';">목록 바로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>