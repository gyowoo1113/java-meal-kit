<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/popup.css">
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
                <form action="orderinsert.do" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>주문인<span>*</span></p>
                                        <input type="text" readonly="readonly" value="${name}" 
                                        name="memberName" id="memberName">
                                    </div>
                                </div>
                            </div>
                            <!-- 주소 API -->
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="우편번호" id="zip_kakao" name ="zip_kakao" 
                                class="checkout__input__add" required="required">
                                <input type="text" placeholder="주소" id="address_kakao" name ="address_kakao"
                                 class="checkout__input__add" required="required">
	                            <input type="text" placeholder="상세주소" id ="address_detail" name="address_detail"
	                            required="required">
	                            <!-- 주소이름 입력필요 -->
                            </div>
                            <div class="row">
                                    <div class="col-lg-6">
										<label>
											<input type="radio" name="addressType" value="insert" checked
											id="new_address"/> 신규 배송지
										</label>
                                    </div>
                                    <div class="col-lg-6">
										<label>
											<input type="radio" name="addressType" value="select"
											id="select_address" /> 주소록에서 선택
										</label>
                                    </div>
                                </div>
                            <div>
							</div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" readonly="readonly" value = "${email }"
                                        name ="memberEmail" id="memberEmail">
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
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="addressId" name="addressId">
                    <div id="create_cart_id">
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    <div id="modalWrap">    	
    	<div id="modalBody">
    		<ul>
    			<li>
	    			<h6>배송주소록</h6>
	    		</li>
	    		<hr>
	    		<li>
		   		    <table border="1" width="100%">
			            <!--  <caption>caption</caption> -->
			            <thead>
			                <tr bgcolor="F0F0F0">
			                    <td>우편번호</td>
			                    <td>주소</th>
			                    <td></th>
			                </tr>
			            </thead>
			            <tbody id="address_body">
			            </tbody>
			        </table>
		        </li>
	        </ul>
    	</div>
    </div>
</body>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload = function(){
		createOrderList();
		createTotal();
	    createAddressList();
	    document.getElementById("zip_kakao").addEventListener("click", function(){ //우편번호칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	if(document.getElementById('new_address').checked){
		            	document.getElementById("zip_kakao").value = data.zonecode;
		                document.getElementById("address_kakao").value = data.address; // 주소 넣기
		                document.getElementById("address_detail").focus(); //상세입력 포커싱
	            	}
	            }
	        }).open();
	    });
	    
	}
	// --------------------------------------------------------------- 주문 상품 목록 List 출력
	function createOrderList(){
		var carts = <%= request.getAttribute("carts") %>;
		var orderlist = document.getElementById('#orderlist');
		orderlist.innerHTML = `<ul>` + carts.map(data => orderListView(data)).join('');
		
		var ids = document.getElementById("create_cart_id");
		// orderinsert 시 사용할 cartId 목록을 hidden input tag로 생성
		ids.innerHTML = `<input type="hidden" id="cart_num" name="cart_num" value=` + carts.length +`>`+
			carts.map((data,index) =>cartIdView(data,index)).join('');
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
	
	function cartIdView(data,index){
		var list = ``;
		var idx = "cart[" + index + "]";
		list += `<input type="hidden" name="` +  idx + `" value="` + data.cartId + `">`;
		return list;
	}
	
	//--------------------------------------- 주소 목록 생성
	
	function createAddressList(){
		var addr = <%= request.getAttribute("address") %>;
		var tbody = document.getElementById("address_body");
		tbody.innerHTML = addr.map((data,index)=> addressView(data,index)).join('');
	}
	
	function addressView(data,index){
		var list = `<tr id=`+index+`><td>\${data.addressZip}</td>`;
		var detail = data.addressDetail.split('/');
		list += `<td>`+ detail[0] +` ` + detail[1] + `</td>`;
		list += `<td><input type="button" value="선택" onclick="inputAddress(event)"/><td></tr>`;
		return list;
	}
	
	//----------------------------------------- 팝업창 띄우기
	const modal = document.getElementById('modalWrap');
	document.getElementById('new_address').onclick = function() {
		switchReadonly(true);
	}
	
	document.getElementById('select_address').onclick = function() {
		switchReadonly(false);
		modal.style.display = "block";
	}
	
	// ----------------------------------------------------주소 radio control
	function switchReadonly(isWrite){
		var ids = ['zip_kakao','address_kakao','address_detail'];
		for (var id of ids){
			document.getElementById(id).value =``;
			document.getElementById(id).readOnly = (isWrite) ? false : true;
		}
	}
	
	function inputAddress(event){
		var parentTrTag = event.target;
        for(;parentTrTag.tagName != 'TR'; parentTrTag=parentTrTag.parentElement);
        var id = parentTrTag.id;
        
        // address 항목 채워넣기
		var addr = <%= request.getAttribute("address") %>;
        var detail = addr[id].addressDetail.split("/");
        document.getElementById('zip_kakao').value = addr[id].addressZip;
        document.getElementById('address_kakao').value = detail[0];
        document.getElementById('address_detail').value = detail[1];
        
        // modalWrap 닫기
		modal.style.display = "none";
        
        // 해당 주소를 input tag value로 설정
        document.getElementById('addressId').value = addr[id].addressId;
	}
	
	window.onclick = function(event) {
	  	if (event.target == modal) {
    		modal.style.display = "none";
 	 	}
	}
</script>
</html>