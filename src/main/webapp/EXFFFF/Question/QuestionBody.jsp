<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
li{
margin-left: 5%;
list-style-image: url(../img/Question.png);
}
.border:after{
  content: "";
  display: block;
  width: 90%; /* 밑줄 길이 조절 */
  border-bottom: 2px solid #000000;
  margin-top: 15px;
  }
</style>
<script>
	if(<%= session.getAttribute("MBNUM") %> != null){
	 	var mbnum = '<%= String.valueOf(session.getAttribute("MBNUM")) %>';
	}
	function writeQuestion() {
		if(mbnum == null){
			alert("로그인을 해주세요");
			return false;
		}
		else{
			location.href='Main.jsp?sidePage=../Question/QuestionSide.jsp&contentPage=../Question/QuestionBoard.jsp'
		}
	}
</script>
</head>
<body>
	<h2 style="font-size: 28pt; text-align:center; margin-top:15px; margin-bottom:20px;">불만사항이 있으시다면 알려주세요. 총알같은 속도로 처리해볼게요.</h2>
	<p class = "border" style="font-size: 20pt; font-weight: bold; padding-left: 2%; margin: auto;"> 자주묻는 질문 <img src="../img/Question.png"> </p> 
	<ul class = "border">
		<li> Q.
		<p/> A.
		</li>
		<li> Q.
		<p/> A.
		</li>
		<li> Q.
		<p/> A.
		</li>
		<li> Q.
		<p/> A.
		</li>
	</ul>
	<input type="button" value="문의하기" onclick="writeQuestion()" style="width: 100px;height: 45px; margin-top:-8px; margin-bottom:10px; margin-left: 45%;border-radius: 15%;border: 1px solid #939393;">
</body>
</html>