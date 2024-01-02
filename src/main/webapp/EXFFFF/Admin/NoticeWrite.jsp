<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function updateForm() {
        var selectedValue = document.querySelector('input[name="cate"]:checked').value;
        var formContent = document.getElementById('formContent');

        if (selectedValue === "notice" || selectedValue === "noticecheck") {
            formContent.innerHTML = 
            	'<tr> <td style="width:5%;text-align: center;"> 제목 : </td> <td> <input type="text" name= "title" style="width: 95%; height: 30px;"> </td> </tr>' +
                '<tr> <td style="width:5%;text-align: center;"> 내용 : </td> <td> <textarea name = "noticeContent"rows="10" cols="10" style = "resize:none; width: 95%; height: 600px;"> </textarea> </td> </tr>' +
                '<tr> <td colspan = "2"> <input type = "submit" value = "작성 완료" style=" margin-left: 40%; width: 20%; height: 35px; border-radius: 25%;border: 1px solid gray;"> </td> </tr>';
        } else if (selectedValue === "event") {
            formContent.innerHTML = 
            	'<tr> <td style="width:5%;text-align: center;"> 제목 : </td> <td> <input type="text" name="title" style="width: 95%; height: 30px;"> </td> </tr>' +
                '<tr> <td colspan = "2"> <input type="file" name="eventImg" style="margin-left: 5%;"> </td></tr>' +
                '<tr> <td colspan = "2"> <input type = "submit" value = "작성 완료" style=" margin-left: 35%; width: 20%; height: 35px; border-radius: 25%;border: 1px solid gray;"> </td> </tr>';
        } else {
            formContent.innerHTML = '<tr><td colspan="2"> 작성할 종류를 선택해 주세요. </td></tr>';
        }
    }
</script>
</head>
<body>
    <form name="NoticeWriteForm" enctype="multipart/form-data" action="../Admin/AdminNoticewrite.do" method="post">
        <table style="width: 100%">
            <tr>
                <td colspan = "2" style="text-align: center;">종류 : 
                    <input type ="radio" name ="cate" value ="notice" onclick = "updateForm()"> 공지 
                    <input type ="radio" name ="cate" value ="noticecheck" onclick = "updateForm()"> 점검 
                    <input type ="radio" name ="cate" value ="event" onclick = "updateForm()"> 이벤트
                </td>
            </tr>
            <tbody id="formContent"> <tr> <td colspan = "2" style="text-align: center;"> 작성할 종류를 선택해 주세요. </td> </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
