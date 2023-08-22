<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="template/elaadmin/assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="template/elaadmin/assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="template/elaadmin/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
</head>
<body>

	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>재고관리</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">입출고 수불대장</strong>
						</div>
						<div class="card-body">

							<div class="col-sm-6">
								<div class="page-header float-right">
									<div class="page-title">
										<ol class="breadcrumb text-right">
											<li><a href="#" id="in" data-value="in"
												onclick="select('in')">IN</a></li>
											<li><a href="#" id="out" data-value="out"
												onclick="select('out')">OUT</a></li>

										</ol>
									</div>
								</div>
							</div>
							<div>
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th width="20%">제품코드</th>
											<th width="20%">이름</th>
											<th width="20%">입출고유형</th>
											<th width="20%">입출고날짜</th>
											<th width="20%">입출고개수</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${stocks}" var="s">
											<tr>
												<td>${s.productId}</td>
												<td>${s.productName}</td>
												<td>${s.stockType}</td>
												<td>${s.stockDate}</td>
												<td>${s.stockCount}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">입출고 관리</strong>
						</div>
						<div class="card-body">

							<div class="col-sm-6">
								<div class="page-header float-right"></div>
							</div>
							<div>
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th width="20%">제품코드</th>
											<th width="20%">이름</th>
											<th width="20%">가격</th>
											<th width="20%">제품생성날짜</th>
											<th width="20%">제품재고</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${products}" var="p">
											<tr 
												onclick="selectProduct(${p.productId})">
												<td>${p.productId}</td>
												<td>${p.productName}</td>
												<td>${p.productPrice}</td>
												<td>${p.productDate}</td>
												<td>${p.productStock}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<strong class="card-title"></strong>
						</div>
						<div class="card-body">

							<div id="pay-invoice">
								<div class="card-body">
									<div class="card-title">
										<h3 class="text-center">입출고</h3>
									</div>
									<hr>
									<form action="#" method="post" novalidate="novalidate">


										<div class="row form-group">
											<div class="col col-md-3">
												<label class=" form-control-label">입출고</label>
											</div>
											<div class="col col-md-3">
												<div class="form-check">
													<div class="radio">
														<label for="radio1" class="form-check-label "> <input
															type="radio" id="radio1" name="radios" value="in"
															class="form-check-input">입고
														</label>
													</div>
													<div class="radio">
														<label for="radio2" class="form-check-label "> <input
															type="radio" id="radio2" name="radios" value="out"
															class="form-check-input">출고
														</label>
													</div>

												</div>
											</div>

											<div class="col col-md-6">
												<div class="form-group">
													<label for="cc-payment" class="control-label mb-1">수량</label>
													<input id="stockCount" name="stockCount" type="number"
														class="form-control" aria-required="true"  required="required"
														aria-invalid="false">
												</div>

											</div>

										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">제품코드</label>
											<input id="productCode" name="productCode" type="number" readonly="readonly"
												class="form-control" >
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">이름</label>
											<input id="productName" name="productName" type="text" readonly="readonly"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">가격</label>
											<input id="productPrice" name="productPrice" type="text" readonly="readonly"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">제품생성날짜</label>
											<input id="productDate" name="productDate" type="date" readonly="readonly"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">제품재고</label>
											<input id="productStock" name="productStock" type="number" readonly="readonly"
												class="form-control">
										</div>

										<div>
											<button id="button" type="button" class="btn btn-lg btn-info btn-block"
												onclick = "insertStock()">슈웅
											</button>
										</div>
									</form>
								</div>
							</div>

						</div>
					</div>


				</div>

				<input type="hidden" id="productId" name="productId">
			</div>
		</div>
	</div>


	<script type="text/javascript">
	

	function select(type){
		let linkElement;
		
		if(type == 'in'){
			linkElement = document.getElementById("in");
		}else{
			linkElement = document.getElementById("out");
		}

		
		let dataValue = linkElement.getAttribute("data-value");
		
		let url = "ajaxstockselect.do";
		fetch(url,{ 
			method:"POST",
			headers: {
				"Content-Type":"application/x-www-form-urlencoded",
			},
			body: dataValue
		}).then(response => response.json())
		  .then(json => htmpConevert(json));
	}
	
	function htmpConevert(datas){
	
		document.querySelector('tbody').remove();
		const tbody = document.createElement('tbody');
		
		tbody.innerHTML = datas.map(data => htmlView(data)).join(''); 
	
		document.querySelector('#bootstrap-data-table').appendChild(tbody);
	
	}
	
	function htmlView(data){
		return `
		
		<tr>
			<td >\${data.productId}</td>
			<td >\${data.productName}</td>
			<td >\${data.stockType}</td>
			<td >\${data.stockDate}</td>
			<td >\${data.stockCount}</td>
		</tr>
			`
	}
	
	function selectProduct(n){
		
		document.getElementById("productId").value = n;
		let productId = document.getElementById("productId").value;
	
		let url = "ajaxproductselect.do?productId="+productId;
		fetch(url,{ 
			method:"POST",
			headers: {
				"Content-Type":"application/x-www-form-urlencoded",
			},
			body: productId
		}).then(response => response.json())
		  .then(json => set(json));
		
		
	}
	function set(data){
		document.getElementById("productCode").value = data.productId;
		document.getElementById("productName").value = data.productName;
		document.getElementById("productPrice").value = data.productPrice;
		document.getElementById("productDate").value = data.productDate;
		document.getElementById("productStock").value = data.productStock;
	}
	
 	function insertStock(){
		
		let productCode = document.getElementById("productCode").value;
		let radios = document.getElementById("radio1").value;
		let stockCount = document.getElementById("stockCount").value;
		
		
		 let formData = new URLSearchParams();
		 formData.append("productCode", productCode);
		 formData.append("radios", radios);
		 formData.append("stockCount", stockCount);
		
		console.log(productCode + radios + stockCount );
		 let url = "ajaxstockinsert.do";
		fetch(url,{ 
			method:"POST",
			headers: {
				"Content-Type":"application/x-www-form-urlencoded",
			},
			body: formData.toString()
		}) 
	} 

	
	
</script>
</body>
</html>
