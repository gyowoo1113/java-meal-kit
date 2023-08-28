<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<strong>제품등록</strong>
			</div>
			<div class="card-body card-block">
				<form action="insertproduct.do" method="post"
					enctype="multipart/form-data" class="form-horizontal">

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="text-input" class=" form-control-label">제품이름</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="productName" name="productName"
								placeholder="" required="required" class="form-control">
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="email-input" class=" form-control-label">제품가격</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="number" id="productPrice" name="productPrice"
								placeholder="" required="required" class="form-control">
						</div>
					</div>


					<div class="row form-group">
						<div class="col col-md-3">
							<label for="textarea-input" class=" form-control-label">제품설명</label>
						</div>
						<div class="col-12 col-md-9">
							<textarea name="productComment" id="productComment" rows="9"
								placeholder="" required="required" class="form-control"></textarea>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="select" class=" form-control-label">카테고리</label>
						</div>
						<div class="col-12 col-md-9">
							<select name="categoryId" id="categoryId" class="form-control">

								<option value="1">찌개</option>
								<option value="2">국</option>
								
							</select>
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="file-input" class=" form-control-label">이미지
								파일</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="file" id="file" name="file"
								class="form-control-file">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="email-input" class=" form-control-label">제품재고</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="number" id="productStock" name="productStock"
								placeholder="" required="required" class="form-control">
						</div>
					</div>
					<div class="col col-md-12">
						<button type="submit" class="btn btn-lg btn-info btn-block">
							등록</button>
					</div>

				</form>
			</div>

		</div>

	</div>
</body>
</html>