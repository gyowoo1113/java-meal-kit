<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6> 베스트 리뷰 되시면 사은품 있습니다 </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>리뷰 작성</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>내용<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>사진<span>*</span></p>
                                <input type="file" id="file" name="file" class="checkout__input__add">
                            </div>
                        	<div>

								<input type="submit" value="작성">&nbsp;&nbsp;&nbsp;
								<input type="reset" value="취소">
							</div>
                   	 	</div>
                   	 </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>