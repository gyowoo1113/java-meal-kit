<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 container">
					<form id="searchfrm" method="post" action="shopmenuform.do">
						<select id="key" name="key">
							<option value="category">카테고리</option>
							<option value="name">이름</option>
							<option value="comment">내용</option>
						</select>&nbsp;&nbsp;
						<input type="text" id="val" name="val">
						<input type="submit" value="search">
					</form>
				</div>
			</div>


			<div id="demo" class="carousel slide" data-ride="carousel">

				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>


				<div align="center" class="carousel-inner">
					<div class="carousel-item active">
						<img src="template/ogani/img/product/product-5.jpg" height="500"
							width="1200" alt="11">

					</div>
					<div class="carousel-item">
						<img src="template/ogani/img/product/product-1.jpg" height="500"
							width="1200" alt="22">
					</div>
					<div class="carousel-item">
						<img src="template/ogani/img/product/product-2.jpg" height="500"
							width="1200" alt="33">
					</div>
				</div>


				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>
		</div>
	</section>
</body>
</html>