<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@page import="com.jiaoyan.*,com.jiaoyan.jiaogai.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");
	Jiaogai_Info ji=(Jiaogai_Info)request.getAttribute("jidetail");
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
	  			   <td nowrap="nowrap" colspan="6"><div align="left">【<%=ji.getJg_ktmc() %>】的其他信息&nbsp;</div></td>
	  			</tr>			
				<tr align="center">				    
					  <td width="10%" bgcolor="#FFFFFF" nowrap="nowrap">
					    <div align="left">
					    <strong>绩效总分：</strong>
					    </div>
					  </td>
					  <td nowrap="nowrap" bgcolor="#FFFFFF">
					  <div align="left">
					  <%=ji.getJg_jxzf()==0?"":ji.getJg_jxzf() %>&nbsp;
					  </div>
					  </td>
			      </tr>
				  <tr align="center" bgcolor="#FFFFFF">
				      <td  bgcolor="#FFFFFF" nowrap="nowrap">
				        <div align="left">
				        <strong>立项评审专家：</strong>
						</div>
				      </td>
					   <td bgcolor="#FFFFFF" colspan="5">
					      <div align="left">
					      <%=ji.getJg_lxzj() %>&nbsp;
					      </div>
					   </td>	    
				   </tr>
				   <tr align="center" bgcolor="#FFFFFF">
				      <td  bgcolor="#FFFFFF" nowrap="nowrap">
				        <div align="left">
				        <strong>结题评审专家：</strong>
						</div>
				      </td>
					   <td bgcolor="#FFFFFF" colspan="5">
					      <div align="left">
					      <%=ji.getJg_jtzj() %>&nbsp;
					      </div>
					   </td>	    
				   </tr>
				   
				   <tr align="center" bgcolor="#FFFFFF">
				      <td  bgcolor="#FFFFFF" nowrap="nowrap">
				        <div align="left">
				        <strong>经费（元）：</strong>
						</div>
				      </td>
					   <td bgcolor="#FFFFFF" colspan="5">
					      <div align="left">
					      <%=ji.getJg_cost()==0?"":ji.getJg_cost() %>&nbsp;
					      </div>
					   </td>	    
				   </tr>
				  
				<tr align="center" bgcolor="#FFFFFF">				    
				   <td bgcolor="#FFFFFF" nowrap="nowrap">
					    <div align="left">
					    <strong>立项文号：</strong>
					    </div>
				 	</td>
					<td bgcolor="#FFFFFF" nowrap="nowrap">
					  <div align="left">
					  <%=ji.getJg_lxwh() %>&nbsp;
					  </div>
					</td>
			    </tr>
			    <tr>
			    	<td nowrap="nowrap" bgcolor="#FFFFFF">
				    <div align="left">
				    <strong>结题文号：</strong>
				    </div>
					</td>
					<td nowrap="nowrap" bgcolor="#FFFFFF">
					  <div align="left">
					  <%=ji.getJg_jtwh() %>&nbsp;
					  </div>				    
					</td>
			    </tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td  bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left">
			        <strong>立项时成员：</strong>
					</div>
			      </td>
				   <td bgcolor="#FFFFFF" colspan="5">
				      <div align="left">
				      <%=ji.getJg_lxmember() %>&nbsp;
				      </div>
				   </td>	    
				</tr>
				<tr align="center" bgcolor="#FFFFFF">
			      <td  bgcolor="#FFFFFF" nowrap="nowrap">
			        <div align="left">
			        <strong>结题时成员：</strong>
			        </div>
				  </td>
				  <td bgcolor="#FFFFFF" colspan="5">
			     	 <div align="left">
			     	 <%=ji.getJg_jtmember() %>&nbsp;
			     	 </div>
			      </td>
  			    </tr>
	  			<tr align="center" bgcolor="#FFFFFF">
			      <td  bgcolor="#FFFFFF" nowrap="nowrap">
				        <div align="left">
				        <strong>备注：</strong>
				        </div>
					</td>
				    <td bgcolor="#FFFFFF" colspan="5">
				        <div align="left">
				        <%=ji.getJg_remark() %>&nbsp;
				        </div>
			        </td>
	  			</tr>		
  			</table>	 		
</body>
</html>