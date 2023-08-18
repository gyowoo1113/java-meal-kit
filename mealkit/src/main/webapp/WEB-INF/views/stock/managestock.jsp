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
							<strong class="card-title">입출고 관리</strong>
						</div>
						<div class="card-body">
							<table id="bootstrap-data-table"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>제품코드</th>
										<th>이름</th>
										<th>입출고유형</th>
										<th>입출고날짜</th>
										<th>입출고개수</th>

									</tr>
								</thead>
								<c:forEach items="${stocks}" var="s">
									<tbody>
										<tr onclick="selectNotice(${s.productId})">
											<td>${s.productId}</td>
											<td>${s.productName}</td>
											<td>${s.stockType}</td>
											<td>${s.stockDate}</</td>
											<td>${s.stockCount}</</td>

										</tr>
								</c:forEach>

							</table>
						</div>
					</div>
				</div>


			</div>
			<div>
				<form id="stockfrm" action="stockselect.do" method="post">
					<input type="hidden" id="productId" name="productId">
				</form>
			</div>
		</div>

	</div>
	<script type="text/javascript">
	function selectNotice(n){
			document.getElementById("productId").value = n;
			document.getElementById("stockfrm").submit();
		}
	</script>
</body>
</html>
