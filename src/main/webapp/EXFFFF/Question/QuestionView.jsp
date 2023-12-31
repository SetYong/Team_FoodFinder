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
	<h2 style = "text-align:center;">${ dto. title }</h2>
	
	<table border = 1 style = "width:100%; text-align:center;" class="table">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>

		<!-- 게시글 정보 -->
		<tr>
			<td style = "width: 10%">문의 종류</td> <td>${ dto.qucate }</td>
			<td>작성자</td> <td>${ dto.mbnum }</td>
			<td>작성일</td> <td>${ dto.qudate }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5" height="100" style="text-align:left;">${ dto.content }</td>
		</tr>
		
	</table>
	<c:if test="${ dto.readadmin ==  '1' }">
		<table border = 1 style="width:100%;" class="table">
			<tr>
				<td style = "width:5%; text-align:center;"> 답글 </td>
				<td style = "text-align:center;"> ${ dto.answer } </td>
			</tr>
			<tr>
			<td colspan="6" align="center">
				<button type="button" style="width: 10%;height: 30px;margin-top: 10px;margin-bottom: 10px;"onclick="history.back()">목록 바로가기</button>
			</td>
		</tr>
		</table>
	</c:if>
</body>
</html>