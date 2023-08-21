<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <h2>장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
        	<form id="cartform" action="checkout.do" method="post">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="shoping__cart__table">
	                        <table>
	                            <thead>
	                                <tr>
	                                    <th class="shoping__product">상품 목록</th>
	                                    <th>가격</th>
	                                    <th>개수</th>
	                                    <th>합계</th>
	                                    <th></th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach items="${carts}" var="c">
		                                <tr id = "${c.cartId}">
		                                    <td class="shoping__cart__item">
		                                        <img src="template/ogani/img/cart/cart-1.jpg" alt="">
		                                        <h5>${c.productName}</h5>
		                                    </td>
		                                    <td class="shoping__cart__price">
		                                       ${c.productPrice }
		                                    </td>
		                                    <td class="shoping__cart__quantity">
		                                        <div class="quantity">
		                                            <div class="pro-qty">
		                                                <input type="text" value="${c.cartCount }">
		                                            </div>
		                                        </div>
		                                    </td>
		                                    <td class="shoping__cart__total">
		                                    	추가필요(JS)
		                                    </td>
		                                    <td class="shoping__cart__item__close" onclick="cartDelete(event)">
		                                        <span class="icon_close"></span>
		                                    </td>
		                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-12 container">
	                    <div class="shoping__checkout">
	                        <h5>결제 예상 금액</h5>
	                        <ul>
	                            <li>상품 가격 <span>$454.98</span></li>
	                            <li>결제 금액 <span>$454.98</span></li>
	                        </ul>
                        	<button type="submit" class="site-btn container">상품 주문하기</button>
	                    </div>
	                </div>
	            </div>
        	</form>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</body>
<script type="text/javascript">
	function cartDelete(event){
		var parentTrTag = event.target;
        //부모 태그 명이 TR이 나올때까지 자동순회
        for(;parentTrTag.tagName != 'TR'; parentTrTag=parentTrTag.parentElement);
        parentTrTag.remove();
        
		let payload = "id=" + parentTrTag.id;
		let url = "ajaxcartdelete.do";
		fetch(url,{
			method: "post",
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: payload
		});
	}
</script>
</html>