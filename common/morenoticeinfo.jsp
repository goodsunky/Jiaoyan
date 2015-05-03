<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jiaoyan.notice.*,java.util.* " %>
<%@ include file="_SessionCheck.jsp" %>
<%@ include file="getnecessaryinfo.jsp" %>

<%
	ArrayList<Notice_Info> nislist=(ArrayList<Notice_Info>)request.getAttribute("nislist");
	String existids=(String)request.getAttribute("existids");
	String action=(String)request.getAttribute("action");
	PageBean pb=(PageBean)request.getAttribute("pagebean");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教研与科研管理系统</title>
<link rel="stylesheet" href="css/csdn.css" type="text/css">
<script type="text/javascript">
	function checkdata(para)
	{
		var ids='<%=existids %>';
		var pNo=0;
		var cpp=form.countperpage.value;
		if(para=='mid')
			pNo=form.pageNo.value;
		else
			if(para=='up')
				pNo=parseInt(form.pageNo.value)-1;
			else
				if(para='down')
					pNo=parseInt(form.pageNo.value)+1;
		var url="NoticeServlet?action=pageaction&existids="+ids+"&pageNo="+pNo+"&countperpage="+cpp;
		window.location.href=url;
	}
</script>
</head>
<body style="margin:0px auto;">
<div id="container">
<div id="content">
<form name="form" action="#" method="post">
		 <table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;"  WIDTH=100% >
		<tr>
			<td bgcolor=#588FC7 colspan="11" align="left"  height="20">&nbsp;<font color="#FFFFFF"  >更多公告通知信息&nbsp;&nbsp;</font>			</td>
		</tr>		
		<%
		if(action!=null&&(action.equals("moreaction")||action.equals("pageaction"))&&nislist!=null&&nislist.size()!=0)
		{
		%>
			<tr>
			<td colspan="11">&nbsp;</td>
			</tr>			
			<%
			int lineNo=1;			
			lineNo=(pb.getPageNo()-1)*pb.getNotice_Page_Size()+1;
			for (Iterator<Notice_Info> it = nislist.iterator(); it.hasNext();)
			{
				Notice_Info ni = it.next();							
				
			%>
				<tr>	
				<td width="3%" align="left"><nobr>&nbsp;&nbsp;&nbsp;<%=lineNo %>.【<%=ni.getNot_type() %>】&nbsp;</td>
				<td width="2%"><p align="left"><nobr><a href="#"><img border="0" src="images/laba.gif"></a></td>
				<td colspan="3" align="left"><nobr><a href="NoticeServlet?action=show&notid=<%=ni.getNot_id() %>"  target="_blank"><%=ni.getNot_title() %></a>&nbsp;
				<%
				int todaygg=Integer.parseInt(todaydate);
				int issuegg=Integer.parseInt(sdfdate.format(sdf.parse(ni.getNot_issuedate())));
				if(Math.abs(todaygg-issuegg)<=1)
				{						
				%>
				<img border="0" src="images/new.gif">
				<%
				}
				%>				</td>
				<td width="23%"><nobr><font color="#939393"><%=ni.getNot_issuedate() %></font></td>
				<td width="8%">&nbsp;</td>
				<td width="4%">&nbsp;</td>
				<td width="2%" >&nbsp;</td>
				<td colspan="2"><nobr><font color="#939393">阅读:<%=ni.getNot_hits() %></font></td>
				</tr>				
				<%
				lineNo++;
				}%>
			<tr>
					<td colspan="5" align="left" nowrap="nowrap">
						当前第<%=pb.getPageNo() %>页						
					    [
						<a href="<%="NoticeServlet?action=pageaction&pageNo="+(pb.getPageNo()-1)+"&existids="+existids+"&countperpage="+pb.getNotice_Page_Size() %>">上一页</a> 
						|
						<select name="pageNo" onchange="javascript:checkdata('mid');" >
 						<%
 						for(int i=1;i<=pb.getTotalPages();i++)
 						{
 						%>
 						<option value="<%=i %>" <%=pb!=null&&pb.getPageNo()==i?"selected":"" %>><%=i %></option>
 						<%
 						}
 						%>
 						</select> 						
					    |
					    <a href="<%="NoticeServlet?action=pageaction&pageNo="+(pb.getPageNo()+1)+"&existids="+existids+"&countperpage="+pb.getNotice_Page_Size() %>">下一页</a>] 
 					共<%=pb.getTotalRecords() %>条记录/每页显示
 					<select name="countperpage" onchange="javascript:checkdata('mid');">
 					<%
 					for(int i=10;i<=10*10;i+=10)
 					{
 					%>
 					<option value="<%=i %>" <%=pb!=null&&pb.getNotice_Page_Size()==i?"selected":"" %>><%=i %></option>
 					<%
 					}
 					%>
 					</select>
 					记录					
 					</td>				
					<td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td width="13%" >&nbsp;</td>
				    <td width="13%" >&nbsp;</td>
			</tr>
			<%
			}else
				if(action!=null&&action.equals("moreaction")&&nislist!=null&&nislist.size()==0)
				{
				%>
				<tr>
				<td colspan="11" >&nbsp;</td>
				</tr>	
				<tr>			
				<td align="center" colspan="11">目前暂无相关记录！&nbsp;</td>
				</tr>	
				<%
				}
				%>	
	  </table>		
</form>
</div>
</div>
</body>
</html>
