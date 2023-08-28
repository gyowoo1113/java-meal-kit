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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

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
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<h1 style="font-size: 150%">
							<strong>제품관리</strong>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">입출고 수불대장</strong>
						</div>
						<div class="card-body">

							<section class="featured spad">
								<div class="container">
									<div class="row">
										<div class="col-lg-12">
											<div class="section-title">
												<h2>밀키트</h2>
											</div>
											<div class="featured__controls">
												<ul>

													<li class="active" data-filter="*"><a href="manageproduct.do" id="all"
														onclick="">전체메뉴</a></li>
													<li data-filter=""><a href="#" id="categoryId1" data-value="1"
														onclick="select('1')">찌개</a></li>

													<li data-filter=""><a href="#" id="categoryId2" data-value="2"
														onclick="select('2')">국</a></li>

												</ul>
												<!-- <select style="height: 50px" name="selecto" id="dline">
													<option value="1">조회순</option>
													<option value="2">신상품순</option>
													<option value="3">낮은가격순</option>
													<option value="4">높은가격순</option>
												</select>  -->
												<br> <br>

												<hr>
											</div>
										</div>
									</div>


									<div class="row featured__filter">
										<c:forEach items="${products}" var="p">
											<div
												class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables joindt">
												<div class="featured__item" onclick="moveShopDetail(event)"
													id="${p.productId}">
													<div class="featured__item__pic set-bg">
														<img src="img/${p.productImg }" height=270 width=270>
														<ul class="featured__item__pic__hover">
															<li><a href="#"><i class="fa fa-heart"></i></a></li>

														</ul>
													</div>
													<div class="featured__item__text">
														<h6>
															<a href="#">${p.productName }</a>
														</h6>
														<h5>￦${p.productPrice}</h5>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
									
								</div>
								<div class="col col-md-12">
										<div>

											<button id="button" type="submit"
												onclick="location.href= 'insertformproduct.do'"
												class="btn btn-lg btn-info btn-block">등록</button>

										</div>
									</div>
							</section>
							<form id="detailform" method="post" action="updateformproduct.do">
								<input type="hidden" id="productId" name="productId" value="">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Featured Section End -->

	<script type="text/javascript">
		function moveShopDetail(event) {
			var parentTag = event.target;
			for (; parentTag.className != 'featured__item'; parentTag = parentTag.parentElement)
				;

			var frm = document.getElementById("detailform");
			frm.querySelector("#productId").value = parentTag.id;
			document.getElementById("detailform").submit();
		}

		function select(type) {

			console.log(type);
			if(type == '1'){
				linkElement = document.getElementById("categoryId1");
			}else{
				linkElement = document.getElementById("categoryId2");
			}

			
			let dataValue = linkElement.getAttribute("data-value");
			console.log(dataValue);
			
			let url = "ajaxcategoryselect.do";
			fetch(url,{ 
				method:"POST",
				headers: {
					"Content-Type":"application/x-www-form-urlencoded",
				},
				body: dataValue
			}).then(response => response.json())
			  .then(json => htmpConevert(json));
		}
		function htmpConevert(datas){
			console.log(datas);
			
			const featuredFilterElement = document.querySelector('.row.featured__filter');
			featuredFilterElement.remove();
			const newFeaturedFilterElement = document.createElement('div');
			newFeaturedFilterElement.classList.add('row', 'featured__filter');
			newFeaturedFilterElement.innerHTML = datas.map(data => htmlView(data)).join('');

			// 새로운 요소를 문서에 추가
			const parentElement = document.querySelector('.container'); // 적절한 부모 요소 선택
			parentElement.appendChild(newFeaturedFilterElement);
			/*document.querySelector('tbody').remove();
			const tbody = document.createElement('tbody');
			
			tbody.innerHTML = datas.map(data => htmlView(data)).join(''); 
			document.querySelector('#bootstrap-data-table').appendChild(tbody);
			*/
		}
		function htmlView(data){
			
			return `
			<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables joindt">
			<div class="featured__item" onclick="moveShopDetail(event)"
			id="\${data.productId}">
			<div class="featured__item__pic set-bg">
				<img src="img/\${data.productImg }" height=270 width=270>
				<ul class="featured__item__pic__hover">
					<li><a href="#"><i class="fa fa-heart"></i></a></li>

				</ul>
			</div>
			<div class="featured__item__text">
				<h6>
					<a href="#">\${data.productName }</a>
				</h6>
				<h5>￦\${data.productPrice}</h5>
			</div>
		</div>
		</div>
				`
		}
	</script>
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