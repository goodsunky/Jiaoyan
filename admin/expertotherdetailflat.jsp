<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>

<%@page import="com.jiaoyan.*,com.jiaoyan.expert.* ,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Expert_Info ei=(Expert_Info)request.getAttribute("eidetail");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>详细资料</title>		
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body style="margin:0px;">
	<table   border="1" width="100%" cellspacing="0" cellpadding="0"	bgcolor="#000000">	
	  			<tr bgcolor="#FFFFFF">
	  			   <td nowrap="nowrap" colspan="6"><div align="left">【<%=ei.getExpt_name() %>个人详细信息】工号：<%=ei.getExpt_gh() %>&nbsp;</div></td>
	  			</tr>			
				<tr align="center">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"  >
				    <div align="left"><strong>出生年月：</strong></div>
				  </div></td>
				  <td width="13%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ei.getExpt_birthday() %>&nbsp;</div></td>
				  <td width="6%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="center"  >
				    <div align="left"><strong>最高学位：</strong></div>
				  </div></td>
				  <td width="13%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ei.getExpt_xw_name() %>&nbsp;</div></td>
				  <td width="8%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="center"  >
                    <div align="left"><strong>入库时间：</strong></div>
			      </div></td>
				  <td width="53%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ei.getExpt_rksj() %>&nbsp;</div></td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"  >
				    <div align="left"><strong>住宅电话：</strong></div>
				  </div></td>
				  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><%=ei.getExpt_hphone() %>&nbsp;</div></td>
				  <td width="6%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="center"  >
				    <div align="left"><strong>E-Mail：</strong></div>
				  </div></td>
				  <td width="13%" nowrap="nowrap" bgcolor="#FFFFFF" colspan="3"><div align="left"><%=ei.getExpt_mail() %>&nbsp;</div></td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="7%" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"    >
			        <div align="left"><strong>主讲课程：</strong></div>
			      </div></td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ei.getExpt_zjkc() %>&nbsp;</div></td>
	  			</tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="7%" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"    >
			        <div align="left"><strong>入库条件：</strong></div>
			      </div></td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ei.getExpt_rktj() %>&nbsp;</div></td>
	  			</tr>
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="7%" bgcolor="#FFFFFF" nowrap="nowrap"><div align="center"    >
			        <div align="left"><strong>主要教研成绩：</strong></div>
			      </div></td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ei.getExpt_jycj() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>