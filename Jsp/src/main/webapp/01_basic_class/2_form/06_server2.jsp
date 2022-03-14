<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="info.*" %>
    
<%
	String name = request.getParameter("id");
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String[] hobby = request.getParameterValues("hobby");
	String partner = request.getParameter("couple");
	
	InfoVO vo = new InfoVO();
	vo.setName(name);
	vo.setGender(gender);
	vo.setJob(job);

	vo.setPartner(partner);
	
	InfoDAO dao = InfoDAO.getInstance();
	dao.insert(vo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_server.jsp</title>
</head>
<body>
이름 : <%= name %></br>
성별 : <%= gender %> </br>
직업 : <%= job %> <br/>
취미 : <%= hobby %>
		<% for(int i = 0; i < hobby.length; i++){ %>
		<%= hobby[i] %>
		<%} //end of for %>
		<br/>
애인유무 : <%= partner %>

</body>
</html>