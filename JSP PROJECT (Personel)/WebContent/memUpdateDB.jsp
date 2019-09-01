<%@ page import="db.bean.* ,java.util.*, java.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="memberBeans" scope="page" class="db.bean.memberBeans"/>
<jsp:setProperty property="*" name="memberBeans" />
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("pragma", "no-chahe");
	response.setDateHeader("Expires", 0);

	request.setCharacterEncoding("UTF-8");

	memberBeans.getConnection();

	ArrayList resArrs = new ArrayList();

	 String mem_firstName = request.getParameter("m_fname");
	 String mem_lastName  =request.getParameter("m_lname");
	 String mem_id =request.getParameter("m_id");
	 String mem_pwd =request.getParameter("m_pwd");
	 String mem_mail =request.getParameter("m_mail ");	
	
	 int n=0;
	 
	try{
		n = memberBeans.updateMemInfo(mem_firstName, mem_lastName, mem_id, mem_pwd, mem_mail); 
		System.out.println(n);
	}catch(SQLException e){
		out.print(e.toString());
	}
	finally{
		memberBeans.closeConnection();
		}
		
		out.println("{");	
		out.print("\"ResultOK\":\"" +n+ "\"");
		out.print("}"); 
%>