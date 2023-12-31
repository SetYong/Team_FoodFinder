<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Food List</h2>
	<table>
		<c:choose>
			<c:when test="${empty boardLists}">
				<tr>
					<td colspan="6" style="text-align: center;">
						등록된 게시물이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th width="10%">번호</th>
                    <th width="50%">제목</th>
                    <th width="15%">카테고리</th>
                    <th width="15%">작성일</th>
                    <th width="10%">승인</th>
				</tr>
				<c:forEach items="${boardLists}" var="row" varStatus="loop">
					<tr>
                		<td style = "text-align:center;"> ${ row.headnum } </td>
						<td> <a href="../Admin/AdminMain.jsp?contentPage=FoodViewAdmin.do?headnum=${ row.headnum }"> ${ row.title }  </a> </td>
						<td style = "text-align:center;"> ${ row.cate } </td>
						<td style = "text-align:center;"> ${ row.fooddate }
						<td style = "text-align:center;">
							<c:if test="${row.adminassent ==  '0' }"> <font color="#F15F5F">미승인</font> </c:if>
                        	<c:if test="${row.adminassent ==  '1' }"> <font color="#4194DD">승인완료</font> </c:if>
                    		<c:if test="${row.adminassent ==  '2' }"> <font color="FF3399">탈락</font> </c:if>
                    	</td>
                    </tr>
                </c:forEach>
				<table border="1" width="100%">
					<tr align="center" >
						<td colspan = "2">
							${ map.pagingImg }
						</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>