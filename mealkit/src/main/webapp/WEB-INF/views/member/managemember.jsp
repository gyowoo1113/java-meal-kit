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
							<h1>회원관리</h1>
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
							<strong class="card-title">회원 계정관리</strong>
						</div>
						<div class="card-body">
							<table id="bootstrap-data-table"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>이름</th>
										<th>비밀번호</th>
										<th>이름</th>
										<th>이메일</th>
										<th>등급</th>	
									</tr>
								</thead>
								<c:forEach items="" var="">
									<tbody>
										<tr>
											<td>sda</td>
											<td>sda</td>
											<td>sda</td>
											<td>sda</td>
											<td>sda</td>
										</tr>
								</c:forEach>

							</table>
							<input type="submit" value="수정">
							<input type="submit" value="삭제">
							<input type="submit" value="등급조정">
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	
	
</body>
</html>