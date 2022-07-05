<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.DAO" %>
<%@ page import="DTO.DTO" %>

<%
request.setCharacterEncoding("utf-8");
String loginid = request.getParameter("id");
String loginpass = request.getParameter("pass");
String dbid = application.getInitParameter("mariadbId");
String dbpass = application.getInitParameter("mariadbPasswd");
String dburl = application.getInitParameter("mariadbURL");
String dbDriver = application.getInitParameter("mariadbDriver");

DAO dao = new DAO(dbDriver, dburl, dbid, dbpass);
DTO dto = dao.getDTO(loginid, loginpass);
dao.close();

	if(dto.getId() != null ) {
		session.setAttribute("id", dto.getId());
		session.setAttribute("syslev", dto.getSyslev());
		response.sendRedirect("main.jsp");
	}
	else {
		response.sendRedirect("login.html");
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