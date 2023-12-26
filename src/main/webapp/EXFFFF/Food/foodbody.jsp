<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
width:1190px;
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
width: 300px;
height: 300px;
}
img{
width:300px;
height: 300px;}
</style>
</head>
<body>
	<form name = "Foodform" action = "">
		<table>
			<tr> <td colspan ="4"> <h3 style = "text-align:center">세상에 있는 모든 맛있는 음식을 먹어봤으면 좋겠어요.</h3> </td> </tr>
			<tr>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_1" /> </a> </td>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_2" /> </a> </td>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_3" /> </a> </td>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_4" /> </a> </td>
			</tr>
			<tr>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_5" /> </a> </td>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_6" /> </a> </td>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_7" /> </a> </td>
				<td class="foodBoard"> <a href="../1129Test/center.jsp"> <img src="../img/test2.jpeg" alt="푸드게시판_8" /> </a> </td>
			</tr>
			<tr> 
				<td colspan = "3" align="center"> ${ map.pagingImg } </td>
				<td> <input type ="button" value = "글작성" onclick = "location = '../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodWrite.jsp'"> </td> 
			</tr>
		</table>
	</form>
</body>
</html>