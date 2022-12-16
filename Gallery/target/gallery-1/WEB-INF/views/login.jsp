<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>登录</title>
		<link href="/gallery/css/login.css" type="text/css" rel="stylesheet" charset=“utf-8”>
	</head>
	<body>
		<div class="login">
			<div class="header">
				<h1>
					<a href="#">登录</a>
				</h1>
				<button></button>
			</div>
			<form action="/gallery/Login/login.do" method="post">
				<div class="name">
					<input type="text" id="name" name="username">
					<p></p>
				</div>
				<div class="pwd">
					<input type="password" id="pwd" name="password">
					<p></p>
				</div>
				<div class="btn-red">
					<input type="submit" value="登录" id="login-btn">
				</div>
			</form>
		</div>
	</body>
</html>