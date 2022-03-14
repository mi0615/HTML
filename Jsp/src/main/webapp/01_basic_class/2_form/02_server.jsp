<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- (1) 이전 폼의 사용자 입력값 얻어오기
    	-request.getParameter("파라미타명")
    	-request.getParameterValues("파라미타명")
     -->
<%
	String name = request.getParameter("name");		
    String gender = request.getParameter("gender"); 	
    String occupation = request.getParameter("occupation");	
    String[] hobby = request.getParameterValues("hobby");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_server.jsp</title>
</head>
<body>
<!-- (2) 가져온 값들을 출력 -->
이름 : <%= name %> </br>
성별 : <%= gender %></br>
직업 : <%= occupation %> <br/>
취미 : <% for(int i = 0; hobby != null && i <hobby.length; i++){ %>
		<%= hobby[i] %>
		<% } //end of for %>
</body>
</html>