<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<%
	// 요청 MemberServlet 에
	// command를 list 로 설정해서 보낸다.
	response.sendRedirect("Start.do");
%>
</body>
</html>
