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


	String mem_id =request.getParameter("m_id");
	 
	int n=0;
	 
	try{
		n = memberBeans.deleteMemInfo(mem_id); 
	
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