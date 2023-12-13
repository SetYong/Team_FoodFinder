<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">소개</button>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">음식</button>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">고객
			문의</button>
		<button type="button" style="border-radius: 0.5em:padding:5px20px">마이
			페이지</button>
	</center>
	<span style="float: right;">
		<button type="button" style="border-radius: 0.5em:padding:5px20px">로그인</button>
		<button type="button" style="boreder-radius: 0.5em:padding:5px20px">회원가입</button>
	</span>

	<h3 text align=center>세상에 있는 모든 맛있는 음식을 먹어봤으면 좋겠어요.</h3>


	<table width="90" height="300" align=left>
		<td>
			<button type="button">메인요리</button> </br>
			<button type="button">초대요리</button> </br>
			<button type="button">간단요리</button> </br>
			<button type="button">밑 반찬</button> </br>
			<button type="button">간식</button> </br>
			<button type="button">안주</button> </br>
			<button type="button">베이킹</button> </br>
			<button type="button">다이어트</button> </br>
			<button type="button">도시락</button> </br>
			<button type="button">한식</button> </br>
			<button type="button">양식</button> </br>
			<button type="button">일식</button> </br>
			<button type="button">중식</button> </br>
			<button type="button">채식</button> </br>
			<button type="button">퓨전</button> </br>
			<button type="button">모두 보기</button>
		</td>
	</table> 

<form name="writeFrm" method="post" action="./BulletinBoardEditTest.do
" >
    <input type="hidden" name="num" > 
    <table border="1" width="92%"  >
        <tbody><tr> 
            <td style="text-align: center;">제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" > 
            </td>
            <tr> 
            <td style="text-align: center;" name="image">이미지</td>
            <td >
                <textarea name="content" style="width: 10%; height: 50px;">첨부파일  </textarea> 
                <textarea name="image" style=" width: 15%; height: 50px;">이미지 경로  </textarea> 
            </td> 
        </tr>
           
        <tr> 
            <td rowspan="2" style="text-align: center;">내용</td>
            <td>
                <textarea name="text" style="width: 90%; height: 100px;">기본재료를 입력하세요.  </textarea> 
                <textarea name="text" style="width: 90%; height: 100px;">만드는 방법을 입력하세요.  </textarea> 
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="reset">수정 취소</button>
                <button type="submit">수정 완료</button>
                <button type="button">목록 보기</button> 
            </td>
        </tr>
    </tbody></table>
</body>
</html>