<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>인터넷 프로그래머 서점</h1>
<h2>주문해주셔서 감사합니다.</h2>
<% 
	String[] ids = request.getParameterValues("id");
	if (ids != null) {
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/ebookshop";
		Connection conn = DriverManager.getConnection(url, "java", "java");
		Statement stmt = conn.createStatement();
		String sqlstr;
		int recordupdated;
		ResultSet rs;
%>
<table border=2>
	<tr>
	<th>저자</th>
	<th>제목</th>
	<th>가격</th>
	<th>수량</th>
	</tr>
<%
	for (int i = 0; i < ids.length; ++i) {
		sqlstr = "UPDATE books SET qty = qty - 1 WHERE id =" + ids[i];
		recordupdated = stmt.executeUpdate(sqlstr);
		sqlstr = "SELECT * FROM books WHERE id=" + ids[i];
		rs = stmt.executeQuery(sqlstr);
		while (rs.next()) {
%>
	<tr>
	<td><%=rs.getString("author") %></td>
	<td><%=rs.getString("title") %></td>
	<td><%=rs.getInt("price") %></td>
	<td><%=rs.getInt("qty") %></td>
	</tr>
<% }
	rs.close();
	}
	stmt.close();
	conn.close();
	}
		%>
</table>
</body>
</html>