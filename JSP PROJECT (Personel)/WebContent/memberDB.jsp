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

	String mem_id = request.getParameter("M_ID") == null ? "" : request.getParameter("M_ID").trim();

	try {
		resArrs = memberBeans.getMemInfo(mem_id);
		
			
	} catch (SQLException e) {
		out.print(e.toString());
	} finally {
		memberBeans.closeConnection();
	}

	out.println("{");
	out.println("\"memberInfo\":[");

	if (resArrs.size() == 0) {
		out.println("]");
		out.println("}");

	} else {
		out.print("{");
		out.print("\"FIRST_NAME\":\"" + (String) resArrs.get(0) + "\",");
		out.print("\"LAST_NAME\":\"" + (String) resArrs.get(1) + "\",");
		out.print("\"MEMBERID\":\"" + (String) resArrs.get(2) + "\",");
		out.print("\"PASSWORD\":\"" + (String) resArrs.get(3) + "\" ");
		out.print("\"MAIL\":\"" + (String) resArrs.get(4) + "\" ");
		out.print("}");

		for (int i = 5; i < resArrs.size(); i += 5) {
			out.print(",");
			out.print("{");
			out.print("\"FIRST_NAME\":\"" + (String) resArrs.get(i) + "\",");
			out.print("\"LAST_NAME\":\"" + (String) resArrs.get(i + 1) + "\",");
			out.print("\"MEMBERID\":\"" + (String) resArrs.get(i + 2) + "\",");
			out.print("\"PASSWORD\":\"" + (String) resArrs.get(i + 3) + "\" ");
			out.print("\"MAIL\":\"" + (String) resArrs.get(i + 4) + "\" ");
			out.print("}");
		}
		out.println("]");
		out.println("}");

	}
%>