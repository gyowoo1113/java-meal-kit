<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.list-content {
    margin: 8vh auto;
}

tr,td {
	text-align:center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="list-content">
			<table id="bootstrap-data-table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th width="20%">주문일</th>
						<th width="20%">주문번호</th>
						<th width="40%">주문상품</th>
						<th width="20%">결제/배송</th>
					</tr>
				</thead>
				<tbody id="order_body">
				</tbody>
			</table>
		</div>
	</div>
</body>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
window.onload = function(){
	createOrderList();
}

function createOrderList(){
	var addr = <%= request.getAttribute("order") %>;
	var detail = <%= request.getAttribute("detail") %>;
	var tbody = document.getElementById("order_body");
	tbody.innerHTML = addr.map((data,index)=> orderView(data,index,detail)).join('');
}

function orderView(data,index,detail){
	var list = ``;
	list += `<tr id=`+ data.ordarId +`><td>\${data.ordarDate}</td>`;
	var ordercode = data.ordarDate.replace(/\-/gi,"") + "-" + data.ordarId;
	list += `<td>` + ordercode + `</td>`;
	list += `<td>` + detail[data.ordarId]+`</td>`;
	
	if (data.ordarPayment === 'FALSE'){
		list += `<td><input type="button" value="결제" onclick="doPayment(event)"></td>`;
	} else {
		list += `<td>결제완료</td>`;
	}
	return list;
}

function doPayment(event){
	var detail = <%= request.getAttribute("detail") %>;
	var parentTrTag = event.target;
    for(;parentTrTag.tagName != 'TR'; parentTrTag=parentTrTag.parentElement);
    
    // ---------------------------- 결제 
    var alertIcon = 'success';
	var IMP = window.IMP;
	IMP.init('imp11388436');
	IMP.request_pay({		
		pg : 'kakaopay',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),   //주문번호
		name : detail[parentTrTag.id],                                  	 //상품명
		amount : 1,                    						 //가격
		//customer_uid : buyer_name + new Date().getTime(),  //해당 파라미터값이 있어야 빌링 키 발급 시도
		buyer_email : '${email}',             				 //구매자 이메일
		buyer_name : '${id}',                           		 //구매자 이름
		buyer_tel : 'hp',                                  	 //전화번호
		buyer_addr : 'addr',	                             //주소
		buyer_postcode : '123-456'                           //우편번호 
	},function(data){
		if(data.success){
			var msg = "결제 완료";
    		let payload = "orderId=" + parentTrTag.id;
    		let url = "ajaxorderupdate.do";
    		fetch(url,{
    			method: "post",
    			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    			body: payload
    		}).then(updatePayment(parentTrTag));
        }else{
        	var msg = data.error_msg;
        	alertIcon = 'error'
        }
		
        Swal.fire({
            icon: alertIcon,
            text: msg,
        });
	});
	// --------------------------------------- 결제 end
	
	function updatePayment(parentTrTag){
		parentTrTag.children[3].innerHTML = `결제완료`;
	}
}

</script>
</html>