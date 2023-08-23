<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
	.btnWrap {
  		width: 500px;
 		margin: 100px auto;
	}
	.popupBtn {
  		width: 150px;
  		height: 50px;
 		padding: 10px 5px;
	}
	.modalWrap {
 		position: fixed; /* Stay in place */
  		z-index: 1; /* Sit on top */
  		padding-top: 100px; /* Location of the box */
  		left: 0;
  		top: 0;
  		width: 100%; /* Full width */
  		height: 100%; /* Full height */
  		overflow: auto; /* Enable scroll if needed */
  		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  		display: none;
	}

	.modalBody {
  		width: 700px;
  		padding: 50px 50px;
  		margin: 0 auto;
  		border: 1px solid #777;
  		background-color: #fff;
	}

	.closeBtn {
  		float:right;
  		font-weight: bold;
  		color: #777;
  		font-size:25px;
  		cursor: pointer;
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- Related Blog Section Begin -->
    <section class="related-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2>베스트 리뷰</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                	<c:forEach items="${reviews}" var="r">
		                    <div class="blog__item" id="${r.reviewId}">
		                    	<div class="modalWrap">
		    						<div class="modalBody">
				                    	<div class="popup">
				      					 	<div class="popmenu">
				      					 		<span class="closeBtn" onclick="closeDisplay(event)">X</span>
						                        <div class="blog__item__pic">
						                            <img src="${r.reviewImg}" alt="">
						                        </div>
						                        <div class="blog__item__text">
						                            <ul>
						                                <li><i class="fa fa-calendar-o"></i>${r.reviewDate}</li>
						                                <li><i class="fa fa-comment-o"></i> 5</li>
						                            </ul>
						                            <h5><a href="#">${r.reviewTitle }</a></h5>
						                            <p>${r.reviewSubject }</p>
						                            <h5 class="hit">${r.reviewHit }</h5>
						                            <input type="hidden" id="memberId" name="memberId" value="${id}">
						                        </div>
							            	</div>
					        			</div>
					        		</div>
								</div>
					        	<div class="btnWrap">
					        		<div class="popupBtn" onclick= "modalDisplay(event)">
			  							<div class="blog__item__pic">
							            	<img src="${r.reviewImg}" alt="">
				                        </div>
				                        <div class="blog__item__text">
				                            <ul>
				                                <li><i class="fa fa-calendar-o"></i>${r.reviewDate}</li>
				                                <li><i class="fa fa-comment-o"></i> 5</li>
				                            </ul>
				                            <h5><a href="#">${r.reviewTitle }</a></h5>
				                            <p>${r.reviewSubject }</p>
				                            <h5 class="hit">${r.reviewHit }</h5>
				                        </div>
			                        </div>
								</div>	
		                    </div>
					</c:forEach>					           
                </div>
            </div>
        </div>
    </section>
    <!-- Related Blog Section End -->
</body>
<script type="text/javascript">
	
	function modalDisplay(event) {
		
		var parentTrTag = event.target;
		
		for(;parentTrTag.className != 'blog__item'; parentTrTag=parentTrTag.parentElement);
        
		reviewUp(parentTrTag);
        parentTrTag.querySelector(".modalWrap").style.display = 'block';
	}
	
	function closeDisplay(event) {
		var parentTrTag = event.target;
		
		for(;parentTrTag.className != 'blog__item'; parentTrTag=parentTrTag.parentElement);
        parentTrTag.querySelector(".modalWrap").style.display = 'none';
	}
	
	function reviewUp(parentTrTag){
		// ajax를 이용해서 검색 결과를 가져오고 화면을 재구성한다.
		let reviewId = parentTrTag.id; //  
		
		let payload = "reviewId="+reviewId;
		let url = "ajaxreviewupdate.do";
		
		
		fetch(url,{
			method: "post",
			headers: { 'Content-Type' : 'application/x-www-form-urlencoded'},
			body: payload
		}).then(response => response.text())
			.then(text => updatehit(text, parentTrTag));
			
		  //.then(json => console.log(json));
		  
       
	}
	
	function updatehit(text, parentTrTag) {
		 parentTrTag.querySelector(".hit").innerHTML=text;
	}
</script>
</html>