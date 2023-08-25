<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
th, td {
  text-align: center;
}
</style>
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
                                   <th>결제/배송</th>
                                   <th></th>
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


var before_id = 0;
var detail_count = 0;
function createOrderList(){
	var order = <%= request.getAttribute("ordars") %>;
	var counts = <%= request.getAttribute("counts") %>;
	var tbody = document.getElementById("checkout_body");
	
	tbody.innerHTML = order.map((data,index) => orderViewAll(data,index,counts)).join('');
}

function orderViewAll(data,index,counts){
	
	if (before_id != data.ordarId){
		before_id = data.ordarId;
		detail_count = 0;
	}
	var list = orderView(data,index,counts);
	detail_count += 1;
	return list;
}

function orderView(data,index,counts){
	var list = ``;
	list += `<tr id="` + index + `">`;
	list += `<td>\${data.ordarId}</td>
		<td>\${data.memberId}</td>
        <td>\${data.productId}</td>
        <td>\${data.productName}</td>
        <td>\${data.orderDetailCount}</td>`;
    var date = data.ordarDate.replace("T"," ").split(".");
    list +=`<td>` + date[0]  + `</td>`;
    list += `<td>` + data.orderDetailCount*data.productPrice + `</td>`;
    
    list += `<td>` + getShipText(data)+ `</td>`; 

    if (detail_count == 0)
    {
       	if (counts[data.ordarId] != '1'){
       		list += `<td rowspan="` + counts[data.ordarId] + `">`;
       	} else {
           	list += `<td>`;
       	}
       	
        if (data.ordarPayment === 'FALSE'){
        	list += `</td></tr>`;
        } else{
        	list += getSelectTag() + `</td></tr>`;
        }
    }
   
	return list;
}

function getShipText(data){
    if (data.ordarPayment ==='FALSE'){
    	return`결제대기중`;
    } else {
    	if (data.shipCheck === 'READY'){
    		return `배송준비중`;
    	} else if (data.shipCheck ==='ING'){
    		return `배송중`;
    	} else if (data.shipCheck ==='TRUE'){
    		return `배송완료`;
    	} else {
    		return `결제완료`;
    	}
    }
}

function getSelectTag(){
	return `<select name="shipPayment" className="shipPayment">
		<option value="READY">배송준비중</option>
		<option value="ING">배송중</option>
		<option value="TRUE">배송완료</option></select>
	<input type="button" value="수정" onclick="updateShip(event)"></button>`;
}


// ------------------------------------------------- 배송정보 Update
function updateShip(event){
	var parentTrTag = event.target;
    for(;parentTrTag.tagName != 'TR'; parentTrTag=parentTrTag.parentElement);
    var idx = parentTrTag.id;
    
    doUpdateShipCheck(idx,parentTrTag);
}

function doUpdateShipCheck(idx,parentTrTag){
	var order = <%= request.getAttribute("ordars") %>;
	var ordarId = order[idx].ordarId;
	var selectTag = parentTrTag.querySelector('select');
	var option = selectTag.options[selectTag.selectedIndex];
	
	let payload = "ordarId=" + ordarId + "&option="+option.value;
	
	let url = "ajaxshipcheckupdate.do";
	fetch(url,{
		method: "post",
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: payload
	}).then(updateShipHTML(option.text,ordarId));
}

function updateShipHTML(newText, ordarId){
	var tbody = document.getElementById("checkout_body");
	var trs = tbody.querySelectorAll("tr");
	
	for (var _tr of trs){
		if (_tr.children[0].innerHTML != ordarId) {
			continue;
		}
		_tr.children[7].innerHTML = newText;
	}
}
</script>
</html>