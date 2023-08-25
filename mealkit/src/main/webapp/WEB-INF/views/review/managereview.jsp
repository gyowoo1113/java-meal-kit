<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
=======
>>>>>>> origin/dc
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
 <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Data Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">리뷰 번호</th>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">내용</th>
                                            <th style="text-align: center;">리뷰 날짜</th>
                                            <th style="text-align: center;">제품 번호</th>
                                            <th style="text-align: center;">아이디</th>
                                            <th style="text-align: center;">리뷰 조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach items="${reviews}" var="r">
	                                        <tr>
	                                            <td width="100px" style="text-align: center;">${r.reviewId}</td>
	                                            <td width="300px">${r.reviewTitle }</td>
	                                            <td width="500px">${r.reviewSubject }</td>
	                                            <td width="200px">${r.reviewDate }</td>
	                                            <td width="100px" style="text-align: center;">${r.productId }</td>
	                                            <td width="100px">${r.memberId }</td>
	                                            <td width="100px" style="text-align: center;">${r.reviewHit }</td>
	                                        </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
=======
	<h1>리뷰관리</h1>
>>>>>>> origin/dc
</body>
</html>