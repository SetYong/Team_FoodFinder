<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<head><title>Insert title here</title></head>
<script>
function validateForm(form){
if(form.name.value == ""){
alert("작성자를 입력하세요.");
form.name.focus();
return false;
}
if(form.title.value == ""){
	alert("제목을 입력하세요.");
	form.title.focus();
	return false;
}
if(form.attachedFile.value == ""){
	alert("첨부파일은 필수 입력입니다.");
	return false;
}
}
</script>
<body>
<h2>파일 업로드</h2>
<span style="color : red;">${errorMessage }</span>
<form name="fileForm" method="post" enctype="multipart/form-data" action="UploadProcess.jsp" onsubmit="return validateForm(this);">
작성자 : <input type="text" name="name" /></br>
제목 : <input type="text" name="title" /></br>
카테고리(선택사항) 
<input type = "checkbox" name="cate" value="사진" />사진
<input type = "checkbox" name="cate" value="파일" />파일
<input type = "checkbox" name="cate" value="음식" />음식</br>
첨부파일 : <input type="file" name="attachedFile"/><br/>
<input type="submit" value="전송하기"/>
</form>
</body>
</html>