<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.foodimg{
	margin-left: 30%;
	width: 300px;
	height: 300px;
	}
</style>
<script type="text/javascript">
	function textcheck() {
		var form = document.replyForm;
		var replytext = document.getElementById("replytextfield").value;
		if(replytext==""){
			alert("댓글을 입력해주세요.");
			return false;
		}
		else {
			form.method = "post";
			form.action = "../Food/Reply.do";
			form.submit();
			return true;
		}
	}
	function foodedit(){
		var check = document.getElementById("edit").value;
		if(confirm("게시글을 수정하시겠습니까?")){
			return true;
		} else {
			return false;
		}
	}
	function fooddelete(){
		var check = document.getElementById("delete").value;
		if(confirm("게시글을 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<h2 style="text-align: center;"> ${ dto.title }</h2>
	<c:if test="${mbnumcheck == dto.mbnum }">
	<form action="../Food/Delete.do" >
		<input type="hidden" name="HEADNUM" value="${dto.headnum }"/>
		<input type="submit" id="delete" name="editordelete" value="삭제하기" onclick="return fooddelete()"/>
		<input type="submit" id="edit" name="editordelete" value="수정하기" onclick="return foodedit()"/>
	</form>
	</c:if>
	<table style = "width:100%">
		<tr>
			<td style = "width:80%"> 작성자 :${ nickName } </td>
			<td> 작성일 : ${ dto.fooddate } </td>
		</tr>
		<tr>
			<td> 조회 수 : ${ dto.visitcount }</td>
			<td> 공감 수 : ${ dto.heartcount } </td>
		</tr>
		<c:if test = "${ dto.image != null }">
		<tr>
			<td colspan = "2"> <img class ="foodimg" src="../img/FoodImg/${ dto.image }" alt="푸드 이미지" /> </td>
		</tr>
		</c:if>
		<tr>
			<td colspan = "2"> 재료 : ${ dto.content } </td>
		</tr>
		<tr>
			<td colspan = "2"> 레시피 :${ dto.recipe } </td>
		</tr>
		<tr>
			<td colspan = "2" style ="text-align:center;"> <input type = "button" value = "목록 바로가기" onclick="location.href='../Main/Main.jsp?sidePage=../Food/foodside.jsp&contentPage=../Food/FoodList.do'"> </td>
		</tr>
	</table>
	<c:if test="${ mbnumcheck != null }">
	<form name = "replyForm" >
		<input type = "hidden" name = "headnum" value = " ${ dto.headnum }">
		<table>
			<tr>
				<td colspan ="2" style = "float:right"> <input type = "button"  value = "공감"> </td> 
			</tr>
			<tr>
				<td> <input type = "text" name = "replyText" id = "replytextfield"> </td>
				<td> <input type = "submit" name ="replysubmit" value = "댓글 달기" onclick = "return textcheck()"> </td>
			</tr>
		</table>
	</form>
	</c:if>
	<c:if test="${ mbnumcheck == null }">
		<table>
			<tr>
				<td colspan = "2"> 로그인 후 공감 및 댓글 작성이 가능합니다.</td>
			</tr>
		</table>
	</c:if>
	<table>
	<c:choose>
		<c:when test="${empty replyList}">
        	<tr>
				<td colspan="6" align="center">
					등록된 댓글이 없습니다.
				</td>
			</tr>
        </c:when>
        <c:otherwise>
        	<c:forEach items="${replyList}" var="reple"  varStatus="loop">
        		<tr>
					<td>  "${ reple.replenickname }" 님 </td>
					<td> : ${ reple.repletext } </td>
					<td style = "text-align:right;"> ${ reple.replydate } </td> 
				</tr>
        	</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
</body>
</html>