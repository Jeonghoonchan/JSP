<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.DAO" %>
<%@ page import="DTO.DTO" %>

<%
request.setCharacterEncoding("utf-8");
String loginid = request.getParameter("id");
String loginpass = request.getParameter("pass");
//String dbid = application.getInitParameter("mariadbId");
//String dbpass = application.getInitParameter("mariadbPasswd");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/ebookshop";
		conn = DriverManager.getConnection(url, "java", "java");
		
		String sql = "SELECT * FROM Customer WHERE userid = " ;
		sql += "'" + loginid + "' AND userpass = '" ;
		sql += loginpass + "' ;";
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			if (loginid.equals(rs.getString(1))) {
				if (loginpass.equals(rs.getString(2))) {
					session.setAttribute("id", rs.getString(1));
					session.setAttribute("syslev", rs.getInt(3));
					response.sendRedirect("main.jsp");
				}
			}
		}
	}
	catch(Exception e) {
		out.println("DB연결 에러");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>