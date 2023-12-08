<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - food diary</title>
</head>
<body>
	<h2>밥 다이어리</h2>
	<form method="get">
		<table border="1" width="80%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>

	<table border="1" width="80%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="10%">작성일</th>
			<th width="8%">칼로리</th>
		</tr>
		<c:choose>
			<c:when test="${boardList == null}">
				<td colspan="4">
					<p align="center">
						<b><span style=''>작성된 일기가 없습니다.</span></b>
					</p>
				</td>
			</c:when>
			<c:when test="${boardList!=null}">
				<c:forEach var="post" items="${boardList}" varStatus="postNum">
					<tr align="center">
						<td width="5%">${diary.dno}</td>
						<td width="10%">${diary.id }</td>
						<td align="left" width="35%"><span
							style="padding-right: 30px"></span> <c:choose>
								<c:when test="${diary.level>1 }">
									<c:forEach begin="1" end="${diary.level }">
										<span style="padding-left: 20px"></span>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a class="cls1" href="/board/post?no=${diary.dno }">${diary.title }</a>
								</c:otherwise>
							</c:choose></td>
						<td width="10%"><fmt:formatDate value="${diary.regdate }" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>

<td colspan="4">
<p align="center"><b><span style="font-size:9pt;">
<c:if test="${diary.prev }">
<a href="/board/list?page=${diary.startPage-1 }">이전 페이지</a>
</c:if>
&nbsp;<c:forEach var="num" begin="${diary.startPage }" end="${diary.endPage }">
<a href="boadr/list?page=${num }">${num }</a>&nbsp;
</c:forEach>
<c:if test="${diary.next }">
<a href="/board/list?page=${diary.endPage +1 }">다음 페이지</a>
</c:if>
</span></b>
</p>
</td>

</table>
<a class="cls1" href="/board/write"><p class="cls2">글쓰기</a>
<script>
window.onload= () => {
	const removeResult = '${result}'
	if(removeResult == 'success') {
		alert("삭제 되었습니다.");
	} else if (removeResult=='fail'){
		alert("다시 시도해주세요.");
		return;
	}
}
</script>
</body>
</html>