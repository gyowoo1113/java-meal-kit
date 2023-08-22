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
                        <h2>주문과정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>배송정보 입력</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>주문인<span>*</span></p>
                                        <!-- id, name 추가 필요 -->
                                        <input type="text" readonly="readonly" value="${name}">
                                    </div>
                                </div>
                            </div>
                            <!-- 주소 API -->
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="우편번호" id="zip_kakao" class="checkout__input__add">
                                <input type="text" placeholder="주소" id="address_kakao" class="checkout__input__add">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                		<input type="text" placeholder="상세주소" id ="address_detail">
	                                    </div>
	                                </div>
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                		<input type="text" placeholder="참고항목" id ="address_info">
	                                    </div>
	                                </div>
	                            </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" readonly="readonly" value = "${email }">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 결제정보 , 상품목록 -->
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">주문 상품 정보<span>가격/개수</span></div>
                                <!-- forEach : table로 변경필요 -->
                                <div id ="#orderlist">
                                </div>
                                <div class="checkout__order__subtotal">Subtotal <span></span></div>
                                <div class="checkout__order__total">Total <span></span></div>
                                <!-- 결제 API -->
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
<script type="text/javascript">
	window.onload = function(){
		createOrderList();
		createTotal();
	}
	
	function createOrderList(){
		var carts = <%= request.getAttribute("carts") %>;
		var orderlist = document.getElementById('#orderlist');
		orderlist.innerHTML = `<ul>` + carts.map(data => orderListView(data)).join('');
	}
	
	function orderListView(data){
		var price = data.productPrice;
		return `<li>\${data.productName} <span>￦`+ price.toLocaleString()+ `/` + data.cartCount + `</span></li>`;
	}
	
	function createTotal(){
		var carts = <%= request.getAttribute("carts") %>;
		var subTotalTag = document.querySelector('.checkout__order__subtotal span');
		var totalTag = document.querySelector('.checkout__order__total span');
		var total = 0;
		
		carts.map(data => {
			total += data.productPrice * data.cartCount;
		})
		total = `￦` + total.toLocaleString();
		
		subTotalTag.textContent = total;
		totalTag.textContent = total;
	}
</script>
</html>