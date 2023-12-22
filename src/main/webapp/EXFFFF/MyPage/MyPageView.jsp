<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - mypage</title>
</head>
<body>
	<h2>mypage view</h2>
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
			<td>${ dto.idx }</td>
			<td>작성자</td>
			<td><%=session.getAttribute("nickname")%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${ dto.postdate }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${ dto.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${ dto.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button"
					onclick="location.href='../MyPage/MyPagelist.do?MBNUM=<%=session.getAttribute("MBNUM")%>';">목록 바로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>