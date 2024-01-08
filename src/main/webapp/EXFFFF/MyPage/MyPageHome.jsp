<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
a{text-decoration:none;}
a:link{color : black}
a:visited{color: black}
a:hover{color: gray}
</style>
<title>FoodFinder - MyPage(home)</title>
</head>
	<table class="setprofile_table">
		<tr>
			<td width="85%"><h2 align="left" class="setprofile_head">내 정보</h2>
				<div class="setprofile_box">
					<img class="setprofile_img" src="../img/test2.jpeg">
					<p align="left">
						<br>별명 :
						<%=session.getAttribute("nickname")%>
						<br> <br> 이메일 :
						<%=session.getAttribute("email")%>
						<br> <br> 핸드폰 :
						<%=session.getAttribute("phone")%>
					</p>
				</div></td>
		</tr>
	</table>
	<div style="border: 2px solid lightgray;">
	<h2 align="left" class="setprofile_head">작성한 레시피</h2>
		<table>
			<c:choose>
        	<c:when test="${empty boardLists}">
        		<tr>
					<td colspan="6" style="text-align: center;">
					작성한 레시피가 없습니다.
					</td>
				</tr>
        	</c:when>
        	<c:otherwise>
            	<table style="width: auto;">
                <tr>
            	<c:forEach items="${boardLists}" var="row" end = "3" varStatus="loop">
                		<td style="width:300px;"> <a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }"> 
                		<c:if test="${ row.image != null }"> <img src="../img/FoodImg/${ row.image }" alt="푸드게시판" /> </c:if>
                		<c:if test="${ row.image == null }"> <img src="../img/test2.jpeg" alt = '푸드게시판'> </c:if> </a> </td>
                </c:forEach>
                </tr>
               	<tr>
                <c:forEach items="${boardLists}" var="row" end = "3" varStatus="loop">
                	<td class="foodBoard"> 
                	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                    </a>
					</td>
                </c:forEach>
                </tr>
                <tr>
            	<c:forEach items="${boardLists}" var="row" begin = "4" varStatus="loop">
                		<td style = "width:300px;"> <a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }"> <img src="../img/test2.jpeg" alt="푸드게시판 }" /> </a> </td>
                </c:forEach>
                </tr>
               	<tr>
                <c:forEach items="${boardLists}" var="row" begin = "4" varStatus="loop">
                	<td  class="foodBoard"> 
                	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                    </a>
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
	</div>
	<br>
	<div style="border: 2px solid lightgray;">
	<h2 align="left" class="setprofile_head">공감한 레시피</h2>
		<table>
			<c:choose>
        	<c:when test="${empty myboardLists}">
        		<tr>
					<td colspan="6" style="text-align: center;">
					공감한 레시피가 없습니다.
					</td>
				</tr>
        	</c:when>
        	<c:otherwise>
            	<table style="width: auto;">
                <tr>
            	<c:forEach items="${myboardLists}" var="row" end = "3" varStatus="loop">
                		<td style="width:300px;"> <a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }"> 
                		<c:if test="${ row.image != null }"> <img src="../img/FoodImg/${ row.image }" alt="푸드게시판" /> </c:if>
                		<c:if test="${ row.image == null }"> <img src="../img/test2.jpeg" alt = '푸드게시판'> </c:if> </a> </td>
                </c:forEach>
                </tr>
               	<tr>
                <c:forEach items="${myboardLists}" var="row" end = "3" varStatus="loop">
                	<td class="foodBoard"> 
                	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                    </a>
					</td>
                </c:forEach>
                </tr>
                <tr>
            	<c:forEach items="${myboardLists}" var="row" begin = "4" varStatus="loop">
                		<td style = "width:300px;"> <a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }"> <img src="../img/test2.jpeg" alt="푸드게시판 }" /> </a> </td>
                </c:forEach>
                </tr>
               	<tr>
                <c:forEach items="${myboardLists}" var="row" begin = "4" varStatus="loop">
                	<td  class="foodBoard"> 
                	<a href="../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodView.do?headnum=${ row.headnum }">
                		제목 : ${ row.title } <br> 카테고리 : ${ row.cate } <br> 작성일 : ${ row.fooddate }
                    </a>
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
	</div>
</html>