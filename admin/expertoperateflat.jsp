<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>

<%
	ArrayList<Expert_Info> eislist=(ArrayList<Expert_Info>)session.getAttribute("eislist");
	String action=(String)session.getAttribute("action");
	String name=(String)session.getAttribute("name");
	String sex=(String)session.getAttribute("sex");
	String dept=(String)session.getAttribute("dept");
	String position=(String)session.getAttribute("position");
	String strpageNo=(String)session.getAttribute("pageNo");
	String strtotalcounts=(String)session.getAttribute("totalcounts");
    String strtotalpages=(String)session.getAttribute("totalpages");
    String pageSize=(String)session.getAttribute("pageSize");
    String xueke=(String)session.getAttribute("xueke");
	int pageNo=1;
	if(strpageNo!=null)
		pageNo=Integer.parseInt(strpageNo);	
	int totalcounts=0;
	if(strtotalcounts!=null)
		totalcounts=Integer.parseInt(strtotalcounts);
	int totalpages=0;
	if(strtotalpages!=null)
		totalpages=Integer.parseInt(strtotalpages);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>专家信息录入</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<link href="../css/checkbox.css" rel="stylesheet" type="text/css"/>
<link href="../css/resultstyle.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js"></script>
<script type="text/javascript" src="../js/checkbox_split.js"></script>
<SCRIPT type="text/javascript" src="../js/ESONCalendar.js" charset="gb2312"  ></SCRIPT>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/highslide.css" />
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';
</script>
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
			window.location.href="../ExpertServlet?action=delete&idarray="+msg;
		else
			return false;
	//<a href="../ExpertServlet?action=delete&expid=ei.getExpt_id()" onClick="return confirm('确定要删除吗？'); ">删除</a>
	//alert(msg);
}
</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2"  panelTitle="专家信息查询与修改">
<form name="form" method="post" action="../ExpertServlet?action=search&pageNo=1">
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
	<td width="9%" nowrap="nowrap"  align="right">姓名：</td>
    <td width="6%" ><input name="name" type="text" size="10" value="<%=name==null?"":name %>"></td>
    <td width="6%" nowrap="nowrap"><div align="right">性别：</div></td>
    <td width="7%" nowrap="nowrap"><select name="sex">
    <option value="">所有</option>    
    <option value="男" <%=null!=sex&&sex.equals("男")?"selected":"" %>>男</option>
    <option value="女" <%=null!=sex&&sex.equals("女")?"selected":"" %>>女</option>
    </select>
    </td>
    <td width="9%" nowrap="nowrap"><div align="right">专业技术资格：</div></td>
    <td width="6%" ><select name="position">
        <option value="">所有</option>
        <%
    for (Iterator<Position_Info> it = pis.iterator(); it.hasNext();)
	{
		Position_Info pi = it.next();		
    %>
        <option value="<%=pi.getPos_name() %>" <%=null!=position&&pi.getPos_name().equals(position)?"selected":"" %>><%=pi.getPos_name() %></option>
        <%
    }
    %>
    </select></td>
    <td width="9%" nowrap="nowrap"><div align="right">所在部门：</div></td>
    <td width="7%" ><select name="dept">
        <option value="">所有</option>
    <%
    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
	{
		Department_Info di = it.next();		
		if(!di.getDept_name().equals(""))
		{	
    %>
        <option value="<%=di.getDept_name() %>" <%=null!=dept&&dept.equals(di.getDept_name())?"selected":"" %>><%=di.getDept_name() %></option>
        <%
    }}
    %>
    </select></td>
    <td width="9%" nowrap="nowrap"><div align="right">所属学科：</div></td>
     <td width="13%">
		    <select name="xueke">
			    <option value="">所有</option>
			    <%
			    for (Iterator<Xueke_Info> it = xks.iterator(); it.hasNext();)
				{
					Xueke_Info xki = it.next();		
			    %>
			    <option value="<%=xki.getXueke_name() %>" <%=null!=xueke&&xueke.equals(xki.getXueke_name())?"selected":"" %>><%=xki.getXueke_name() %></option>
			    <%
			    }
			    %>
		    </select>    
		</td>  
    <td width="30%" nowrap="nowrap">
      <div align="left">&nbsp;&nbsp;
        <input name="save" type="submit" value="查询" class="button">
        </div></td><td width="2%">&nbsp;</td>
   </tr>   	
</TABLE>		
</form>
</div>
<br>
<%
	if(action!=null&&action.equals("search")&&totalcounts!=0)
	{
%>
<div>
	<form name="exportform" method="post" action="../ExpertServlet?action=export">
		<input type="button" value="全选" onClick="checkSelAll()"/>
		<input type="button" value="全不选" onClick="checkSelNone()"/>
		<input type="button" value="删除选中" onClick="delSel()"/>
		<input type="submit" value="导出" />
	</form>
	<table border="0" cellpadding="3" cellspacing="0" style="margin:0px auto;"  WIDTH=100% >
				<tbody>
					<tr valign="top">
						<td>
							<span class="nobreak"> 当前第<%=pageNo%>页 <span
								class="jive-paginator"> [<a
									href="../ExpertServlet?action=pagesearch&pageNo=<%=pageNo-1 %>">上一页</a> | <%
								for (int i = 1; i <= totalpages; i++) {
							%> <a href="../ExpertServlet?action=pagesearch&pageNo=<%=i %>"> 
							<%
							if(i==pageNo)
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
						 %> | <a href="../ExpertServlet?action=pagesearch&pageNo=<%=pageNo+1 %>">下一页</a>] </span>
	 						共<%=totalcounts %>条记录/每页最多<%=pageSize %>条记录
							</span>
						</td>
					</tr>
					<!--page end-->
				</tbody>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >				
				<tbody>
					<tr valign="top">
						<td >
							<div id="checkGroup" class="jive-thread-list">
								<div class="jive-table">
									<table summary="List of threads" cellpadding="0" cellspacing="0"  WIDTH=100% >
										<thead>
											<tr>
												<th width="1%" class="jive-first" nowrap="nowrap">
													选择												</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													编号												</th>												
												<th width="3%" class="jive-first" nowrap="nowrap">
													姓名												</th>
												<th width="3%" class="jive-first" nowrap="nowrap">
													性别												</th>
												<th width="4%" class="jive-first" nowrap="nowrap">
													专业技术资格												
												</th>
												<th width="4%" class="jive-first" nowrap="nowrap">
													所属学科												
												</th>
												<th width="4%" class="jive-first" nowrap="nowrap">
													所在部门												
												</th>												
												<th width="11%" class="jive-first" nowrap="nowrap">
													教研方向												
												</th>												
												<th width="3%" nowrap="nowrap" class="jive-first">
													移动电话												</th>
												<th width="3%" nowrap="nowrap" class="jive-first">
													办公电话												</th>													
												<th width="1%" class="jive-first" nowrap="nowrap">
													更多											</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													操作										</th>
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												PageBean pb=new PageBean();
												lineNo=(pageNo-1)*pb.getPAGE_SIZE()+1;
												for (Iterator<Expert_Info> it = eislist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													Expert_Info ei = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">
												<td width="1%" nowrap="nowrap">
													<div class="render" align="center">
														<input type="checkbox"  value="<%=ei.getExpt_id() %>"/> 														
													</div>
												</td>	
												<td width="1%" nowrap="nowrap">
													<div align="center">
														<%=lineNo %>
													</div>
												</td>																							
												<td width="2%" nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_name() %>&nbsp;
													</div>
											  </td>
												<td width="1%" nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_sex() %>&nbsp;
													</div>
												</td>
												<td width="4%" nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_pos_name() %>&nbsp;
													</div>
												</td>
												<td width="4%" nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_xk_name() %>&nbsp;
													</div>
												</td>
												<td nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_dept_name() %>&nbsp;
													</div>
												</td>
												  <td>
													<div align="center">
														<%=ei.getExpt_jyfx() %>&nbsp;
													</div>
												</td>
												<td nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_mphone() %>&nbsp;
													</div>
												</td>	
												<td nowrap="nowrap">
													<div align="center">
														<%=ei.getExpt_ophone() %>&nbsp;
													</div>
												</td>												
												<td width="1%" nowrap="nowrap">
													<div align="center">
													<a href="../ExpertServlet?action=showexpdetail&expid=<%=ei.getExpt_id() %>" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )">	
													more...
													</a>													
													</div>												
										      </td>	
										      <td width="3%" nowrap="nowrap">
													<div align="center">			
														<a href="../ExpertServlet?action=delete&idarray=<%=ei.getExpt_id() %>" onclick="return confirm('确定要删除吗？')"><img border="0" alt="删除" src="../icons/delete.gif"/></a>										
														<a href="../ExpertServlet?action=alter&expid=<%=ei.getExpt_id() %>"><img border="0" alt="修改" src="../icons/edit.gif"/></a>
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
				目前暂无相关记录！
			  </td>
			  </tr>	
			 </table>		
			<%
			}//=availheight
			%> 			
			</div>
</div>


</body>		
<!--代码高亮start-->
<script type="text/javascript" src="../highlight/highlight.js"></script>
<script type="text/javascript" src="../highlight/lang-xml.js"></script>
<script type="text/javascript" src="../highlight/lang-html.js"></script>
<link href="../highlight/mainstyle.css" rel="stylesheet" type="text/css"/>
<script>
	$(function(){
			showCode()
	})
	function showCode(){
		$(".code").each(function(){
			var code =$(this).val()
			var hl = new DlHighlight({lang: "html",lineNumbers :false });
			var formatted = hl.doItNow(code);
			$(this).next().addClass("DlHighlight").html("<pre>" + formatted + "</pre>")
		})
	}
</script>
<!--代码高亮end-->
</html>