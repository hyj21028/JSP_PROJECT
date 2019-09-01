<%@ page import="db.bean.* ,java.util.*, java.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="QueryBeans" scope="page" class="db.bean.QueryBeans"/>
<jsp:setProperty property="*" name="QueryBeans" />
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("pragma", "no-chahe");
	response.setDateHeader("Expires", 0);

	request.setCharacterEncoding("UTF-8");

	QueryBeans.getConnection();

	ArrayList resArrs = new ArrayList();

	 String bookSymbol = request.getParameter("book_symbol");
	 String bookName =request.getParameter("book_name");
	 String bookAuthor =request.getParameter("book_author");
	 String bookPublisher =request.getParameter("book_publisher");
	
	 int n=0;
	 
	try{
		n = QueryBeans.updateBookInfo(bookSymbol, bookName, bookAuthor, bookPublisher); 
		System.out.println(n);
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