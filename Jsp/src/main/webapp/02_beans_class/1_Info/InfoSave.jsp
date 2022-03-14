<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!-- 
	1) 이전 화면에서 사용자 입력값 얻어오기
	2) 그 입력값들을 InfoBean 맴버로 지정
	3) 각각의 해당하는 값을 아래 화면에 출력
 -->
<%
	request.setCharacterEncoding("utf-8");
	
	/* InfoBean info = new InfoBean();
	
	String name = request.getParameter('name');
	info.setName(name);
	
	String id = request.getParameter("id");
	info.setId(id); */	
%>
<jsp:useBean id="info" class ="info.beans.InfoBean">
	<jsp:setProperty name = "info" property="*"/> <!-- 전체선택도 * 로 가능함 -->
</jsp:useBean>
<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	<%-- 이   름  : <%=info.getName() %> <br/> --%>
	이   름  : <jsp:getProperty name = "info" property = "name"/><br/>
	<%-- 주민번호 : <%=info.getId() %><br/> --%>
	주민번호 : <jsp:getProperty name = "info" property = "id"/><br/>
	<%-- 성  별   :<%=info.getGender() %> <br/>  --%>
	성  별   :<jsp:getProperty name = "info" property = "gender"/><br/> 
	맞습니까????
</body>
</html>