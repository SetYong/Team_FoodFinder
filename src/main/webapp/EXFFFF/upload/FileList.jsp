<%@ page import ="java.net.URLEncoder" %>
<%@ page import ="java.util.List" %>
<%@ page import ="upload.MyfileDAO" %>
<%@ page import ="upload.MyfileDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<a href="FileUploadMain.jsp">파일 등록하기</a>
<%MyfileDAO dao = new MyfileDAO();
List<MyfileDTO> fileLists = dao.myFileList();
dao.close();%>
<table border="1">
<tr>
<th>작성자</th><th>제목</th><th>카테고리</th>
<th>원본 파일명</th><th>저장된 파일명</th><th>작성일</th><th></th>
</tr>
<% for(MyfileDTO f : fileLists){ %>
<tr>
<td><%= f.getName() %></td>
<td><%= f.getTitle() %></td>
<td><%= f.getCate() %></td>
<td><%= f.getOfile() %></td>
<td><%= f.getSfile() %></td>
<td><%= f.getPostdate() %></td>
</td>
</tr>

<%} 
%>

</table>
</head>
<body>

</body>
</html>