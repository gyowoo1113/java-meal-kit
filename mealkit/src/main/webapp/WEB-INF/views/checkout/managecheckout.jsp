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
 <div class="content">
   <div class="animated fadeIn">
       <div class="row">
           <div class="col-md-12">
               <div class="card">
                   <div class="card-header">
                       <strong class="card-title">주문목록</strong>
                   </div>
                   <div class="card-body">
                       <table id="bootstrap-data-table" class="table table-striped table-bordered">
                           <thead>
                               <tr>
                               	   <th>주문번호</th>
                                   <th>구매자</th>
                                   <th>상품번호</th>
                                   <th>상품이름</th>
                                   <th>판매개수</th>
                                   <th>주문날짜</th>
                                   <th>판매금액</th>
                                   <th>결제상태</th>
                               </tr>
                           </thead>
                           <tbody id = "checkout_body">
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>

       </div>
   </div><!-- .animated -->
</div><!-- .content -->
</body>
<script type="text/javascript">
window.onload = function(){
	createOrderList();
}

function createOrderList(){
	//console.log(ordars);
	var order = <%= request.getAttribute("ordars") %>;
	//console.log(order);
	var tbody = document.getElementById("checkout_body");
	tbody.innerHTML = order.map((data,index)=> orderView(data,index)).join('');
}

function orderView(data,index){
	var list = ``;
	list += `<tr><td>\${data.ordarId}</td>
		<td>\${data.memberId}</td>
        <td>\${data.productId}</td>
        <td>\${data.productName}</td>
        <td>\${data.orderDetailCount}</td>`;
    var date = data.ordarDate.replace("T"," ").split(".");
    list +=`<td>` + date[0]  + `</td>`;
    list += `<td>` + data.orderDetailCount*data.productPrice + `</td>`;
    list += `<td>`;
    if (data.ordarPayment ==='FALSE'){
    	list += `결제대기중`;
    } else {
    	list += `결제완료`;
    }
    list += `</td></tr>`;
	return list;
}
</script>
</html>