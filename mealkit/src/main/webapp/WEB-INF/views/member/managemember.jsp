<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.cute {
	display: inline-block;
	backgorund-color: #fff;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}
</style>

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
							<h1 style="font-size: 150%">
								<strong>회원관리</strong>
							</h1>
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
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>등급</th>
										<th>등급수정</th>
									</tr>
								</thead>
								<c:forEach items="${members }" var="m">
									<tbody>
										<tr>
											<td>${m.memberId }</td>
											<td>${m.memberName }</td>
											<td>${m.memberEmail }</td>
											<td>${m.memberGrade }</td>
											<td>
												<form action="memberupdategrade.do" method="post">
													<input type="hidden" id="memberId" name="memberId" value=${m.memberId }> 
														<select name="memberGrade">
														<option>----------------</option>
														<option value="BRONZE">BRONZE</option>
														<option value="SILVER">SILVER</option>
														<option value="GOLD">GOLD</option>
														<option value="PLATINUM">PLATINUM</option>
														<option value="DIAMOND">DIAMOND</option>
														<option>----------------</option>
													</select>
													<button type="submit">수정</button>
												</form>
											</td>
										</tr>
									</tbody>
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