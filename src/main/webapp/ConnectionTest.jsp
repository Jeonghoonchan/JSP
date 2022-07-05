<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Connect.DBConnection" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = application.getInitParameter("mariadbDriver");
	String url = application.getInitParameter("mariadbURL");
	String id = application.getInitParameter("mariadbId");
	String passwd = application.getInitParameter("mariadbPasswd");

	DBConnection jdbc = new DBConnection(driver, url, id, passwd);
	jdbc.close();
%>
</body>
</html>