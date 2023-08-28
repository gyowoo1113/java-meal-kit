<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.center1{
		margin-right: 100px;
		width: 1000px;
	}
	.tdline{
		line-height: 170px;
	}
	
	td{
		vertical-align: middle;
	}
	input{
		margin-top: 60px;
		padding: 10px;
		text-align: center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 리뷰 가능한 물품 리스트 출력 및 리뷰 버튼 생성 -->
		<div class="container">
		<div class="list-content center1">
			<table id="bootstrap-data-table" class="table table-striped table-bordered" style="margin-top: 50px;"> 
				<thead>
					<tr style="text-align: center;">
						<th colspan="4">리뷰작성</th>
					</tr>
					<tr  style="text-align: center;">
						<th width="200px">제품사진</th>
						<th width="320px">상품이름</th>
						<th>상품가격</th>
						<th>리뷰</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="p">
					<tr>
						<td><img src="img/${p.productImg}" width="200px" height="170px" onerror="this.onerror=null; this.src='img/noimage.jpg'"></td>
						<td class="tdline">${p.productName }</td>
						<td class="tdline" style="text-align: center;">${p.productPrice }원</td>
						<td><div style="text-align: center;"><input type="button" value="작성" onclick="moveReviewInsert(event)" id="${p.productId}"></div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Shoping Cart Section Begin -->
    <div class="container">
		<div class="animated fadeIn center1">
           	<table id="bootstrap-data-table" class="table table-striped table-bordered" style="margin-top: 100px; margin-bottom: 100px;">
           		<thead>
       				<tr style="text-align: center;">	
	                    <td colspan="5">리뷰내역</td>
                	</tr>
                  	<tr style="text-align: center;">
		                 <td width="200px">리뷰사진</td>
		                 <td width="250px">제목</td>
		                 <td width="350px">내용</td>
		                 <td width="110px">리뷰날짜</td>
		                 <td width="75px">조회수</td>
                  	</tr>
           		</thead>
               	<tbody>
					<c:forEach items="${reviews}" var="r">
                       <tr>
                          <td>
                          	<img src="${r.reviewImg}" onerror="this.onerror=null; this.src='img/noimage.jpg'" width="200px" height="170px">
                          </td>
                          <td style="vertical-align: middle;">${r.reviewTitle }</td>
                          <td style="vertical-align: middle;">${r.reviewSubject }</td>
                          <td style="text-align: center; vertical-align: middle;">${r.reviewDate }</td>
                          <td style="text-align: center; vertical-align: middle;">${r.reviewHit }회</td>
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
function moveReviewInsert(event){
	document.getElementById("productId").value = event.target.id;
	document.getElementById("frm").submit();
}
</script>
</html>