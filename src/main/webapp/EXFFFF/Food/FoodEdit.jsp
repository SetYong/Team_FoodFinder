<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
	width: 100%;
	height: 200px;
	resize: none;
}

.content {
	width: 100px;
	text-align: center;
}
img {
width:100px;
height: 100px;
}
table {
width: 90%;
}
.title{
width: 90%;
height: 30px;
}
</style>
</head>
<body>
	<script>
		function resetcontent(form) {
			if (confirm("모든 작성내용이 사라집니다. 그래도 다시 작성 하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
		function Check(form) {
			var title = document.getElementsByName("title")[0].value;
			var content = document.getElementsByName("content")[0].value;
			var recipe = document.getElementsByName("recipe")[0].value;
			var cate = document.getElementsByName("cate");
			var cate_checked = false;

			for (var i = 0; i < cate.length; i++) {
				if (cate[i].checked == true) {
					cate_checked = true;
					break;
				}
			}

			if (title == "") {
				alert("제목은 필수 입력입니다.");
				return false;
			}
			if (content == "" || recipe == "") {
				alert("기본재료 및 레시피를 작성해주세요.");
				return false;
			}
			if (!cate_checked) {
				alert("카테고리은 필수 입력입니다.");
				return false;
			}
		}
	</script>
	<h2 style="margin-left: 30px;">게시글 수정하기</h2>
	<form name="FoodWriteFrom" enctype="multipart/form-data"
		action="../Food/FoodEdit.do" method="post" onsubmit="return Check()">
		<input type="hidden" name="MBNUM"
			value="<%=session.getAttribute("MBNUM")%>"/>
		<input type="hidden" name="HEADNUM" value="${dto.headnum}"/>
		<table >
			<tr>
				<td colspan="2" style="padding-left: 50px;">제목 : 
				<input type="text" name="title" class="title" value="${dto.title }">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 35px;">이미지 : 
				<input type="file" name="image">
				</td>
			</tr>
		</table>
		<img style="width: 100px; height: 100px; margin-left:100px;" src="../img/FoodImg/${dto.image }" alt="이미지">
		<table>
			<tr>
			<c:if test="${dto.cate eq '메인요리'}">
				<td colspan="2" style="padding-left: 20px;">카테고리 : 
				메인요리<input type="checkbox" name="cate" value="메인요리" checked> 
				식전요리<input type="checkbox" name="cate" value="식전요리"> 
				디저트<input type="checkbox" name="cate" value="디저트"> 
				한중일식<input type="checkbox" name="cate" value="한중일식"> 
				다이어트식<input type="checkbox" name="cate" value="다이어트식">
				</td>
			</c:if>
			<c:if test="${dto.cate eq '식전요리'}">
				<td colspan="2" style="padding-left: 20px;">카테고리 : 
				메인요리<input type="checkbox" name="cate" value="메인요리"> 
				식전요리<input type="checkbox" name="cate" value="식전요리" checked> 
				디저트<input type="checkbox" name="cate" value="디저트"> 
				한중일식<input type="checkbox" name="cate" value="한중일식"> 
				다이어트식<input type="checkbox" name="cate" value="다이어트식">
				</td>
			</c:if>
			<c:if test="${dto.cate eq '디저트'}">
				<td colspan="2" style="padding-left: 20px;">카테고리 : 
				메인요리<input type="checkbox" name="cate" value="메인요리"> 
				식전요리<input type="checkbox" name="cate" value="식전요리"> 
				디저트<input type="checkbox" name="cate" value="디저트" checked> 
				한중일식<input type="checkbox" name="cate" value="한중일식"> 
				다이어트식<input type="checkbox" name="cate" value="다이어트식">
				</td>
			</c:if>
			<c:if test="${dto.cate eq '한중일식'}">
				<td colspan="2" style="padding-left: 20px;">카테고리 : 
				메인요리<input type="checkbox" name="cate" value="메인요리"> 
				식전요리<input type="checkbox" name="cate" value="식전요리"> 
				디저트<input type="checkbox" name="cate" value="디저트"> 
				한중일식<input type="checkbox" name="cate" value="한중일식" checked> 
				다이어트식<input type="checkbox" name="cate" value="다이어트식">
				</td>
			</c:if>
			<c:if test="${dto.cate eq '다이어트식'}">
				<td colspan="2" style="padding-left: 20px;">카테고리 : 
				메인요리<input type="checkbox" name="cate" value="메인요리"> 
				식전요리<input type="checkbox" name="cate" value="식전요리"> 
				디저트<input type="checkbox" name="cate" value="디저트"> 
				한중일식<input type="checkbox" name="cate" value="한중일식"> 
				다이어트식<input type="checkbox" name="cate" value="다이어트식" checked>
				</td>
			</c:if>
			</tr>
			<tr>
				<td class="content">기본재료 :</td>
				<td><textarea name="content" rows="7">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td class="content">만드는 방법 :</td>
				<td><textarea name="recipe" rows="7" style="width: 100%">${dto.recipe }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="작성 완료" style="float: right; margin-left: 20px;"> 
				<input type="reset" value="다시 입력" style="float: right" onclick="return resetcontent(this)"></td>
			</tr>
		</table>
	</form>
</body>
</html>