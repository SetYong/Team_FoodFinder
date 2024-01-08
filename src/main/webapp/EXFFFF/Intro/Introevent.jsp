<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder</title>
<style>
img{
width: 100%;
height: 300px;
}
a { text-decoration: none; }
a:link{
color:black;
}
a:visited{
color:black;
}
a:hover{
boder-color:gray;
}
</style>
</head>
<body>
	<h2 style="height: 70px; margin: 2%; text-align: center; font-size: 32pt; border-bottom: ridge; margin-bottom: 10px;">이벤트</h2>
	
	<table style = "width: 100%; border-spacing:12px;">
	<c:choose>
		<c:when test="${ empty boardLists }">
			<tr>
				<td colspan="6" align="center">
					등록된 이벤트가 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:set var='i' value='0' />
			<c:set var='j' value='2' />
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
				<c:if test ="${i%j == 0 }" >
					<tr>
					<td style="width:50%"> 
						<div style="margin-bottom: 15px; border:1px solid; height: 400px; line-height:27px;"><a href="../Intro/EventView.do?headnum=${ row.headnum }">
							<c:if test ="${ empty row.titleimage }"> <img src="../img/Event/EventTitle.png" alt="이미지 준비중"></c:if>
							<c:if test ="${ row.titleimage != null}"> <img src="../img/Event/${ row.titleimage }" alt="${ row.titleimage }"></c:if>					
							<br> <font style = "font-size:24pt; font-weight:bold;"> ${ row.title } </font>
							<br> <font style = "color: #7638b1; font-weight:bold;"> 조회수 </font> : ${ row.visitcount }
							<br> <font style = "color: #4c82db; font-weight:bold;"> 작성된 날짜 </font> : ${ row.postdate } 
						</a></div>
					</td>
				</c:if>
				<c:if test = "${i%j == 1 }">
					<td style="width:50%"> 
						<div style="margin-bottom: 15px; border:1px solid; height: 400px; line-height:27px;"><a href="../Intro/EventView.do?headnum=${ row.headnum }">
							<c:if test ="${ empty row.titleimage }"> <img src="../img/Event/EventTitle.png" alt="이미지 준비중"></c:if>
							<c:if test ="${ row.titleimage != null}"> <img src="../img/Event/${ row.titleimage }" alt="${ row.titleimage }"></c:if>					
							<br> <font style = "font-size:24pt; font-weight:bold;"> ${ row.title } </font>
							<br> <font style = "color: #7638b1; font-weight:bold;"> 조회수 </font> : ${ row.visitcount } 
							<br> <font style = "color: #4c82db; font-weight:bold;"> 작성된 날짜 </font> : ${ row.postdate } 
						</a></div>
					</td>
				</c:if>
			<c:set var="i" value="${i+1 }" />
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
</body>
</html>