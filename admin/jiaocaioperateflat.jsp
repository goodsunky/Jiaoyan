<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	ArrayList<Jiaocai_Info> jcislist=(ArrayList<Jiaocai_Info>)session.getAttribute("jclist");
	String action=(String)session.getAttribute("action");
	Jiaocai_Info jcsearch=(Jiaocai_Info)session.getAttribute("jcsearch");
	PageBean pb = (PageBean)session.getAttribute("pagebean");
	int pageNo=1,totalcounts=0,totalpages=0,pageSize=0;
	if(pb!=null)
	{
		pageNo= pb.getPageNo();
		totalcounts=pb.getTotalRecords();
		totalpages=pb.getTotalPages();
		pageSize = pb.getPAGE_SIZE();
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教材与论著信息查询与修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<link href="../css/checkbox.css" rel="stylesheet" type="text/css"/>
<link href="../css/resultstyle.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/checkbox_split.js"></script>
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
			window.location.href="../JiaocaiServlet?action=delete&idarray="+msg;
		else
			return false;
	//<a href="../ExpertServlet?action=delete&expid=ei.getExpt_id()" onClick="return confirm('确定要删除吗？'); ">删除</a>
	//alert(msg);
}
function checkdata()
{	
	if((form.startcbsjyear.value!=""&&form.endcbsjyear.value=="")||(form.startcbsjyear.value==""&&form.endcbsjyear.value!="")||(form.startcbsjyear.value>form.endcbsjyear.value))
	{
		alert('请选择正确的时间段！');
		return false;
	}
}
</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2"  panelTitle="教材与论著信息查询与修改">
<form name="form" method="post" action="../JiaocaiServlet?action=search&pageNo=1" onsubmit="return checkdata();">
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
	<td width="7%" align="right" nowrap="nowrap">教材名称：</td>
    <td width="14%" nowrap="nowrap"><input name="jcmc" type="text" size="20" value="<%=jcsearch!=null&&jcsearch.getJc_jcmc()!=null?jcsearch.getJc_jcmc():"" %>"></td>
    <td width="4%" nowrap="nowrap"><div align="right">主编或副主编或参编：</div></td>
    <td width="3%" nowrap="nowrap"><input name="zhubian" type="text" size="20" value="<%=jcsearch!=null&&jcsearch.getJc_zhubian()!=null?jcsearch.getJc_zhubian():"" %>"></td>
    </tr>
    <tr>
    <td width="5%" nowrap="nowrap"><div align="right">所在部门：</div></td>
    <td width="5%" nowrap="nowrap"><select name="dept">
      <option value="">所有</option>
      <%
    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
	{
		Department_Info di = it.next();
		if(!di.getDept_name().equals(""))
		{		
    %>
      <option value="<%=di.getDept_name() %>" <%=jcsearch!=null&&jcsearch.getJc_dept_name()!=null&&jcsearch.getJc_dept_name().equals(di.getDept_name())?"selected":"" %>><%=di.getDept_name() %></option>
      <%}
    }
    %>
    </select></td>
    <td nowrap="nowrap"><div align="right">教材类别*：</div></td>
	    <td nowrap="nowrap">
		<select name="jclb">
          <option value="">所有</option>
          <%
			    for (Iterator<Jiaocaijifen_Info> it = jcjfis.iterator(); it.hasNext();)
				{
					Jiaocaijifen_Info jcjfi = it.next();		
					if(!jcjfi.getJcjf_khzb().equals(""))
					{
			    %>
          <option value="<%=jcjfi.getJcjf_khzb() %>" <%=jcsearch!=null&&jcsearch.getJc_jclb()!=null&&jcsearch.getJc_jclb().equals(jcjfi.getJcjf_khzb())?"selected":"" %>><%=jcjfi.getJcjf_khzb() %></option>
          		<%}
			    }
			    %>
        </select>	

		</td>   
	</tr>
	<tr>
	 <td width="18%" nowrap="nowrap"><div align="right">出版时间：</div></td>
    <td width="24%" nowrap="nowrap">
    <select name="startcbsjyear" id="startcbsjyear" >
    <option value="">所有</option>
          <%
          		int startcbsjyear=0;
          		if(jcsearch!=null&&jcsearch.getStartcbsjyear()!=null&&!jcsearch.getStartcbsjyear().equals(""))
          			startcbsjyear=Integer.parseInt(jcsearch.getStartcbsjyear());
          		int maxstartcbsjyear=Integer.parseInt(birthyear);
		    	for(int y=1990;y<=maxstartcbsjyear;y++)
		    	{
		    %>
          <option value="<%=y %>" <%=startcbsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
	年到<select name="endcbsjyear" id="endcbsjyear">
    <option value="">所有</option>
          <%
          		int endcbsjyear=0;
          		if(jcsearch!=null&&jcsearch.getEndcbsjyear()!=null&&!jcsearch.getEndcbsjyear().equals(""))
          			endcbsjyear=Integer.parseInt(jcsearch.getEndcbsjyear());
          		int maxendcbsjyear=Integer.parseInt(birthyear);
		    	for(int y=1990;y<=maxendcbsjyear;y++)
		    	{
		    %>
          <option value="<%=y %>" <%=endcbsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
	年    </td>
    <td width="6%"><div align="right">档案号：</div></td>
    <td width="18%"><input type="text" name="danganhao" value="<%=jcsearch!=null&&jcsearch.getJc_danganhao()!=null?jcsearch.getJc_danganhao():"" %>"></td>
    <td width="18%" nowrap="nowrap">
      <div align="left">
        <input name="save" type="submit" value="查询" class="button">
        </div></td><td width="1%">&nbsp;</td>
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
	<form name="exportform" method="post" action="../JiaocaiServlet?action=export">
		<input type="button" value="全选" onclick="checkSelAll()"/>
		<input type="button" value="全不选" onclick="checkSelNone()"/>
		<input type="button" value="删除选中" onclick="delSel()"/>
		<input type="submit" value="导出" />
	</form>
	<table border="0" cellpadding="3" cellspacing="0" style="margin:0px auto;"  WIDTH=100%>
				<tbody>
					<tr valign="top">
						<td>
							<span class="nobreak"> 当前第<%=pageNo%>页 <span
								class="jive-paginator"> [<a
									href="../JiaocaiServlet?action=pagesearch&pageNo=<%=pageNo-1 %>">上一页</a> | <%
								for (int i = 1; i <= totalpages; i++) {
							%> <a href="../JiaocaiServlet?action=pagesearch&pageNo=<%=i %>"> 
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
						 %> | <a href="../JiaocaiServlet?action=pagesearch&pageNo=<%=pageNo+1 %>">下一页</a>] </span>
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
													编号												
												</th>
												<th width="2%" class="jive-first" nowrap="nowrap">
													档案号												
												</th>
												<th width="5%" class="jive-first" nowrap="nowrap">
													教材名称											
												</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													主编
												</th>
												<th width="1%" nowrap="nowrap" class="jive-first">
													所在部门										
												</th>												
												<th width="1%" class="jive-first" nowrap="nowrap">
													出版时间												
												</th>	
												<th width="1%" nowrap="nowrap" class="jive-first">
													出版社名
												</th>																						
												<th width="1%" nowrap="nowrap" class="jive-first">
													图书编号												
												</th>	
												<th width="1%" nowrap="nowrap" class="jive-first">
													教材类别												
												</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													更多										
												</th>
												<th width="2%" class="jive-first" nowrap="nowrap">
													操作										
												</th>
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												lineNo=(pageNo-1)*pageSize+1;
												for (Iterator<Jiaocai_Info> it = jcislist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													Jiaocai_Info jci = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">
												<td width="1%" >
													<div class="render" align="center">
														<input type="checkbox"  value="<%=jci.getJc_id() %>"/> 														
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=lineNo %>													</div>											  </td>												
												<td width="2%" >
													<div align="center">
														<%=jci.getJc_danganhao() %>&nbsp;													</div>											  </td>
												<td width="5%">
													<div align="center">
														<%=jci.getJc_jcmc() %>&nbsp;													</div>											  </td>
												<td width="1%" >
													<div align="center">
														<%=CommonUtil.getMembers(jci.getJc_zhubian()) %>&nbsp;													</div>											  </td>
												<td width="1%" >
													<div align="center">
														<%=jci.getJc_dept_name() %>&nbsp;													</div>												</td>
												  <td width="1%" >
													<div align="center">
														<%=jci.getJc_cbsj() %>&nbsp;													</div>												</td>
												<td width="1%" >
													<div align="center">
														<%=jci.getJc_cbsm() %>&nbsp;													</div>												</td>	
												<td width="1%" >
													<div align="center">
														<%=jci.getJc_tsbh() %>&nbsp;		
													</div>												
												</td>
												<td width="1%" >
													<div align="center">
														<%=jci.getJc_jclb() %>&nbsp;		
													</div>												
												</td>
												<td width="1%" >
													<div align="center">
													<a href="../JiaocaiServlet?action=showotherinfo&id=<%=jci.getJc_id() %>" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )">	
													more...
													</a>													
													</div>												
										      </td>	
										      <td width="2%" nowrap="nowrap">
													<div align="center">		
														<a href="../JiaocaiServlet?action=delete&idarray=<%=jci.getJc_id() %>" onclick="return confirm('确定要删除吗？')"><img border="0" alt="删除" src="../icons/delete.gif"/></a>												
														<a href="../JiaocaiServlet?action=alter&id=<%=jci.getJc_id() %>"><img border="0" alt="修改" src="../icons/edit.gif"/></a>
														<a href="../JiaocaiServlet?action=assign&id=<%=jci.getJc_id() %>"><img border="0" alt="积分分配" src="../icons/star.gif"/></a>
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
			<input type="button" value="全选" onclick="checkSelAll()"/>
			<input type="button" value="全不选" onclick="checkSelNone()"/>
			<input type="button" value="删除选中" onclick="delSel()"/>
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
</div>


</body>		
<script>
  document.getElementById("FootBg").style.top=document.body.clientHeight-120;
</script>
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