<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@page import="com.jiaoyan.*,com.jiaoyan.jiaocai.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Jiaocai_Info jci=(Jiaocai_Info)request.getAttribute("jcidetail");
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
	  			   <td ><div align="left">【<%=jci.getJc_jcmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>
</table>
	 <table   border="1" width="100%" cellspacing="0" cellpadding="0"	bgcolor="#000000">
	  			<tr align="center">
                  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><strong>绩效总分：</strong> </div></td>
	  			  <td colspan="5" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=jci.getJc_jxzf()==0?"":jci.getJc_jxzf() %>&nbsp;</div>
                  <div align="left"></div>                  </td>
	   </tr>			
				

				
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>副主编：</strong></div>			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=CommonUtil.getMembers(jci.getJc_fuzhubian()) %>&nbsp;</div></td>
	  			</tr>	
			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>参编人员：</strong></div>			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=CommonUtil.getMembers(jci.getJc_member()) %>&nbsp;</div></td>
	  			</tr>	
				
				
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>备注：</strong></div>			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=jci.getJc_remark() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>