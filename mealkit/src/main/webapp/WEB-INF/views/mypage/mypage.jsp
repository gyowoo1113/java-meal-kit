<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#mail {
	display: inline;
	width: 58%;
	height: calc(2.25rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#gomail {
	display: inline;
	float: right;
	width: 37%;
	height: calc(2.25rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #blue;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#mypg {
	border: 20px solid; 
}


</style>
<title>회원가입</title>
</head>
<body class="bg-white">

	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="mypg">
					<div class="login-form">
						<form>
							<div class="form-group">
								<label>* 아이디</label> <input type="text" class="form-control"
									placeholder="아이디 입력">
							</div>
							<div class="form-group">
								<label>* 비밀번호</label> <input type="password"
									class="form-control" placeholder="비밀번호 입력">
							</div>
							<div class="form-group">
								<label>* 비밀번호 확인</label> <input type="password"
									class="form-control" placeholder="동일한 비밀번호 입력">
							</div>
							<div class="form-group">
								<label>* 이름</label> <input type="text" class="form-control">
							</div>
							<div class="form-group">
								<label>* 이메일</label> <input type="email" class="form-control"
									placeholder="본인 이메일 입력"> <br> <input type="text"
									placeholder="인증번호" id="mail">
								<button id="gomail">메일인증</button>
								<br>
								<br>

							</div>


							<button type="submit"
								class="btn btn-success btn-flat m-b-30 m-t-30">회 원 가 입</button>
							<div class="register-link m-t-15 text-center">
								<p></p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="template/elaadmin/assets/js/main.js"></script>

</body>
</html>