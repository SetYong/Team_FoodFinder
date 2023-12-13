<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - Foodside</title>
<style>
.cate {
	display: block;
	padding: 50px;
	width: 100%;
	color: #000;
	text-align: left;
	background-color: #ddd;
	border: 0;
	cursor: pointer;
}

ul {
	display: flex;
	flex-direction: column;
	gap: 16px;
	margin: 0;
	padding: 0;
	max-width: 200px;
	width: 100%;
	list-style: none;
}

li { .button { display:block;
	padding: 20px;
	width: 100%;
	color: #000;
	text-align: left;
	background-color: #ddd;
	border: 0;
	cursor: pointer;
}

.content {
	display: none;
	margin: 0;
	padding: 20px;
	background-color: #fff;
	border-top: 1px solid #ddd;
}

&
.on { .button { background-color:#fff;
	font-weight: bold;
}

.content {
	display: block;
}
}
}
</style>
<script type="text/javascript">
	const buttons = document.querySelectorAll('.button');

	buttons.forEach(function(button, index) {
		button.addEventListener('click', function(e) {
			e.preventDefault();

			this.parentNode.classList.toggle('on');

			buttons.forEach(function(button2, index2) {
				if (index !== index2) {
					button2.parentNode.classList.remove('on');
				}
			});
		});
	});
</script>
</head>
<body>
	<ul>
		<li class="on">
			<button class="button">자유 게시판</button>
			<p id="menu1" class="content"></p>
		</li>
		<li>
			<button class="button">레시피</button>
			<p id="menu2" class="content">
				<label class="cate">모두 보기</label>
				<br> <label class="cate">한식</label>
				<br> <label class="cate">양식</label> 
				<br> <label class="cate">일식</label> 
				<br> <label class="cate">중식</label> 
				<br> <label class="cate">채식</label>
			</p>
		</li>
	</ul>
</body>
</html>