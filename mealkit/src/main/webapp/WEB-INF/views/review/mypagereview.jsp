<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.btnWrap {
	width: 1000px;
	margin: 300px auto;
}

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
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
}

.modalBody {
	width: 700px;
	padding: 50px 50px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
}

.closeBtn {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
}

/* table css */
.list-content {
    margin: 8vh auto;
}

tr,td {
	text-align:center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>asdsa</h1>
	<!-- 리뷰 가능한 물품 리스트 출력 및 리뷰 버튼 생성 -->
		<div class="container">
		<div class="list-content">
			<table id="bootstrap-data-table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th width="50%"></th>
						<th width="25%">상품이름</th>
						<th width="25%">리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="p">
					<tr>
						<td><img src="${p.productImg}" width="20%" alt="No Image"></td>
						<td>${p.productName }</td>
						<td><input type="button" value="작성" onclick="moveReviewInsert(event)"  id="${p.productId}">
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                        	<thead>
                                
                            </thead>
				        	<c:forEach items="${reviews}" var="r">
	                            <tbody>
	                                <tr>
	                                    <td class="shoping__cart__item">
	                                        <img src="${r.reviewImg}" alt="No Image" width="100px" height="100px">
	                                    </td>
	                                    <td class="shoping__cart__item">
	                                        <h4>${r.reviewTitle }</h4>
	                                    </td>
	                                    <td class="shoping__cart__item">
	                                        <p>${r.reviewSubject }</p>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                         ${r.reviewDate}
	                                    </td>
	                                    <td class="shoping__cart__item__close">
	                                        <i class="fa fa-eye hit"> ${r.reviewHit }</i>
	                                        <input type="hidden" id="memberId" name="memberId" value="${id}">
	                                    </td>
	                                </tr>
	               				</tbody>
               				</c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    <form action="reviewinsert.do" method="post" id="frm">
    	<input type="hidden" name="productId" id="productId">
    </form>
</body>
<script type="text/javascript">
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
	 parentTrTag.querySelector(".hit").innerHTML=text;
}

function moveReviewInsert(event){
	document.getElementById("productId").value = event.target.id;
	document.getElementById("frm").submit();
}
</script>
</html>