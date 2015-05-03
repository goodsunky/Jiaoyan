<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@page import="com.jiaoyan.*,com.jiaoyan.kecheng.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Kecheng_Info ki=(Kecheng_Info)request.getAttribute("kidetail");
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
	  			   <td nowrap="nowrap" colspan="6"><div align="left">【<%=ki.getKch_kcmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>			
				<tr align="center">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap">
					<div align="left"><strong>绩效总分：</strong>
					</div>				  
				  </td>
				  <td width="14%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_jxzf() %>&nbsp;</div></td>
				  <td width="10%" nowrap="nowrap" bgcolor="#FFFFFF">
				    <div align="left"><strong>立项文号：</strong></div>
				 </td>
				  <td width="14%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_lxwh() %>&nbsp;</div></td>
				  <td width="7%" nowrap="nowrap" bgcolor="#FFFFFF">
                    <div align="left"><strong>结题文号：</strong></div>
			      </td>
				  <td width="41%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_jtwh() %>&nbsp;</div></td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF">
                  <td bgcolor="#FFFFFF" nowrap="nowrap">
                      <div align="left"><strong>立项评审专家：</strong></div>
                  </td>
				  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><%=ki.getKch_lxzj() %>&nbsp;</div></td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF">
                      <div align="left"><strong>中检专家：</strong></div>
				   </td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_zjzj() %>&nbsp;</div>
				  </td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><strong>结题专家：</strong></div></td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_jtzj() %>&nbsp;</div></td>
	  			</tr>
				<tr align="center" bgcolor="#FFFFFF">				    
				  <td bgcolor="#FFFFFF" nowrap="nowrap">
				    <div align="left"><strong>中期检查情况：</strong></div>
				  </td>
				  <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_zjqk() %>&nbsp;</div></td>
			      <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><strong>结题情况：</strong></div></td>
			      <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_jtqk() %>&nbsp;</div></td>
			      <td nowrap="nowrap" bgcolor="#FFFFFF"><strong>授奖时间：</strong></td>
			      <td nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_sjsj() %>&nbsp;</div></td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF">
                  <td bgcolor="#FFFFFF" nowrap="nowrap">
                      <div align="left"><strong>中检意见：</strong></div>
                 </td>
				  <td colspan="5" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_zjyj() %>&nbsp;</div>				    </td>
	  </tr>
				<tr align="center" bgcolor="#FFFFFF">
                  <td bgcolor="#FFFFFF" nowrap="nowrap">
                      <div align="left"><strong>结题意见：</strong></div>                  </td>
				  <td colspan="5" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=ki.getKch_jtyj() %>&nbsp;</div>                  </td>
	  </tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>立项时成员：</strong></div>
			     </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKch_lxmember() %>&nbsp;</div></td>
	  			</tr>	
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>中检时成员：</strong></div>
			     </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKch_zjmember() %>&nbsp;</div></td>
	  			</tr>	
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>结题时成员：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKch_jtmember() %>&nbsp;</div></td>
	  			</tr>	
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left"><strong>备注：</strong></div>
			      </td>
				    <td bgcolor="#FFFFFF" colspan="5">
			      <div align="left"><%=ki.getKch_remark() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>