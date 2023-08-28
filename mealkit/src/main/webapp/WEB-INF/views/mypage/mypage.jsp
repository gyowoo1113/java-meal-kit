<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

#a{
	color: #fff;
}


</style>
<title>회원가입</title>
</head>
<body class="bg-white">
	<div class="container" style="margin-left: 100px; margin-top: -100px;">
		<div class="login-content">
			<div class="mypg">
				<div class="login-form">
					<br><br>
					<form id="frm" action="membermypageupdate.do" method="post">
						<div class="form-group">
							<label>아이디</label> <input type="text" class="form-control" id="id" name="id" value="<%= session.getAttribute("id") %>" readonly >
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password"
								class="form-control" id="pw" name="pw" value="<%= session.getAttribute("pw") %>" readonly>
						</div>
						<div class="form-group">
							<label>이름</label> <input type="text" class="form-control" id="name" name="name" value="<%= session.getAttribute("name") %>">
						</div>
						<div class="form-group">
							<label>이메일</label> <input type="email" class="form-control"
								id="email" name="email" value="<%= session.getAttribute("email") %>">
						</div>
						<div class="form-group">
							<label>등급</label> <input type="text" class="form-control"
								id="grade" name="grade" value="<%= session.getAttribute("grade") %>" readonly> <br>
						</div>
						<button type="submit"
							class="btn btn-success btn-flat m-b-30 m-t-30">수정하기</button>
					</form>
					<br>
					<button type="button" class="btn btn-success btn-flat m-b-30 m-t-30"><a href="memberdeleteform.do">회원탈퇴</a></button>
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