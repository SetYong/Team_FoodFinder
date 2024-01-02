<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
	width: 1000px;
	height: 200px;
	resize: none;
}

.content {
	width: 100px;
	text-align: center;
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
	<h2 style="margin-left: 30px;">Food Write</h2>
	<form name="FoodWriteFrom" enctype="multipart/form-data"
		action="../Food/FoodEdit.do" method="post" onsubmit="return Check()">
		<input type="hidden" name="MBNUM"
			value="<%=session.getAttribute("MBNUM")%>">
		<table>
			<tr>
				<td colspan="2" style="padding-left: 50px;">제목 : <input
					type="text" name="title" size="100px">${dto.Title }
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 35px;">이미지 : 
				<input type="file" name="image">${dto.Image }
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 20px;">카테고리 : 
				메인요리<input type="checkbox" name="cate" value="메인요리" checked> 
				식전요리<input type="checkbox" name="cate" value="식전요리"> 
				디저트<input type="checkbox" name="cate" value="디저트"> 
				한중일식<input type="checkbox" name="cate" value="한중일식"> 
				다이어트식<input type="checkbox" name="cate" value="다이어트식">
				</td>
			</tr>
			<tr>
				<td class="content">기본재료 :</td>
				<td><textarea name="content" rows="10">${dto.Content }</textarea></td>
			</tr>
			<tr>
				<td class="content">만드는 방법 :</td>
				<td><textarea name="recipe" rows="10">${dto.Recipe }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성 완료"
					style="float: right; margin-left: 20px;"> <input
					type="reset" value="다시 입력" style="float: right"
					onclick="return resetcontent(this)"></td>
			</tr>
		</table>
	</form>
</body>
</html>