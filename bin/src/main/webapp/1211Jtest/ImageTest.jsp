<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

	<table border="1" style="width: 90%">
		<thead>
			<th align="left">게시글 수정
			<th style="absolute; left: 700px;">작성일:
			<tr>
				<th align="left">작성자:
			</tr>
			</th>
			</th>
		</thead>
		<tbody>
			<tr>
				<td align="center">사진</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td><h3>기본 재료</h3></td>
			</tr>
			<tr>
				<td align="right">
					<button type="submit" >좋아요</button>
					<button type="submit" ">공감</button>
				</td>
			</tr>
			<tr>
			<td align="center">
			 <textarea name="content"
						style="width: 45%; height: 50px;">여기에다 입력해주세요.  </textarea>
					<button type="submit">전송</button>
			</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>