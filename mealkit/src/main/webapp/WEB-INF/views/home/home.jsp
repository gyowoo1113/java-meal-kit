<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        background-color: green; 
    }
    
    .margin-set{
    	margin-bottom:20px;
    }
</style>
<body>
	<section class="featured spad">
		<div class="container">
		
						<div class="margin-set">
			<div class="row">
					<div class="col-lg-7 container">
						<div class="hero__search__form">
							<form id="searchfrm" method="post" action="shopmenuform.do">
								<select id="key" name="key">
									<option value="category">카테고리</option>
									<option value="name">이름</option>
									<option value="comment">내용</option>
								</select>
								<input type="text" id="val" name="val">
								<button type="submit" value="search" class="site-btn">SEARCH</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="demo" class="carousel slide" data-ride="carousel">

			<div align="center" class="carousel-inner">
				<c:forEach items="${products}" var="p" varStatus="loop">
					<div class="carousel-item ${loop.first ? 'active' : ''}">
						<a href="shopdetail.do?productId=${p.productId}"> <img
							src="img/${p.productImg}" height="500" width="1200">
						</a>
					</div>
				</c:forEach>
			</div>

			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>


	</section>
</body>
</html>