<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.out {
	display: inline-block;
	margin-left: 20px;
}

.mypage {
	display: inline-block;
	margin-right: 20px;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
						<c:if test="${not empty id }">
							<ul>
								<li><i class="fa fa-envelope"></i> ${email }</li>
							</ul>
						</c:if>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
						
							<c:if test="${empty id }">
								<div class="header__top__right__auth">
									<a href="loginform.do"><i class="fa fa-user"></i>로그인</a>
								</div>
							</c:if>

							<c:if test="${not empty id }">
								<div class="header__top__right__auth">
									<i class="fa fa-user"></i>${ name }님 접속중
								</div>
								<div class="out">
									<a href="memberlogout.do" style="color:black" >로그아웃</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="home.do"><img src="template/ogani/img/logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 container">
					<nav class="header__menu">
						<ul>
							<li><a href="shopmenuform.do">상품목록</a></li>
							<li><a href="shoppingcart.do">장바구니</a>
							<li><a href="reviewform.do">베스트리뷰</a>
							<c:if test="${not empty id }">
							<li><a href="mypage.do">마이페이지</a>
							</c:if>
							<li><a href="admin.do">관리</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="reviewpost.do"><i class="fa fa-heart"></i> <span>1</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
</body>
</html>