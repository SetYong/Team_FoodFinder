<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isThreadSafe="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객문의</title>
    <style>
a{text-decoration:none;}
a:link{color : black}
a:visited{color: black}
a:hover{color: gray}
</style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
        	<table>
        		<tr>
					<td colspan="6" style ="width:100%; text-align: center;">
						등록된 건의 사항이 없습니다.
					</td>
				</tr>
        	</table>
        </c:when>
        <c:otherwise>
            <table border="1" style="width: 100%;" class="table table-hover table-striped table-bordered">
                <tr class="table-default">
                    <th width="10%">번호</th>
                    <th width="50%">제목</th>
                    <th width="15%">카테고리</th>
                    <th width="15%">작성일</th>
                    <th width="10%">읽음</th>
                </tr>
                <c:forEach items="${boardLists}" var="row" varStatus="loop">
                    <tr align="center">
                        <td>${row.headnum}</td>
                        <td><a href="../Main/Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QeustionViewUser.do?headnum=${ row.headnum }">${row.title}</a></td>
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
    <table border="1" width="100%" class="table">
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