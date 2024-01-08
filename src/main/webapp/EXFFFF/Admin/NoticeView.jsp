<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete(form) {
		if(confirm("정말 삭제하겠습니까?")){
			alert("삭제 되었습니다.");
		}
		else{
			return false;
		}
	}
</script>
<style>
.evnetImg{
	margin-left: 8%;
}
.eventTitle{
	margin-left: 8%
}
</style>
</head>
<body>
	<table style = "width:100%;">
		<tr style = "font-size: 15pt; font-weight: bold;">
			<td style = "width:8%; text-align: center;"> 
			<c:if test = "${ dto.cate == 'notice' }"> 공지 </c:if>
			<c:if test = "${ dto.cate == 'check' }"> <font color = "#858FDE"> 점검 </font> </c:if>
			<c:if test = "${ dto.cate == 'event' }"> <font color = "#CF9ED2"> 이벤트 </font> </c:if>
			</td>
			<td style = "width:95%;">${ dto.title } </td>
		</tr>
		<tr>
			<td colspan = "2"> ${ dto.postdate } </td>
		</tr>
		<c:choose>
		<c:when test="${ dto.text != null }">
			<tr>
				<td colspan="2">
					<pre>${ dto.text }</pre>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan = "2"> <img class ="eventTitle" src="../img/Event/${ dto.titleimage }" alt = "이벤트 타이틀 이미지" /> </td>
			</tr>
			<tr>
				<td colspan = "2"> <img class ="evnetImg" src="../img/Event/${ dto.image }" alt="이벤트 이미지" /> </td>
			</tr>
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan = "2">
				<input type = "button" value = "목록 바로가기" onclick = "history.back()"> 
				<form name ="DELETEboard" action = "../Admin/AdminBoardDelete.do" onsubmit = "return checkDelete(this)">
					<input type ="hidden"  name = "headnum" value =  ${ dto.headnum }>
					<input type = "submit" value = "삭제하기"> 
				</form>
			</td>
		</tr>
	</table>
</body>
</html>