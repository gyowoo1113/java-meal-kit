<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="template/elaadmin/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="template/elaadmin/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<style>
#uMail {
	display: inline;
	width: 55%;
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

#solomail {
	display: block;
}

a {
	color: white;
}
</style>

<title>로그인</title>
</head>
<body class="bg-white">

	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="template/elaadmin/images/logo.png" alt="">
					</a>
				</div>
				<form id="frm" method="post" >
					<div class="login-form">

						<div class="form-group">
							<label>* 아이디</label> <input type="text" class="form-control"
								placeholder="아이디 입력" id="uId" name="uId">
						</div>
						<div class="form-group">
							<label id="solomail">* 이메일</label> <input type="email"
								class="form-control" placeholder="본인 이메일 입력" id="uMail"
								name="uMail">
							<button type="submit" id="gomail" onclick="sendMail()" >메일인증</button>
							<br>
							<br> <input type="text" placeholder="인증번호"
								class="form-control"> <br>
						</div>
						<button type="submit"
							class="btn btn-success btn-flat m-b-30 m-t-30" disabled='disabled'>비밀번호 재설정</button>
						<div class="social-login-content"></div>
						</div>
				</form>
			</div>
		</div>
	</div>

	

	<script type="text/javascript">
	function sendMail() {
	    let uId = document.getElementById("uId").value; // memberId 변수에 해당 input 요소에 입력된 값이 할당
	    let uMail = document.getElementById("uMail").value; // 위와 동일
	
	    console.log("ggg" +uId + uMail);
	    
	    let url = "searchpassword.do?uId="+uId + "&uMail=" + uMail; // html 인풋박스에 적은 값을 ajax로 보냄
	    
	    fetch(url)
	        .then(response => response.text())
	        .then(text => valueCheck(text));
	}

	function valueCheck(text) {
	    if (text == 'yes') {
	        alert("인증번호가 발송되었습니다."); // 아이디와 메일이 DB값과 일치하면 인증번호 발송
	    } else {
	        alert("아이디 및 이메일이 존재하지 않습니다.");
	        document.getElementById("uId").value = ""; // 인풋값을 강제로 비움
	        document.getElementById("uId").focus(); // 아이디를 바로 입력할 수 있게 위치시킴
	    }
	}

	</script>

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