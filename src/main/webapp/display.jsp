<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시글 내용</h3>
<%
	String subject = "", memo = "", name = "", time = "", email = "";
	int boardnum = (int) session.getAttribute("boardnum");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/ebookshop";
		conn = DriverManager.getConnection(url, "java", "java");
	}
	catch(Exception e) {
		out.println("데이터베이스에 접속에 문제가 있습니다.");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	stmt = conn.createStatement();
	String sql = "select * from message where boardnum = " + boardnum;
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		subject = rs.getString("subject");
		memo = rs.getString("memo");
		name = rs.getString("name");
		time = rs.getString("time");
		email = rs.getString("email");
	}
%>

<table border = "2">
	<tr>
		<td>제목</td>
		<td><%=subject%></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=name%></td>
	</tr>
		<td>내용</td>
		<td><%=memo%></td>
	<tr>
	</tr>
	<tr>
	</tr>
	<tr>
	</tr>
	<tr>
		<td>날짜</td>
		<td><%=time%></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email%></td>
	</tr>
</table>
</body>
</html>