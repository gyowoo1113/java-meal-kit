<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

.headerpart {
	padding: 20px;
	font-size: 17px;
	font-family: FontAwesome;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header-->
	<header id="header" class="header">
		<div class="top-left">
			<div class="navbar-header">
				<a class="navbar-brand" href="managemember.do"><img
					src="template/elaadmin/images/logo.png" alt="Logo"></a> <a
					class="navbar-brand hidden" href="./"><img
					src="template/elaadmin/images/logo2.png" alt="Logo"></a> <a
					id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
			</div>
		</div>
		<div class="top-right">
			<div class="header-menu">

				<div class="headerpart">
					<a href="home.do"><i class="fa fa-home"></i></a>
				</div>


				<div class="headerpart">
					<i class="fa fa-user"></i>${ name }님 접속중
				</div>

				<div class="headerpart">
					<a href="memberlogout.do" style="color: black">로그아웃</a>
				</div>

			</div>
		</div>
	</header>
	<!-- /#header -->
</body>
</html>