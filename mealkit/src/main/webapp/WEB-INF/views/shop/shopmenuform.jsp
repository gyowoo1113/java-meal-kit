<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

img{
	width:210px;
	height:270px;
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
							<li data-filter=".oranges">과일류</li>
							<li data-filter=".fresh-meat">육류</li>
							<li data-filter=".vegetables">3</li>
							<li data-filter=".fastfood">4</li>
						</ul>
						<select style="height: 50px" name="selecto" id="dline">
							<option value="1">조회순</option>
							<option value="2">신상품순</option>
							<option value="3">낮은가격순</option>
							<option value="4">높은가격순</option>
						</select> <br> <br> <br> <br>

						<hr>
					</div>
				</div>
			</div>


			<div class="row featured__filter">

				<c:forEach items="${products}" var="p">
					<div
						class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables joindt">
						<div class="featured__item">
							<img class="featured__item__pic set-bg" src="${p.productImg }">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#"></a>
							</h6>
							<h5>${p.productName }</h5>
						</div>
					</div>
			</div>
			</c:forEach>

		</div>
		</div>
	</section>


	<!-- Featured Section End -->
</body>
</html>