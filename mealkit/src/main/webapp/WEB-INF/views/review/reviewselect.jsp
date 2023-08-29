<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.center1{
		float: right;
		margin-top: -50px;
		padding: 10px;
	}
</style>
</head>
<body>
	<section class="related-blog spad">
       <div class="container">
           	<table id="bootstrap-data-table" class="table table-striped table-bordered" style="margin-top: 100px; margin-bottom: 100px;">
           		<thead>
       				<tr style="text-align: center;">	
	                    <td colspan="5">리뷰내역</td>
                	</tr>
                  	<tr style="text-align: center;">
		                 <td width="200px">리뷰사진</td>
		                 <td width="250px">제목</td>
		                 <td width="350px">내용</td>
		                 <td width="110px">리뷰날짜</td>
		                 <td width="75px">조회수</td>
                  	</tr>
           		</thead>
               	<tbody>
                       <tr>
                          <td>
                          	<img src="${reviews.reviewImg}" onerror="this.onerror=null; this.src='img/noimage.jpg'" width="200px" height="170px">
                          </td>
                          <td style="vertical-align: middle;">${reviews.reviewTitle }</td>
                          <td style="vertical-align: middle;">${reviews.reviewSubject }</td>
                          <td style="text-align: center; vertical-align: middle;">${reviews.reviewDate }</td>
                          <td style="text-align: center; vertical-align: middle;">${reviews.reviewHit }회</td>
                 	   </tr>
           		</tbody>		
        	</table>
			<button type="button" onclick="reviewDelete()" class="center1">삭제</button>&nbsp;&nbsp;
            <div>
				<form id="frm" method="post">
					<input type="hidden" id="reviewId" name="reviewId" value="${reviews.reviewId}">
				</form>
			</div>
        </div>
    </section>
</body>
<script type="text/javascript">
	function reviewDelete() {
		document.getElementById("frm").action = "reviewdelete.do";
		document.getElementById("frm").submit();
	}
</script>
</html>