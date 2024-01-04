<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h2 class="main_text">오늘의 추천 음식</h2>
		<a href="Main.jsp">
		<img class="main_img" src="../img/test2.jpeg" alt="테스트이미지"/>
		</a>
	</div>
	
	<div align="center">
		<table>
			<tr>
				<td class="main_post">공지사항
					<div>
						<jsp:include page="../Intro/IntroBody.jsp" />
					</div>
				</td>
				<td class="main_event" rowspan="2">이벤트<div>
						<jsp:include page="../Intro/Introevent.jsp" />
					</div>
				</td>
      </tr>
      <tr>
        <td>
			  <label onclick="location.href='Main.jsp?sidePage=../Intro/IntroSide.jsp&contentPage=../API/MapSearchView.jsp';" class="main_map">마트찾기</label>
			  </td>
			</tr>
		</table>
	</div>
</body>
</html>