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
					<tr>
						<td>102</td>
						<td>김치찌개</td>
						<td>7800</td>
						<td>2023-08-21</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>