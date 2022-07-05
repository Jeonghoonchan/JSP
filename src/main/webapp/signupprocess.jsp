<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String signid = request.getParameter("id");
String signpass = request.getParameter("pass");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/ebookshop";
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, "java", "java");
		
		String sql = "INSERT INTO Customer VALUES ('";
		sql += signid + "', '";
		sql += signpass + "', 1);";
		
		stmt = conn.createStatement();
		
		stmt.executeQuery(sql);
		
		sql = "SELECT * FROM Customer WHERE userid = " ;
		sql += "'" + signid + "' ;";
		
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			if (signid.equals(rs.getString(1))) {
				%>
				<h1>회원가입 성공</h1>
				<a href="login.html">로그인 화면으로</a>
				<%
			}
		}
	}
	catch(Exception e) {
		out.println("DB 에러");
		e.printStackTrace();
	}
	
	conn.close();
	stmt.close();
	rs.close();
%>
</body>
</html>