<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>

<%@page import="com.jiaoyan.*,com.jiaoyan.huojiang.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Huojiang_Info hji=(Huojiang_Info)request.getAttribute("hjidetail");
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
	  			   <td ><div align="left">【<%=hji.getHj_jxmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>
</table>
	 <table   border="1" width="100%" cellspacing="0" cellpadding="0"	bgcolor="#000000">
	  			<tr align="center">
                  <td bgcolor="#FFFFFF" nowrap="nowrap"><div align="left"><strong>单项绩效总分：</strong> </div></td>
	  			  <td width="18%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=hji.getHj_jxzf()==0?"":hji.getHj_jxzf() %>&nbsp;</div>
                  <div align="left"></div>   
                  <td width="7%" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><strong>奖项个数：</strong> </div></td>
	  			  <td width="61%" colspan="3" nowrap="nowrap" bgcolor="#FFFFFF"><div align="left"><%=hji.getHj_geshu()==0?"":hji.getHj_geshu() %>&nbsp;</div>
                  <div align="left"></div>                
                 </td>
	   			</tr>		
				<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>成员：</strong></div>			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=hji.getHj_member() %>&nbsp;</div></td>
	  			</tr>					
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td width="14%" bgcolor="#FFFFFF">
			        <div align="left"><strong>备注：</strong></div>			      </td>
				    <td bgcolor="#FFFFFF" colspan="5"><div align="left"><%=hji.getHj_remark() %>&nbsp;</div></td>
	  			</tr>		
  			</table>	 		
</div> 
</body>
</html>