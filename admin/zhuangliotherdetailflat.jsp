<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@page import="com.jiaoyan.*,com.jiaoyan.zhuangli.* ,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Zhuangli_Info zi=(Zhuangli_Info)request.getAttribute("zidetail");
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
	  			   <td nowrap="nowrap" colspan="6"><div align="left">【<%=zi.getZhl_fmmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>			
				<tr align="center">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap">
					<div align="left"><strong>绩效总分：</strong>
					</div>				  
				  </td>
				  <td width="14%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=zi.getZhl_jxzf() %>&nbsp;</div></td>
				  </tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>成员：</strong></div>
			     </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=zi.getZhl_member() %>&nbsp;</div></td>
	  			</tr>	
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>备注：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=zi.getZhl_remark() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>