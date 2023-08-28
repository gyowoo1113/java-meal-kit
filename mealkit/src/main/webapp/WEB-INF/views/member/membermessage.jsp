<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
        // JSP에서 설정한 메시지를 가져와서 팝업 창으로 표시
        var message = '<%= request.getAttribute("message") %>';
        
        if (message !== null && message !== "") {
            alert(message);
            

            // 로그인 성공하면 홈으로 이동
            
            if (message.includes("로그인이 정상적으로 성공했습니다.")) {
                window.location.href = 'home.do';
            }        
         

            if (message.includes("로그인이 정상적으로 성공했습니다.")) {
                window.location.href = 'home.do';
            }

         // 실패 메시지일 경우 로그인 페이지로 이동
            if (message.includes("아이디 또는 비밀번호가 맞지 않습니다.")) {
                window.location.href = 'loginform.do';
            }
         // 회원가입 성공시 로그인 페이지로 이동
            if (message.includes("회원가입이 정상적으로 완료되었습니다.")) {
                window.location.href = 'loginform.do'; 
            }
            // 등급변경 성공 or 실패시 등급수정 페이지로 이동
            if (message.includes("등급변경이 완료되었습니다.")) {
                   window.location.href = 'managemember.do'; 
               }
            
            if (message.includes("등급변경이 실패했습니다.")){
               	window.location.href = 'managemember.do';
               }
            
            if (message.includes("수정이 완료되었습니다.")){
               	window.location.href = 'mypage.do';
               }
            
            if (message.includes("수정을 실패했습니다.")){
               	window.location.href = 'mypage.do';
               }    
            if (message.includes("인증번호가 정상적으로 전송되었습니다.")){
               	window.location.href = 'searchpasswordform.do';
               } 
            if (message.includes("로그아웃이 정상적으로 완료되었습니다.")){
               	window.location.href = 'home.do';
               } 
        }
        
    </script>
</body>
</html>