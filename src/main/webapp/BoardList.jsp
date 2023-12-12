<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="90%">
<tr>
<td align="center">
<select name="searchField">
<option value="title">제목</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchWord"/>
<input type="submit" value="검색하기"/>
</td>
</tr>
</table>
<table border="1" width="90%">
<tr>
<th width="10%">번호</th>
<th width="*">제목</th>
<th width="15%">작성자</th>
<th width="10%">조회수</th>
<th width="15%">작성일</th>
<th width="8%">첨부 파일</th>
</table>
</body>
</html>