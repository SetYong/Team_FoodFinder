<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function updateAdminAssentYes() {
			var assent = document.getElementById("AssentYes").value;
			console.log(assent);
			if(assent == "승인"){
				if (confirm("이 게시물을 승인 하시겠습니까?")) {
					alert("승인 처리 되었습니다.");
					return true;
				} 
				else {
					return false;
				}
			}
			else{
				console.log("오류!?");
				return false;   
			} 
		}
			function updateAdminAssentNo() {
				var assent = document.getElementById("AssentNo").value;
				console.log(assent);
				if(assent == "미승인"){
					if (confirm("이 게시물을 미승인 하시겠습니까?")) {
						alert("미승인 처리 되었습니다.");
						return true;
					} 
					else {
						return false;     
					}
				}
				else{
					console.log("오류!?");
					return false;   
				} 
		}
	</script>
</head>
<body>
	<h2>푸드 게시판 관리자 상세보기</h2>
	<form action="../Admin/AdminAssent.do">
		<input type="hidden" name="headnum" value="${ dto.head_num }">
		<table>
			<tr>
				<td>제목 : ${ dto.title }</td>
				<td>작성일 : ${ dto.fooddate }</td>
			</tr>
			<tr>
				<td>작성자 :${ nickName }</td>
				<td>공감 수 : ${ dto.heartcount }</td>
			</tr>
			<tr>
				<td colspan="2">승인 상태 : 
					<c:if test="${dto.adminassent ==  '0' }"> <font color="#F15F5F">미승인</font> </c:if> 
					<c:if test="${dto.adminassent ==  '1' }"> <font color="#4194DD">승인완료</font> </c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">재료 : ${ dto.content }</td>
			</tr>
			<tr>
				<td colspan="2">레시피 :${ dto.recipe }</td>
			<tr>
		</table>
		<table>
			<tr>
				<td><input type="submit" id="AssentYes" name="adminAssent" value="승인" onclick="return updateAdminAssentYes()"> </td>
				<td><input type="submit" id="AssentNo" name="adminAssent" value="미승인" onclick="return updateAdminAssentNo()"> </td>
			</tr>
		</table>
	</form>
</body>
</html>