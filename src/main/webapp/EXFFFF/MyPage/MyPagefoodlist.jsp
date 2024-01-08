<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/custom.css">
<style>
table{
width:100%;
}
.foodbody{
}
input[type=button]{
    margin-left: 40%;
    border-radius: 10px;
    width: 120px;
    height: 30px;
    background-color: lightsteelblue;
    border: none;
}
.foodBoard{
text-align: center;
line-height: 20px;
}
img{
width:100%;
height: 250px;
}
</style>
</head>
<body>
	<form name = "Foodform" action = "">
		<table>
			<tr> <td colspan ="4"> <h3 style = "text-align:center">내가 작성한 레시피</h3> </td> </tr>
			<c:choose>
        	<c:when test="${empty boardLists}">
        		<tr>
					<td colspan="6" style="text-align: center;">
					등록된 레시피가 없습니다.
					</td>
				</tr>
        	</c:when>
        	<c:otherwise>
            	<table style="width:auto;">
                <tr>
            	<c:forEach items="${boardLists}" var="row" end = "3" varStatus="loop">
                		<td style="width:300px;"class="foodBoard"> 
                		<div class="foodbox">
                		<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }"> 
                		<c:if test="${ row.image != null }"> <img src="../img/FoodImg/${ row.image }" alt="푸드게시판" /> </c:if>
                		<c:if test="${ row.image == null }"> <img src="../img/test2.jpeg" alt = '푸드게시판'> </c:if> </a>
                		<br>
                		<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                  	 	</a>
						</div>
						</td>
                </c:forEach>
                </tr>
                <tr>
            	<c:forEach items="${boardLists}" var="row" begin = "4" varStatus="loop">
                		<td style="width:300px;"class="foodBoard"> 
                		<div class="foodbox">
                		<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }"> 
                		<c:if test="${ row.image != null }"> <img src="../img/FoodImg/${ row.image }" alt="푸드게시판" /> </c:if>
                		<c:if test="${ row.image == null }"> <img src="../img/test2.jpeg" alt = '푸드게시판'> </c:if> </a>
                		<br>
                		<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                  	 	</a>
						</div>
						</td>
                </c:forEach>
                </tr>
            </table>
    		<table width="90%">
				<tr align="center" >
					<td colspan = "2">
						${ map.pagingImg }
					</td>
				</tr>
			</table>
        	</c:otherwise>
   			 </c:choose>
		</table>
	</form>
</body>
</html>