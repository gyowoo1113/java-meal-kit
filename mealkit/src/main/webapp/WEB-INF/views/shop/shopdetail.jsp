

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.popupBtn {
  		width: 150px;
  		height: 50px;
 		padding: 10px 5px;
	}
	.modalWrap {
 		position: fixed; /* Stay in place */
  		z-index: 1; /* Sit on top */
  		padding-top: 100px; /* Location of the box */
  		left: 0;
  		top: 0;
  		width: 100%; /* Full width */
  		height: 100%; /* Full height */
  		overflow: auto; /* Enable scroll if needed */
  		background-color: rgba(0,0,0,0.2); /* Black w/ opacity */
  		display: none;
	}
	.modalBody { /* 팝업창 */
  		width: 700px;
  		padding: 50px 50px;
  		margin: 0 auto;
  		border: 1px solid #777;
  		background-color: #fff;
	}
	.closeBtn {
  		float:right;
  		font-weight: bold;
  		color: #777;
  		font-size:25px;
  		cursor: pointer;
  		margin-bottom: 30px;
	}
	
	.center1 {
		margin: 0 auto;
	}
</style>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="template/ogani/img/logobar2.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품 : ${product.productName }</h2>
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
                            <img class="product__details__pic__item--large" src="img/${product.productImg }" 
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
                        <ul>
                        	<c:if test="${product.productStock  <= '0'}">
                            <li><b>재고</b> <span>없음</span></li>
                        	</c:if>
                        	<c:if test="${product.productStock  > '0'}">
                            <li><b>재고</b> <span>있음</span></li>
                            </c:if>
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
                <!-- Shoping Cart Section Begin -->
			    <section class="shoping-cart spad center1">
			        <div class="container">
			        	<c:forEach items="${reviews}" var="r">
				            <div class="row">
				                <div class="col-lg-12">
				                    <div class="shoping__cart__table"  id="${r.reviewId}">
				                    	<div class="modalWrap">
		    								<div class="modalBody">
				                    			<div class="popup">
				      					 			<div class="popmenu">
						      					 		<span class="closeBtn" onclick="closeDisplay(event)">X</span>
								                        <div class="blog__item__pic">
								                            <img src="${r.reviewImg}" onerror="this.onerror=null; this.src='img/noimage.jpg'" width="300px" height="450px">
								                        </div>
								                        <div class="blog__item__text">
								                        	<ul>
								                                <li style="float:right"><i class="fa fa-user"> ${r.memberId }</i></li>
								                            </ul>
								                            <ul>
								                                <li><i class="fa fa-calendar-o"></i> ${r.reviewDate}</li>
								                                <li><i class="fa fa-eye hit"> ${r.reviewHit }</i></li>
								                            </ul>
								                            <h5>${r.reviewTitle }</h5>
								                            <p>${r.reviewSubject }</p>
								                            <input type="hidden" id="memberId" name="memberId" value="${id}">
								                        </div>
									            	</div>
							        			</div>
							        		</div>
										</div>
			                            <div>
					        				<div onclick= "modalDisplay(event)">
						        				<div class="popup">
				      					 			<div class="popmenu">
								                        <table>
								                            <thead>
								                                
								                            </thead>
					                           				<tbody>
								                                <tr>
								                                    <td class="shoping__cart__item">
								                                        <img src="${r.reviewImg}" onerror="this.onerror=null; this.src='img/noimage.jpg'" width="100px" height="100px" style="margin-right: 50px">
								                                        <h5>${r.reviewTitle }</h5>
								                                    </td>
								                                    <td class="shoping__cart__price" style="width: 200px">
								                                         <i class="fa fa-calendar-o">${r.reviewDate}</i>
								                                    </td>
								                                    <td class="shoping__cart__item__close">
								                                        <i class="fa fa-eye hit"> ${r.reviewHit }</i>
								                                        <input type="hidden" id="memberId" name="memberId" value="${id}">
								                                    </td>
								                                </tr>
					                           				</tbody>
								                        </table>
	                           			       		</div>
								                </div>
							                </div>
							        	</div>
				                    </div>
				                </div>
			                </div>
			            </c:forEach>
			        </div>
			    </section>
    <!-- Shoping Cart Section End -->
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
	
function modalDisplay(event) {
		
		var parentTrTag = event.target;
		
		for(;parentTrTag.className != 'shoping__cart__table'; parentTrTag=parentTrTag.parentElement);
        
		reviewUp(parentTrTag);
        parentTrTag.querySelector(".modalWrap").style.display = 'block';
	}
	
	function closeDisplay(event) {
		var parentTrTag = event.target;
		
		for(;parentTrTag.className != 'shoping__cart__table'; parentTrTag=parentTrTag.parentElement);
        parentTrTag.querySelector(".modalWrap").style.display = 'none';
	}
	
	function reviewUp(parentTrTag){
		// ajax를 이용해서 검색 결과를 가져오고 화면을 재구성한다.
		let reviewId = parentTrTag.id; //  
		
		let payload = "reviewId="+reviewId;
		let url = "ajaxreviewupdate.do";
		
		
		fetch(url,{
			method: "post",
			headers: { 'Content-Type' : 'application/x-www-form-urlencoded'},
			body: payload
		}).then(response => response.text())
			.then(text => updatehit(text, parentTrTag));
			
		  //.then(json => console.log(json));
		  
       
	}
	
	function updatehit(text, parentTrTag) {
		var selects = parentTrTag.querySelectorAll(".hit");
		for (var hitTag of selects){
			 hitTag.innerHTML = text;
		}
	}
</script>
</html>