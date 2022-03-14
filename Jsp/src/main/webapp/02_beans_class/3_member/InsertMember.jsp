<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 하나씩 천천히 도전합시다 -->
<!-- 
	0) 한글처리
	1) 이전 폼의 입력값을 얻어오기
	2) 각각의 입력값을 Member 빈즈에 지정
	==> 액션태그
	3) 지정된 값들을 화면 출력
 -->
 <% request.setCharacterEncoding("utf-8"); %>
 <jsp:useBean id="mem" class = "member.beans.Member">
 	<jsp:setProperty name = "mem" property = "*"/>
 </jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입 확인  </title>
</head>
<body>
	아이디 :<jsp:getProperty name ='mem' property = "id"/><br>
	패스워드 :<jsp:getProperty name ='mem' property = "password"/><br>
	이름 :<jsp:getProperty name ='mem' property = "name"/><br>
	전화 :<jsp:getProperty name ='mem' property = "tel"/><br>
	주소 :<jsp:getProperty name ='mem' property = "addr"/><br>
</body>
</html>