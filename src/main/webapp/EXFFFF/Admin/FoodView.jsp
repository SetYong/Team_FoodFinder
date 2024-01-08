<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
.foodimg{
width: 400px;
}
.adminfoodhead{
text-align: center;
}
.adminfoodform{
text-align: center;
}
.adminfoodsubmit{
width:100%;
margin-top: 2%;
margin-bottom: 1%;
}
</style>
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
			function updateAdminAssentFail(){
				var assent = document.getElementById("AssentFail").value;
				console.log(assent);
				if(assent == "탈락"){
					if(confirm("이 게시물을 탈락처리 하시겠습니까?")){
						alert("탈락 처리 되었습니다.");
						return true;
					}
					else {
						return false;
					}
				}
				else {
					console.log("탈락 처리 오류");
					return false;
				}
			}
	</script>
</head>
<body>
<br>
	<h2 class="adminfoodhead">푸드 게시판 관리자 상세보기</h2>
	<br>
	<form class="adminfoodform" action="../Admin/AdminAssent.do">
		<input type="hidden" name="headnum" value="${ dto.headnum }">
		<table style="width: 100%;">
			<tr>
				<td>제목 : ${ dto.title }</td>
				<td>작성일 : ${ dto.fooddate }</td>
			</tr>
			<tr>
				<td>작성자 : ${ nickName }</td>
				<td>공감 수 : ${ dto.heartcount }</td>
			</tr>
			<tr>
			<td colspan = "2"><img class ="foodimg" src="../img/FoodImg/${ dto.image }" alt="푸드 이미지" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;padding-left: 18%;">재료 : <br>${ dto.content }</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;padding-left: 18%;"><br>레시피 : <br>${ dto.recipe }</td>
			<tr>
			<tr>
				<td colspan="2"><br>승인 상태 : 
					<c:if test="${dto.adminassent ==  '0' }"> <font color="#F15F5F">미승인</font> </c:if> 
					<c:if test="${dto.adminassent ==  '1' }"> <font color="#4194DD">승인완료</font> </c:if>
					<c:if test="${dto.adminassent ==  '2' }"> <font color="FF3399">탈락</font></c:if>
				</td>
			</tr>
		</table>
		<table class="adminfoodsubmit">
			<tr>
				<td><input style="width:100px; height:60px" type="submit" id="AssentYes" name="adminAssent" value="승인" class="btn btn-info" onclick="return updateAdminAssentYes()">
				<input style="width:100px; height:60px" type="submit" id="AssentNo" name="adminAssent" value="미승인" class="btn btn-warning" onclick="return updateAdminAssentNo()">
				<input style="width:100px; height:60px" type="submit" id="AssentFail" name="adminAssent" value="탈락" class="btn btn-danger" onclick="return updateAdminAssentFail()">
				<input style="width:100px; height:60px" type="button" value="목록" class="btn btn-secondary" onclick="location.href='../Admin/AdminMain.jsp?contentPage=AdminFoodList.do'"> </td>
			</tr>
		</table>
	</form>
</body>
</html>