<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%

//1. 이전 화면에서 사용자 입력값(선택값)을 얻어오기

EmpVO vo = new EmpVO();
vo.setEmpno(Integer.parseInt(request.getParameter("empno")));
vo.setEname(request.getParameter("ename"));
vo.setDeptno(Integer.parseInt(request.getParameter("deptno")));
vo.setJob(request.getParameter("job"));
vo.setSal(Integer.parseInt(request.getParameter("sal")));

//2. JDBC 연동하여 입력하기(여기서 하지 않음)
EmpDAO dao = EmpDAO.getInstance();
dao.insert(vo);

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.
</body>
</html>