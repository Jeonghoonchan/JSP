<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int systemlev = (Integer)session.getAttribute("syslev");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
margin : 0 auto;
width: 400px; height: 300px;
border: 1px solid black;
text-align:center;
}
</style>
</head>
<body>
<section>
	<%
	if (session.getAttribute("id") != null) {
	%>
	<h3><%=session.getAttribute("id") %>님 환영합니다.</h3>
	<% 
	if (systemlev >= 1) {
	%>
	<a href="order.jsp">도서 쇼핑하기</a>
	<%
	}
	if (systemlev >= 2) {
	%>
	<a href="list.jsp">공지사항 보기</a>
<%} }%>
<a href="logout.jsp">로그아웃</a>
</section>
</body>
</html>