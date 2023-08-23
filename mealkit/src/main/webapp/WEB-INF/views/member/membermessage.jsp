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
            
         // 실패 메시지일 경우에 로그인 페이지로 이동
            if (message.includes("아이디 또는 비밀번호가 맞지 않습니다.")) {
                window.location.href = 'loginform.do'; // 로그인 페이지의 경로
            }
        }
        
    </script>
</body>
</html>