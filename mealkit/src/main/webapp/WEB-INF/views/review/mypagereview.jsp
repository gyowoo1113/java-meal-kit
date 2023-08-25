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
	<!-- 리뷰 가능한 물품 리스트 출력 및 리뷰 버튼 생성 -->
		<div class="container">
		<div class="list-content">
			<table id="bootstrap-data-table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th colspan="4">리뷰작성</th>
					</tr>
					<tr>
						<th width="50%">제품사진</th>
						<th width="25%">상품이름</th>
						<th width="25%">상품가격</th>
						<th width="25%">리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="p">
					<tr>
						<td><img src="img/${p.productImg}" width="20%"  onerror="this.onerror=null; this.src='img/noimage.jpg'"></td>
						<td>${p.productName }</td>
						<td>${p.productPrice }</td>
						<td><input type="button" value="작성" onclick="moveReviewInsert(event)" id="${p.productId}">
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Shoping Cart Section Begin -->
    <div class="container">
		<div class="animated fadeIn">
           	<table id="bootstrap-data-table" class="table table-striped table-bordered">
           		<thead>
       				<tr>	
	                    <td colspan="5">리뷰내역</td>
                	</tr>
                  	<tr>
		                 <td>이미지</td>
		                 <td>제목</td>
		                 <td>내용</td>
		                 <td>리뷰날짜</td>
		                 <td>조회수</td>
                  	</tr>
           		</thead>
               	<tbody>
					<c:forEach items="${reviews}" var="r">
                       <tr>
                           <td>
                           	<img src="${r.reviewImg}" onerror="this.onerror=null; this.src='img/noimage.jpg'" width="200px" height="100px">
                           </td>
                           <td>${r.reviewTitle }</td>
                           <td>${r.reviewSubject }</td>
                           <td>${r.reviewDate }</td>
                           <td>${r.reviewHit }</td>
                       </tr>
					</c:forEach>
           		</tbody>		
        	</table>	
    	</div>					
    </div><!-- .content -->
    <!-- Shoping Cart Section End -->
    <form action="reviewpost.do" method="post" id="frm">
    	<input type="hidden" name="productId" id="productId" value="">
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