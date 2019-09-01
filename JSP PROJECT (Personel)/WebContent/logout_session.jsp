<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%session.invalidate();
  response.sendRedirect("BookInfo_main.jsp");%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");

</script>