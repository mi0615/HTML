<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ page errorPage = "02_NormalErrorPage.jsp" %> <!--사용자에게 에러시 보여주는 화면 /원래는 다른곳에 지정함-->

<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@119.197.89.252:1521:xe";
	String id = "scott";
	String pw = "tiger"; 
	// 2. 연결객체 얻어오기
 	Connection con = DriverManager.getConnection(url,id,pw);
	// 3. sql 문장 만들기
	String sql = "SELECT*FROM emp2";
	// 4. 전송 객체 얻어오기 (preparedStatement)
	PreparedStatement ps = con.prepareStatement(sql);
	// 5. 전송 ( executeQuery()/executeUpdate() )
	ResultSet rs = ps.executeQuery();

%>



<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>
<!-- (6)결과 출력 -->
<% while(rs.next()){ %>
	<tr>
	<td><%= rs.getInt("EMPNO") %></td>
	<td><%= rs.getString("ENAME") %></td>
	<td><%= rs.getString("JOB") %></td>
	<td><%= rs.getInt("EMPNO") %></td>
	<td><%= rs.getString("HIREDATE") %></td>
	</tr>
<%}// end of while %>

	  <tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	  </tr>


</table>
</div>
</body>
</html>
