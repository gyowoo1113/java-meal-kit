<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
										<th>제품재고</th>
										<th>입출고유형</th>
										<th>입출고날짜</th>
										<th>입출고개수</th>
										
									</tr>
								</thead>
								<c:forEach items="" var="">
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
								</c:forEach>

							</table>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>