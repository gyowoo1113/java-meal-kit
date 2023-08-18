<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>

.active {
	font-size: "bold";
}





</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					</div>
				</div>
			</div>
			
			
			<select style = "height:50px" name = "selecto">
				<option value="1">조회순</option>
				<option value="2">신상품순</option>
				<option value="3">낮은가격순</option>
				<option value="4">높은가격순</option>
			</select>
			<hr>

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
		</div>
	</section>
	<!-- Featured Section End -->

</body>
</html>