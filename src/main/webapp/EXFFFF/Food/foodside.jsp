<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - Foodside</title>
<style>
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
			<p id="menu1" class="content">샬라샬랴</p>
		</li>
		<li>
			<button class="button">레시피</button>
			<p id="menu2" class="content">모두보기</p>
		</li>
	</ul>
</body>
</html>