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

	ArrayList resArrs = new ArrayList();

	String bookName = request.getParameter("book_name") == null ? "" : request.getParameter("book_name").trim();

	try {
		resArrs = QueryBeans.getBookInfo(bookName);
		
			
	} catch (SQLException e) {
		out.print(e.toString());
	} finally {
		QueryBeans.closeConnection();
	}

	out.println("{");
	out.println("\"bookInfo\":[");

	if (resArrs.size() == 0) {
		out.println("]");
		out.println("}");

	} else {
		out.print("{");
		out.print("\"SYMBOL\":\"" + (String) resArrs.get(0) + "\",");
		out.print("\"NAME\":\"" + (String) resArrs.get(1) + "\",");
		out.print("\"AUTHOR\":\"" + (String) resArrs.get(2) + "\",");
		out.print("\"PUBLISHER\":\"" + (String) resArrs.get(3) + "\" ");
		out.print("}");

		for (int i = 4; i < resArrs.size(); i += 4) {
			out.print(",");
			out.print("{");
			out.print("\"SYMBOL\":\"" + (String) resArrs.get(i) + "\",");
			out.print("\"NAME\":\"" + (String) resArrs.get(i + 1) + "\",");
			out.print("\"AUTHOR\":\"" + (String) resArrs.get(i + 2) + "\",");
			out.print("\"PUBLISHER\":\"" + (String) resArrs.get(i + 3) + "\" ");
			out.print("}");
		}
		out.println("]");
		out.println("}");

	}
%>