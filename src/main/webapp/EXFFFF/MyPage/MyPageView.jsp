<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - mypage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<h2>mypage view</h2>
	<table border="1" width="90%" class="table">
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
					onclick="location.href='../MyPage/MyPagelist.do?MBNUM=<%=session.getAttribute("MBNUM")%>';">일기장으로 돌아가기</button>
			<button type="button">수정하기</button>&nbsp;<button type="button">삭제하기</button>
			</td>
		</tr>
	</table>
</body>
</html>