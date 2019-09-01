<%@ page import="db.bean.* ,java.util.*, java.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberBeans" scope="page" class="db.bean.memberBeans"/>
<jsp:useBean id="login" class="db.bean.memberBeans" scope="session"/>
<jsp:setProperty property="*" name="memberBeans" />
<%
	request.setCharacterEncoding("UTF-8");

	String mem_mail = request.getParameter("LoginEmail");
	String mem_pwd = request.getParameter("LoginPwd");
	
	boolean result = true;
	if(result){
		session.setAttribute("m_email", mem_mail);
		session.setAttribute("m_pwd", mem_pwd);
		session.setMaxInactiveInterval(60*5);//5분
		response.sendRedirect("BookInfo_main.jsp");
	}
	if(mem_mail!=null)
	{
%>
	alert("세션시간이 경과되었습니다. 다시 로그인 해주세요");

<%
	response.sendRedirect("BookInfo_main.jsp");
	}%>
