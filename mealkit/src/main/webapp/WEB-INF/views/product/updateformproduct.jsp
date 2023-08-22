
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
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="template/ogani/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="template/ogani/css/style.css" type="text/css">
    
    <!-- sweetalert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="template/ogani/img/lion.png">
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
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large" src="attech/product/${product.productImg }" 
                            width=540 height=560 alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${product.productName }</h3>
                        <div class="product__details__price">￦${product.productPrice}</div>
                        <p>${product.productComment}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="productCount" name="productCount">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn" onclick="insertToCart()">ADD TO CARD</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="false">Review</a>
                            </li>
                        </ul>
                    </div>
                </div>
                 <section class="related-blog spad">
			        <div class="container">
				        <div class="row">
				       		<c:forEach items="${reviews}" var="r">
					           <div class="col-lg-4 col-md-4 col-sm-6">
					               <div class="blog__item">
					                   <div class="blog__item__pic">
					                       <img src="template/ogani/img/blog/blog-1.jpg" alt="">
					                   </div>
					                   <div class="blog__item__text">
					                       <ul>
					                           <li><i class="fa fa-calendar-o"></i>${r.reviewDate}</li>
					                           <li><i class="fa fa-comment-o"></i> 5</li>
					                       </ul>
					                       <h5><a href="#">${r.reviewTitle}</a></h5>
					                       <p>${r.reviewSubject }</p>
					                   </div>
					               </div>
					           	</div>
				           	</c:forEach>
				         </div>
			        </div>
			    </section>
            </div>
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
	function insertToCart(){
		let count = document.getElementById("productCount").value;
		let id = ${product.productId};
		let payload = "count=" + count + "&id=" + id;
		let url = "ajaxcartinsert.do";
		fetch(url,{
			method: "post",
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: payload
		}).then(response => response.json())
		.then(json => showToast(json));
	}
	
	function showToast(data){
        const Toast = Swal.mixin({
            toast: true,
            position: 'center-center',
            showConfirmButton: false,
            timer: 1000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        Toast.fire({
            icon: data.result,
            title: data.message
        })
	}
	
</script>
</html>