<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jiaoyan.notice.*,java.util.* " %>
<%@ include file="_SessionCheck.jsp" %>
<%@ include file="getnecessaryinfo.jsp" %>

<%
	ArrayList<Notice_Info> nigglist=(ArrayList<Notice_Info>)request.getAttribute("nigglist");	
	ArrayList<Notice_Info> nitzlist=(ArrayList<Notice_Info>)request.getAttribute("nitzlist");
	String existids=(String)request.getAttribute("existids");
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教研管理系统</title>
<link href="css/csdn.css" rel="stylesheet"  type="text/css">
</head>
<body style="margin:0px auto;">
<div id="container">
<div id="content" style="padding-bottom: 20px;">
		<table  border="0" width=100% cellspacing="0">
		<tr>
			<td bgcolor=#588FC7 colspan="11" align="left"  height="20">&nbsp;<font color="#FFFFFF"  >最新信息&nbsp;&nbsp;</font>			</td>
		</tr>		
		<tr>
		<td colspan="11">&nbsp;</td>
		</tr>	
		<tr>
		<td width="0%">&nbsp;</td>
		<td width="10%" align="left"><span class="style1"><b><font color="red"><nobr>【重要公告】</font></span></td>
		<td width="27%">&nbsp;</td>	
		<td width="1%">&nbsp;</td>
		<td width="6%">&nbsp;</td>
		<td width="23%">&nbsp;</td>
		<td width="1%">&nbsp;</td>
		<td width="1%">&nbsp;</td>
		<td width="1%">&nbsp;</td>
		<td width="23%">&nbsp;</td>
		<td width="7%">&nbsp;</td>
		</tr>
		<%
		int zyggNo=1;
		for (Iterator<Notice_Info> it = nigglist.iterator(); it.hasNext();)
		{
			Notice_Info ni = it.next();													
			if(ni.getNot_type()!=null&&ni.getNot_type().equals("重要公告")&&zyggNo<=2)
			{
			  zyggNo++;
			%>
			<tr>	
			<td>&nbsp;</td>
			<td><p align="right"><nobr><a href="#"><img border="0" src="images/dot.jpg"></a></td>
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
			%>
			</td>
			<td><nobr><font color="#939393"><%=ni.getNot_issuedate() %></font></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td >&nbsp;</td>
			<td><nobr><font color="#939393">阅读:<%=ni.getNot_hits() %></font></td>
			<td>&nbsp;</td>	
			</tr>					
			<%
			}
		}
		%>	

		
		<tr>
		<td>&nbsp;</td>
		<td align="left" ><span class="style1"><b ><font color="red"><nobr>【重要通知】</font></span></td>
		<td>&nbsp;</td>	
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		</tr>			
		<%
		int zytzNo=1;
		for (Iterator<Notice_Info> it = nitzlist.iterator(); it.hasNext();)
		{
			Notice_Info ni = it.next();													
			if(ni.getNot_type()!=null&&ni.getNot_type().equals("重要通知")&&zytzNo<=5)
			{
			  zytzNo++;
			%>
			<tr>	
			<td>&nbsp;</td>
			<td><p align="right"><nobr><a href="#"><img border="0" src="images/dot.jpg"></a></td>
			<td colspan="3"><nobr><a href="NoticeServlet?action=show&notid=<%=ni.getNot_id() %>"  target="_blank"><%=ni.getNot_title() %></a>&nbsp;
			<%
			int todaytz=Integer.parseInt(todaydate);
			int issuetz=Integer.parseInt(sdfdate.format(sdf.parse(ni.getNot_issuedate())));
			if(Math.abs(todaytz-issuetz)<=1)
			{
			%>
			<img border="0" src="images/new.gif">
			<%
			}
			%>
			</td>
			<td><nobr><font color="#939393"><%=ni.getNot_issuedate() %></font></td>
			<td>&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td><nobr><font color="#939393">阅读:<%=ni.getNot_hits() %></font></td>	
			<td>&nbsp;</td>	
			</tr>	
				<%
			}
			}
		%>
		<tr>	
		<td>&nbsp;</td>
		<td>&nbsp;</td>			
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><nobr><a href="NoticeServlet?action=moreaction&pageNo=1&existids=<%=existids %>">More...</a></td>
		<td>&nbsp;</td>		
		</tr>										
	  </table>			
</div>
</div>
</body>
</html>
