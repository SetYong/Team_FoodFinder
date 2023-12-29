<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
width:1175px;
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
a{text-decoration:none;}
a:link{color : black}
a:visited{color: black}
a:hover{color: gray}
</style>
</head>
<body>
	<form name = "Foodform" action = "">
		<table>
			<tr> <td colspan ="4"> <h3 style = "text-align:center">세상에 있는 모든 맛있는 음식을 먹어봤으면 좋겠어요. </h3> </td> </tr>
			<c:choose>
        	<c:when test="${empty boardLists}">
        		<tr>
					<td colspan="6" style="text-align: center;">
					등록된 게시물이 없습니다.
					</td>
				</tr>
				<tr>
					<td>
					<c:if test="${ mbnumcheck != null }">
					<input type ="button" value = "글작성" onclick = "location = '../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodWrite.jsp'" style = "float: right;"> 
					</c:if>
					</td> 
				</tr>
        	</c:when>
        	<c:otherwise>
            	<table>
                <tr>
            	<c:forEach items="${boardLists}" var="row" end = "3" varStatus="loop">
                		<td style="width:300px;"> <a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.head_num }"> <img src="../img/test2.jpeg" alt="푸드게시판 }" /> </a> </td>
                </c:forEach>
                </tr>
               	<tr>
                <c:forEach items="${boardLists}" var="row" end = "3" varStatus="loop">
                	<td class="foodBoard"> 
                	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.head_num }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                    </a>
					</td>
                </c:forEach>
                </tr>
                <tr>
            	<c:forEach items="${boardLists}" var="row" begin = "4" varStatus="loop">
                		<td style = "width:300px;"> <a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.head_num }"> <img src="../img/test2.jpeg" alt="푸드게시판 }" /> </a> </td>
                </c:forEach>
                </tr>
               	<tr>
                <c:forEach items="${boardLists}" var="row" begin = "4" varStatus="loop">
                	<td  class="foodBoard"> 
                	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.head_num }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                    </a>
					</td>
                </c:forEach>
                </tr>
            </table>
    		<table border="1" width="90%">
				<tr align="center" >
					<td colspan = "2">
						${ map.pagingImg }
					</td>
				</tr>
				<tr>
					<td colspan = "2">
					<c:if test="${ mbnumcheck != null }">
					<input type ="button" value = "글작성" onclick = "location = '../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodWrite.jsp'" style = "float: right;"> 
					</c:if></td> 
				</tr>
			</table>
        	</c:otherwise>
   			 </c:choose>
		</table>
	</form>
</body>
</html>