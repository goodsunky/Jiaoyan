<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String pageNo=(String)request.getParameter("pageNo");	
	String countperpage=(String)request.getParameter("countperpage");
	String forwardurl="../NoticeServlet?action=afteralter&pageNo="+pageNo+"&countperpage="+countperpage;
 	out.println("<script type='text/javascript'>alert('已保存！');window.location.href='"+forwardurl+"'</script>");
%>