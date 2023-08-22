

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="template/ogani/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Vegetable’s Package</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html">Vegetables</a>
                            <span>Vegetable’s Package</span>
                        </div>
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
                            <img class="product__details__pic__item--large" src="${product.productImg }" 
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