<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isThreadSafe="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객문의</title>
</head>
<body>
<% if(session.getAttribute("MBNUM") == null) {
%>
	<script>           
	if (confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")) {           
		location.href='../Main/Main.jsp?contentPage=../Member/Login.jsp';            
	} else {
		location.href='../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBody.jsp';           
	}
	</script>
<% } else {
%>
    <c:choose>
        <c:when test="${empty boardLists}">
        	<tr>
				<td colspan="6" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
        </c:when>
        <c:otherwise>
            <table border="1" style="width: 1195px;">
                <tr>
                    <th width="10%">번호</th>
                    <th width="50%">제목</th>
                    <th width="15%">카테고리</th>
                    <th width="15%">작성일</th>
                    <th width="10%">읽음</th>
                </tr>
                <c:forEach items="${boardLists}" var="row" varStatus="loop">
                    <tr align="center">
                        <td>${row.headnum}</td>
                        <td><a href="../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionViewUser.do?headnum=${ row.headnum }">${row.title}</a></td>
                        <td><label onclick="location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionViewUser.do?headnum=${ row.headnum }'"></td>
                        <td>${row.qucate}</td>
                        <td>${row.qudate}</td>
                        <td>
                        <c:if test="${row.readadmin ==  '0' }">
							<font color="#F15F5F">미답변</font>
						</c:if>
                        <c:if test="${row.readadmin ==  '1' }">
							<font color="#4194DD">답변</font>
						</c:if>
						</td>
                    </tr>
                </c:forEach>
            </table>
    <table border="1" width="90%">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
		</tr>
	</table>
        </c:otherwise>
    </c:choose>
<% } %>
</body>
</html>
