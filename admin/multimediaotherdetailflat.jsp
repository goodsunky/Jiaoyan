<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@page import="com.jiaoyan.*,com.jiaoyan.multimedia.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Multimedia_Info mmi=(Multimedia_Info)request.getAttribute("mmidetail");
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
	  			   <td ><div align="left">【<%=mmi.getMm_kjmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>
	  </table>
	 <table   border="1" width="100%" cellspacing="0" cellpadding="0"	bgcolor="#000000">
	  			<tr align="center">
                  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><strong>绩效总分：</strong> </div></td>
	  			  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_jxzf()==0?"":mmi.getMm_jxzf() %>&nbsp;</div></td>
	  			  <td nowrap="nowrap" bgcolor="#FFFFFF">
                      <div align="left"><strong>经费（元）：</strong></div>
	  			   </td>
	  			  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_cost() %>&nbsp;</div></td>
	  			  <td nowrap="nowrap" bgcolor="#FFFFFF">
                      <div align="left"><strong>授奖时间：</strong></div>
	  			    </td>
	  			  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_sjsj() %>&nbsp;</div></td>
	  </tr>			
				<tr align="center">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><strong>立项文号：</strong></div></td>
				  <td width="14%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_lxwh() %>&nbsp;</div></td>
				  <td width="10%" nowrap="nowrap" bgcolor="#FFFFFF">
				    <div align="left"><strong>结题文号：</strong></div>
				  </td>
				  <td width="14%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_jtwh() %>&nbsp;</div></td>
				  <td width="7%" nowrap="nowrap" bgcolor="#FFFFFF">
                    <div align="left"><strong>中期检查情况：</strong></div>
			      </td>
				  <td width="41%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_zjqk() %>&nbsp;</div></td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF">
                  <td bgcolor="#FFFFFF" nowrap="nowrap">
                      <div align="left"><strong>立项评审专家：</strong></div>
                  </td>
				  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><%=mmi.getMm_lxzj() %>&nbsp;</div></td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF">
                      <div align="left"><strong>中检专家：</strong></div>
				   </td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_zjzj() %>&nbsp;</div>
				      <div align="center"  >
                        <div align="left"></div>
			        </div>
				    <div align="left"></div></td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><strong>结题专家：</strong></div></td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=mmi.getMm_jtzj() %>&nbsp;</div></td>
	  			</tr>
				
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>结题情况：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=mmi.getMm_jtqk() %>&nbsp;</div></td>
	  			</tr>	
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>立项时成员：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=mmi.getMm_lxmember() %>&nbsp;</div></td>
	  			</tr>		
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>结题时成员：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=mmi.getMm_jtmember() %>&nbsp;</div></td>
	  			</tr>				
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>备注：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=mmi.getMm_remark() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>