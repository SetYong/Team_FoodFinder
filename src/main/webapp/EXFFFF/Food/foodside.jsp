<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodFinder - Foodside</title>
<style>
* {
  box-sizing: border-box;
}

html,
body {
  margin: 0;
  padding: 0;
  overflow: hidden;
  overflow-y: auto;
}

body {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  padding: 10vh 15px;
  font-size: 16px;
  color: #000;
  background-color: #f1f1f1;
}

// Accordion styles
ul {
  display: flex;
  flex-direction: column;
  gap: 16px;
  margin: 0;
  padding: 0;
  max-width: 500px;
  width: 100%;
  list-style: none;
}

li {
  .button {
    display: block;
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
  
  &.on {
    .button {
      background-color: #fff;
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
			<p id="menu1" class="content">샬라샬랴</p>
		</li>
		<li>
			<button class="button">레시피</button>
			<p id="menu2" class="content">모두보기</p>
		</li>
	</ul>
</body>
</html>