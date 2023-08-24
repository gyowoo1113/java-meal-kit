
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="template/ogani/img/lion.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>제품 수정</h2>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<form id="frm" action="updateproduct.do" method="post"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="product__details__pic">
							<div class="product__details__pic__item">
								<label> <img id="productImg"
									src="img/${product.productImg }" width=540
									height=560 alt="이미지" onclick="changeImg()">
								</label> <input type="file" id="file" name="file"
									onchange="readURL(this)" style="display: none;">

							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="product__details__text">
							<h3>
								<input type="text" id="productName" name="productName"
									value="${product.productName }" class="form-control">
							</h3>
							<div class="product__details__price">
								<input type="text" id="productPrice" name="productPrice"
									value="${product.productPrice}" class="form-control">
							</div>

							<textarea name="productComment" id="productComment" rows="9"
								class="form-control">${product.productComment}</textarea>
							<hr>


							<button type="submit" class="primary-btn">수정</button>
							<button type="button" class="primary-btn" onclick="product()">삭제</button>

						</div>
					</div>
				</div>
				<div>

					<input type="hidden" id="productId" name="productId"
						value="${product.productId}">

				</div>
			</form>
			<form id="frm2" action="" method="post">
				<input type="hidden" id="productId" name="productId"
					value="${product.productId}">
			</form>

		</div>
	</section>
	<!-- Product Details Section End -->
	<script src="template/ogani/js/jquery-3.3.1.min.js"></script>
	<script src="template/ogani/js/bootstrap.min.js"></script>
	<script src="template/ogani/js/jquery.nice-select.min.js"></script>
	<script src="template/ogani/js/jquery-ui.min.js"></script>
	<script src="template/ogani/js/jquery.slicknav.js"></script>
	<script src="template/ogani/js/mixitup.min.js"></script>
	<script src="template/ogani/js/owl.carousel.min.js"></script>
	<script src="template/ogani/js/main.js"></script>
</body>
<script type="text/javascript">
 
	function readURL(input) {// 이미지 미리보기!!
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('productImg').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('productImg').src = "";
	  }
	}

	function changeImg(){
		document.getElementById('file').click();
		
		let fileInput = document.getElementById('file');
	
		let selectedFile = fileInput.files[0];
		console.log(fileInput);
			let formData = new FormData();
		    formData.append('file', selectedFile);
		
			let url = "ajaxImgChange.do";
			 fetch(url, {
			        method: 'POST', 
			        body: formData 
			    })
			    .then(response => response.text())
			    .then(text => 
			    {
		            const imgElement = document.getElementById('productImg');
		            imgElement.src = text.trim(); 
		            console.log( imgElement);
		        });
		
		
	}
	function product(){
			document.getElementById("frm2").action = "deleteproduct.do";
			document.getElementById("frm2").submit();
	}
</script>
</html>