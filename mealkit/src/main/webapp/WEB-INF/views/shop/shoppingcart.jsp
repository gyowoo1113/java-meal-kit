<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                                <tr>
	                                    <td class="shoping__cart__item">
	                                        <img src="template/ogani/img/cart/cart-1.jpg" alt="">
	                                        <h5>Vegetable’s Package</h5>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                        $55.00
	                                    </td>
	                                    <td class="shoping__cart__quantity">
	                                        <div class="quantity">
	                                            <div class="pro-qty">
	                                                <input type="text" value="1">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="shoping__cart__total">
	                                        $110.00
	                                    </td>
	                                    <td class="shoping__cart__item__close">
	                                        <span class="icon_close"></span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="shoping__cart__item">
	                                        <img src="template/ogani/img/cart/cart-2.jpg" alt="">
	                                        <h5>Fresh Garden Vegetable</h5>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                        $39.00
	                                    </td>
	                                    <td class="shoping__cart__quantity">
	                                        <div class="quantity">
	                                            <div class="pro-qty">
	                                                <input type="text" value="1">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="shoping__cart__total">
	                                        $39.99
	                                    </td>
	                                    <td class="shoping__cart__item__close">
	                                        <span class="icon_close"></span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="shoping__cart__item">
	                                        <img src="template/ogani/img/cart/cart-3.jpg" alt="">
	                                        <h5>Organic Bananas</h5>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                        $69.00
	                                    </td>
	                                    <td class="shoping__cart__quantity">
	                                        <div class="quantity">
	                                            <div class="pro-qty">
	                                                <input type="text" value="1">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="shoping__cart__total">
	                                        $69.99
	                                    </td>
	                                    <td class="shoping__cart__item__close">
	                                        <span class="icon_close"></span>
	                                    </td>
	                                </tr>
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
</html>