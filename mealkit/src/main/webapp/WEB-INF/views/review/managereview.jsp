<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                                            <th>리뷰 번호</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>리뷰 날짜</th>
                                            <th>제품 번호</th>
                                            <th>아이디</th>
                                            <th>리뷰 조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach items="${reviews}" var="r">
	                                        <tr>
	                                            <td>${r.reviewId}</td>
	                                            <td width="300px">${r.reviewTitle }</td>
	                                            <td>${r.reviewSubject }</td>
	                                            <td>${r.reviewDate }</td>
	                                            <td>${r.productId }</td>
	                                            <td>${r.memberId }</td>
	                                            <td>${r.reviewHit }</td>
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
</body>
</html>