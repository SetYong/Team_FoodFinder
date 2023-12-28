<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>
<h1>오늘의 전국 날씨</h1>
<input id="city" type="text" value="">
<button onclick="getWeather()">날씨 가져오기</button>
<p id="temperature"></p>
<script>
function getWeather(){
    let city = document.getElementById("city").value;
    fetch('http://goweather.herokuapp.com/weather/' + city)
    .then((response) => response.json())
    .then((data) => {
        document.getElementById("temperature").innerHTML = data['temperature'];
    });
}
</script>
</body>
</html>
