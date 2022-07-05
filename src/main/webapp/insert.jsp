<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name, email, subject, memo, time;
	name = request.getParameter("name");
	email = request.getParameter("email");
	time = request.getParameter("time");
	subject = request.getParameter("subject");
	memo = request.getParameter("memo");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/ebookshop";
		conn = DriverManager.getConnection(url, "java", "java");
	}
	catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 있습니다.");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	stmt = conn.createStatement();
	sql = "INSERT INTO message (subject, name, memo, email) ";
	sql += "VALUES (" + "'" + subject + "', '" + name + "', '" + memo + "', '" + email + "' );";
	try {
		stmt.executeUpdate(sql);
	}
	catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 있습니다.");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<h3>게시글이 등록되었습니다.</h3>
<a href="list.jsp"> 게시글 리스트 보기</a>
</body>
</html>