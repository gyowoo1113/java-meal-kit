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
	                            <li>상품 가격 <span></span></li>
	                            <li>결제 금액 <span></span></li>
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
        updateTotalPrice();
        
        var list_num = document.getElementById('#list_num');
        list_num.value = list_num.value-1;
	}
	
	// +- 수량 반영 -----------------------------------------------------------
	
	function updateCount(event){
		var content = event.target.textContent;
		var inputTarget = event.target.parentElement.querySelector('input');
        var count = inputTarget.value;
        
		var parentTrTag = event.target;
        for(;parentTrTag.tagName != 'TR'; parentTrTag=parentTrTag.parentElement);
        
        var idx = (content == '+') ? Number(count) + 1 : Number(count) - 1;
        if (idx < 1){ 
        	return;
        }
        
        inputTarget.value = idx;
        updateCountToCart(idx, parentTrTag.id);
        updateCartTotalView(idx,parentTrTag);
        updateTotalPrice();
	}
	
	function updateCountToCart(idx, id){
		let payload = "count=" + idx + "&id=" + id;
		let url = "ajaxcartupdate.do";
		fetch(url,{
			method: "post",
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: payload
		});
	}
	
	function updateCartTotalView(idx, parentTrTag){
		var priceTag = parentTrTag.querySelector('.shoping__cart__price');
		var totalTag = parentTrTag.querySelector('.shoping__cart__total');
		var value = priceTag.textContent.substr(1).replace(",","");
		
		var price = value * idx;
		totalTag.textContent = `￦` + price.toLocaleString();
	}
	
	// ------------------- 가격 총합 반영 --------------------------------------
	function updateTotalPrice(){
		var tag = document.querySelector('.shoping__checkout');
		var spanTag = tag.querySelectorAll('span');
		
		var priceTags = document.querySelectorAll('.shoping__cart__total');
		var total = 0;
		priceTags.forEach(tag => {
			total += Number(tag.textContent.substr(1).replace(",",""));
		})
		
		spanTag.forEach(tag =>{
			tag.textContent = `￦` + total.toLocaleString();
		})
	}
	
	// ------------------- 장바구니 목록 생성 ------------------------------------
	window.onload = function(){
		createCartList();
		updateTotalPrice();
	}
	
	function createCartList(){
		var carts = <%= request.getAttribute("carts") %>;
		document.querySelector('tbody').remove();	
		
		const tbody = document.createElement('tbody');
		tbody.innerHTML = `<input type="hidden" id="#list_num" name="list_num" value=` + carts.length + `>` + 
		carts.map((data,index) => htmlView(data,index)).join('');
		document.querySelector('table').appendChild(tbody);
	}
	
	function htmlView(data,idx){
		var idx = "carts[" + idx + "].cartId";
		var list = ``;
		list += `<input name =` + idx + ` type ="hidden" value="\${data.cartId}">`;
		list += `<tr id = "\${data.cartId}">`;
	    list += `<td class="shoping__cart__item">
	            <img src="\${data.productImg}" width="100" height="100" alt="">
	            <h5>\${data.productName}</h5>
	        </td>
	        <td class="shoping__cart__price">`;
	    list += `￦` + data.productPrice.toLocaleString();
	    list += `</td>
	        <td class="shoping__cart__quantity">
	            <div class="quantity">
	                <div class="pro-qty">
	            		<span class="dec qtybtn" onclick = "updateCount(event)">-</span>
	                    <input type="text" value="\${data.cartCount }" minlength="1" readonly="readonly">
	                    <span class="inc qtybtn" onclick = "updateCount(event)">+</span>
	                </div>
	            </div>
	        </td>
	        <td class="shoping__cart__total">`;
	    
	    var sum_price = data.productPrice * data.cartCount;
	    list += `￦` + sum_price.toLocaleString();
	    list += `
	        </td>
	        <td class="shoping__cart__item__close" onclick="cartDelete(event)">
	            <span class="icon_close"></span>
	        </td>
    	</tr>`; 
		return list;
	}

	// ------------------- 장바구니 목록 생성 End ------------------------------------
</script>
</html>