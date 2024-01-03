<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/custom.css">
<title>FoodFinder - MyPage(Tab)</title>
 <style>
        .collapsible {
            background-color: #777;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
        }
        .active,
        .collapsible:hover {
            background-color: #555;
        }
        .content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            background-color: #f1f1f1;
        }
        .collapsible:after {
            content: '\002B';
            color: white;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }
        .active:after {
            content: "\2212";
        }
    </style>
    
    <script>
        function collapse(element) {
            var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
        }
    </script>
</head>
<body>
	<button type="button" class="collapsible" onclick="collapse(this);">내가 쓴 글</button>
	<div class="content">
	<a href="../MyPage/MyPagelist.do?MBNUM=<%=session.getAttribute("MBNUM")%>">밥 일기</a>
	<br>
	<a href="../MyPage/MyPagefoodlist.do?MBNUM=<%=session.getAttribute("MBNUM")%>">레시피</a>
	<br>
	</div>
	<button type="button" class="collapsible" onclick="collapse(this);">내 정보</button>
	<div class="content">
	<label
		onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageBody.jsp'"
		>프로필</label>
	<br>
	<label
		onclick="location.href='../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageSetprofilepass.jsp'"
		>정보 수정</label>
	<br>
	<a href="../Main/Main.jsp?sidePage=../MyPage/MyPageSide.jsp&contentPage=../MyPage/MyPageExit.jsp">회원탈퇴</a>
</div>
</body>
</html>