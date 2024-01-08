<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.board{
width: 100%;
margin: 10px;
margin-left:50px;
border: solid 1px;
transform-origin: center;
text-align:center;
}
a{text-decoration:none;}
</style>
</head>
<body>
	<h2 style="text-align: center;">고객님의 문의 내역</h2>
	<c:choose>
        <c:when test="${empty boardLists}">
        	<tr>
				<td colspan="6" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
        </c:when>
        <c:otherwise>
            <table border="1" style="width: 100%;">
                <tr>
                    <th width="10%">번호</th>
                    <th width="40%">제목</th>
                    <th width="10%">작성자</th>
                    <th width="15%">카테고리</th>
                    <th width="15%">작성일</th>
                    <th width="10%">읽음</th>
                </tr>
                <c:forEach items="${boardLists}" var="row" varStatus="loop">
                    <tr align="center">
                        <td>${row.headnum}</td>
                        <td><a href="../Admin/AdminMain.jsp?contentPage=QuestionView.do?headnum=${ row.headnum }">${row.title}</a></td>
                        <td>${row.mbnum }</td>
                        <td>${row.qucate}</td>
                        <td>${row.qudate}</td>
                        <td>
                        <c:if test="${row.readadmin ==  '0' }">
							<font color="#F15F5F">미답변</font>
						</c:if>
                        <c:if test="${row.readadmin ==  '1' }">
							<font color="#4194DD">답변 완료</font>
						</c:if>
						</td>
                    </tr>
                </c:forEach>
            </table>
    <table border="1" style="width:100%;">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
		</tr>
	</table>
        </c:otherwise>
    </c:choose>
</body>
</html>