<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@page import="com.jiaoyan.*,com.jiaoyan.keyan.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Keyan_Info ki=(Keyan_Info)request.getAttribute("kidetail");
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
	  			   <td nowrap="nowrap" colspan="6"><div align="left">【<%=ki.getKy_tdmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>			
				<tr align="center">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap">
					<div align="left"><strong>绩效总分：</strong>
					</div>				  
				  </td>
				  <td width="14%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKy_jxzf()==0?"":ki.getKy_jxzf() %>&nbsp;</div></td>
				  </tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>立项时成员：</strong></div>
			     </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKy_lxmember() %>&nbsp;</div></td>
	  			</tr>	
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>中检时成员：</strong></div>
			     </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKy_zjmember() %>&nbsp;</div></td>
	  			</tr>	
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>结题时成员：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKy_jtmember() %>&nbsp;</div></td>
	  			</tr>	
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>备注：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKy_remark() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>