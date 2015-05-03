<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String path=request.getContextPath();
	ArrayList<User_Info> uislist=(ArrayList<User_Info>)request.getAttribute("uislist");
	PageBean pagebean=(PageBean)request.getAttribute("pagebean");	
	String action=(String)request.getAttribute("action");	
	int[] idarrayrs=(int[])request.getAttribute("idarrayrs");	
	if(idarrayrs!=null)
		System.out.println(idarrayrs.length);
%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息修改</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>	
<link href="<%=path+"/css/btn.css"%> " rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/checkbox.css"%> " rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/resultstyle.css"%>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/checkbox_split.js"%>"></script>


<script type="text/javascript">
function checkSelAll(){
	$("#checkGroup input:checkbox").attr("checked",true);
	checkRefresh("checkGroup")
}
function checkSelNone(){
	$("#checkGroup input:checkbox").attr("checked",false);
	checkRefresh("checkGroup")
}
function delSel()
{
	var msg="";
	$("#checkGroup input[type=checkbox]").each(function(){
		if($(this).attr("checked")){
			msg=msg+$(this).val()+",";
		}
	})

	if(msg=="")
	{	
		alert("请选择！");
		return false;
	}else
		if(confirm('确定要删除选中的吗？'))
		{
			var rootpath='<%=path %>';
			var url=rootpath+"/UserServlet?action=delete&idarray="+msg;
			window.location.href=url;			
		}
		else
			return false;
	//<a href="../UserServlet?action=delete&expid=ei.getExpt_id()" onClick="return confirm('确定要删除吗？'); ">删除</a>
	//alert(msg);
}
</script>
</head>
<body style="margin:0px auto;">  
<%
	if(uislist!=null&&uislist.size()!=0&&(action!=null&&(action.equals("search")||action.equals("pagesearch"))))
	{
%>
<div>
	<form name="exportform" method="post" action="admin/exportuser.jsp?action=export" target="_blank">
		<input type="button" value="全选" onclick="checkSelAll()"/>
		<input type="button" value="全不选" onclick="checkSelNone()"/>
		<input type="button" value="删除选中" onclick="delSel()"/>
		<input type="submit" value="导出" />
	</form>
	<table border="0" cellpadding="3" cellspacing="0" style="margin:0px auto;"  WIDTH=100%>
				<tbody>
					<tr valign="top">
						<td>
							<span class="nobreak"> 当前第<%=pagebean.getPageNo() %>页 <span	class="jive-paginator"> [<a
									href="<%=path+"/UserServlet?action=pagesearch&pageNo="+(pagebean.getPageNo()-1) %>">上一页</a> | <%
								for (int i = 1; i <=pagebean.getTotalPages() ; i++) {
							%> <a href="<%=path+"/UserServlet?action=pagesearch&pageNo="+i %>" > 
							<%
							if(i==pagebean.getPageNo())
							{
							%>
							<font   color="#000000"><u><%=i %></u></font>
							<%
							}else
							{
							%>
							<%=i %>
							<%
							}
							%>
							 </a> 
							<%
						 }
						 %> | <a href="<%=path+"/UserServlet?action=pagesearch&pageNo="+(pagebean.getPageNo()+1) %>">下一页</a>] </span>
	 						共<%=pagebean.getTotalRecords() %>条记录/每页最多<%=pagebean.getPageSize() %>条记录
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% height="100%">				
				<tbody>
					<tr valign="top">
						<td>
							<div id="checkGroup" class="jive-thread-list">
								<div class="jive-table">
									<table summary="List of threads" cellpadding="0" cellspacing="0"  WIDTH=100% >
										<thead>
											<tr>
												<th class="jive-first" >
													选择												
												</th>
												<th class="jive-first" >
													编号												
												</th>	
												<th width="1%" class="jive-first" >
													工号												
												</th>											
												<th width="1%" class="jive-first" >
													姓名												
												</th>
												<th width="1%" class="jive-first" >
													所在部门												
												</th>
												<th width="1%" class="jive-first" >
													用户类型											
												</th>
												<th width="1%" class="jive-first" >
													性别												
												</th>
												<th width="1%" class="jive-first" >
													出生年月												
												</th>
												<th width="1%" class="jive-first" >
													学科												
												</th>
												<th width="1%" class="jive-first" >
													学位										
												</th>
												<th width="1%" class="jive-first" >
													职称											
												</th>		
												<th width="1%"  class="jive-first">
													联系电话												
												</th>
												<th width="1%"  class="jive-first">
													邮箱												
												</th>																						
												<th width="1%" class="jive-first" >
													教研方向												
												</th>																															
												<th width="1%" class="jive-first" >
													主讲课程											
												</th>
												<th width="1%" class="jive-first" >
													操作										
												</th>
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												for (Iterator<User_Info> it = uislist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													User_Info ui = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">
												<td width="1%">
													<div class="render" align="center">
														<input type="checkbox"  value="<%=ui.getUser_id() %>"/> 														
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=lineNo %>
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=ui.getUser_jiaogonghao() %>
													</div>
												</td>																						
												<td width="1%">
													<div align="center">
														<%=ui.getUser_name() %>&nbsp;
													</div>
											  </td>
											  <td>
													<div align="center">
														<%=ui.getUser_dept_name() %>&nbsp;
													</div>
												</td>
												<td>
													<div align="center">
														<%=ui.getUser_type() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_sex() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_birthday() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_xk_name() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_xw_name() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_pos_name() %>&nbsp;
													</div>
												</td>	
												<td>
													<div align="center">
														<%=ui.getUser_phone() %>&nbsp;
													</div>
												</td>	
												<td>
													<div align="center">
														<%=ui.getUser_mail() %>&nbsp;
													</div>
												</td>												
												  <td>
													<div align="center">
														<%=ui.getUser_jyfx() %>&nbsp;
													</div>
												</td>																																			
												<td width="1%">
													<div align="center">
													<%=ui.getUser_zjkc() %>&nbsp;
													</a>													
													</div>												
										      </td>	
										      <td width="1%">
													<div align="center">														
														<a href="<%=path+"/UserServlet?action=alterflat&userid="+ui.getUser_id() %>">修改</a>
													</div>
											  </td>										
											</tr>	
											<%
												lineNo++;
												}
											%>
										</tbody>
								  </table>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>	
			<input type="button" value="全选" onClick="checkSelAll()"/>
			<input type="button" value="全不选" onClick="checkSelNone()"/>
			<input type="button" value="删除选中" onClick="delSel()"/>	
			<%
			}else
			if(action!=null&&action.equals("search"))
			{%>
			<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" >
			 <tr>
			  <td align="center">
				&nbsp;
			  </td>
			  </tr>	
			  <tr>
			  <td align="center">
				目前暂无相关记录！
			  </td>
			  </tr>	
			 </table>		
			<%
			}
			%> 			
</div>
</body>
</html>