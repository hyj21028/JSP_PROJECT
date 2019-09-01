<%@ page import="db.bean.* ,java.util.*, java.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="QueryBeans" scope="page" class="db.bean.QueryBeans"/>
<jsp:setProperty property="*" name="QueryBeans" />
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("pragma", "no-chahe");
	response.setDateHeader("Expires", 0);

	request.setCharacterEncoding("UTF-8");

	QueryBeans.getConnection();


	String bookName  = request.getParameter("book_name");
	 int n=0;
	 
	try{
		n = QueryBeans.deleteBookInfo(bookName); 
	
	}catch(SQLException e){
		out.print(e.toString());
	}
	finally{
		QueryBeans.closeConnection();
		}
		out.println("{");	
		out.print("\"ResultOK\":\"" +n+ "\"");
		out.print("}"); 

		
		

%>