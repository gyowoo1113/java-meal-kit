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
        <div class="container" style="margin-left: 150px; margin-bottom: 100px;">
            <div class="row">
                <div class="col-lg-12">
                    <h6> 베스트 리뷰 되시면 사은품 있습니다 </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>리뷰 작성</h4>
                <form id="repost" action="reviewinsert.do" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type="hidden" id="memberId" name="memberId" value="${id}">
                                        <input type="text" id="reviewTitle" name="reviewTitle" style=" width:500px; height:50px;">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>내용<span>*</span></p>
                                <textarea name="reviewSubject" id="reviewSubject" rows="8"
								placeholder="" required="required" class="form-control" style=" width:500px;"></textarea>
                            </div>
                            <div class="checkout__input">
                                <p>사진</p>
                                <input type="hidden" id="productId" name="productId" value="${productId}">
                                <input type="file" id="file" name="file" class="checkout__input__add" style="border:none">
                            </div>
                        	<div>
								<input type="submit" value="작성" onclick="showToast()" style="margin-right: 20px">&nbsp;&nbsp;&nbsp;
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
<script type="text/javascript">
function showToast(){
    const Toast = Swal.mixin({
        toast: false,
        position: 'center-center',
        showConfirmButton: false,
        timer: 1000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast.fire({
        icon: "sucess",
        title: "잠시만 기다려주세요~!"
    })
}
</script>
</html>