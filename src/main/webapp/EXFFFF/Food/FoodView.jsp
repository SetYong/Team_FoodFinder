<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
	<h2>Food View</h2>
	<table>
		<tr>
			<td> 제목 : ${ dto.title } </td>
			<td> 작성일 : ${ dto.fooddate } </td>
		</tr>
		<tr>
			<td> 작성자 :${ nickName } </td>
			<td> 공감 수 : ${ dto.heartcount } </td>
		<tr>
			<td colspan = "2"> 재료 : ${ dto.content } </td>
		</tr>
		<tr>
			<td colspan = "2"> 레시피 :${ dto.recipe } </td>
		</tr>
		<tr>
			<td> <input type = "button" value = "목록 바로가기" onclick="history.back()"> </td>
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
				<td> <input type = "button" name ="replysubmit" value = "댓글 달기" onclick = "return textcheck()"> </td>
			</tr>
		</table>
	</form>
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
					<td>  "${ reple.replenickname }" 님  </td>
					<td> : ${ reple.repletext } </td>
					<td style = "text-align:right;"> ${ reple.replydate } </td> 
				</tr>
        	</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
</body>
</html>