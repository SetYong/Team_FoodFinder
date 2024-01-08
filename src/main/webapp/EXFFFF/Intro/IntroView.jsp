<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - intro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
a{text-decoration:none;}
a:link{color : black}
a:visited{color: black}
a:hover{color: gray}
</style>
</head>
<body>
</br>
	<h2 style=text-align:center>${ dto.title }</h2>
</br>
	<table border="1" width="100%" class="table  table-striped table-bordered">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>

		<!-- 게시글 정보 -->
		<tr>
			<td>작성자</td>
			<td>관리자</td>
			<td>작성일</td>
			<td>${ dto.postdate }</td>
			<td>조회수</td>
			<td>${ dto.visitcount }</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5" height="100">${ dto.text }</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<button type="button"
					onclick="location.href='../Intro/IntroList.do';" class="btn btn-outline-success">목록 바로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>