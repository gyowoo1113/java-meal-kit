<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>
.active {
	font-size: "bold";
}

#dline {
	-webkit-tap-highlight-color: transparent;
	background-color: #fff;
	border-radius: 5px;
	border: solid 3px #e8e8e8;
	box-sizing: border-box;
	clear: both;
	cursor: pointer;
	display: block;
	float: left;
	font-family: inherit;
	font-size: 14px;
	font-weight: normal;
	height: 42px;
	line-height: 40px;
	outline: none;
	padding-left: 18px;
	padding-right: 30px;
	position: relative;
	text-align: left !important;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	white-space: nowrap;
	width: auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="template/ogani/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="template/ogani/css/style.css"
	type="text/css">

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>



	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>밀키트</h2>
					</div>



					<div class="featured__controls">
						<ul>
							<!-- data-filter .클래스 따라가서 출력함!!!!!! 컨+f로 찾아서 넣기 -->
							<li class="active" data-filter="*">전메뉴</li>
							<li data-filter=".oranges">육류</li>
							<li data-filter=".fresh-meat">2</li>
							<li data-filter=".vegetables">3</li>
							<li data-filter=".fastfood">4</li>
						</ul>

						<hr>
					</div>
				</div>
			</div>


			<div class="row featured__filter">
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat review hit">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-1.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="showdetail.do"><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood hit">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-2.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-3.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="shopdetail.do"><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">과일</a>
							</h6>
							<h5>5,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges hit">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-4.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables review">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-5.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood joindt">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-6.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables joindt">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-7.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables joindt">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="template/ogani/img/featured/feature-8.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				
			</div>
			<div class="col col-md-12">
					<div>
						<button id="button" type="submit"
							class="btn btn-lg btn-info btn-block">등록</button>
					</div>
				</div>

		</div>


	</section>
	<!-- Featured Section End -->

	<script src="template/ogani/js/jquery-3.3.1.min.js"></script>
	<script src="template/ogani/js/bootstrap.min.js"></script>
	<script src="template/ogani/js/jquery.nice-select.min.js"></script>
	<script src="template/ogani/js/jquery-ui.min.js"></script>
	<script src="template/ogani/js/jquery.slicknav.js"></script>
	<script src="template/ogani/js/mixitup.min.js"></script>
	<script src="template/ogani/js/owl.carousel.min.js"></script>
	<script src="template/ogani/js/main.js"></script>

</body>
</html>