<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	ArrayList<Yishu_Info> yshlist=(ArrayList<Yishu_Info>)session.getAttribute("yshlist");
	Yishu_Info yshsearch=(Yishu_Info)session.getAttribute("yshsearch");
	String action=(String)session.getAttribute("action");
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
<title>艺术作品获奖和收藏情况信息查询与修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<link href="../css/resultstyle.css" rel="stylesheet" type="text/css"/>
<link href="../css/checkbox.css" rel="stylesheet" type="text/css"/>
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
			window.location.href="../YishuServlet?action=delete&idarray="+msg;
		else
			return false;
	//<a href="../ExpertServlet?action=delete&expid=ei.getExpt_id()" onClick="return confirm('确定要删除吗？'); ">删除</a>
	//alert(msg);
}
function disablejtsj()
{
	document.getElementById("jtsjtitlediv").style.display="none";
	document.getElementById("jtsjdiv").style.display="none";
}
function ablejtsj()
{
	document.getElementById("jtsjtitlediv").style.display="block";
	document.getElementById("jtsjdiv").style.display="block";
}

function onload()
{
	var radios=document.getElementsByName("isjt");   
	if(radios[2].checked==true)
		disablejtsj();
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
<body style="margin:0px auto;" onLoad="onload();"> 
<div id="container">
<div id="content">
<div class="box2"  panelTitle="艺术作品获奖和收藏情况信息查询与修改">
<form name="form" method="post" action="../YishuServlet?action=search&pageNo=1" onSubmit="return checkdata()">
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
	<td width="30%" align="right" nowrap="nowrap">作品名称：</td>
    <td width="14%" nowrap="nowrap"><input name="zpmc" type="text" size="20" value="<%=yshsearch!=null&&yshsearch.getYsh_zpmc()!=null?yshsearch.getYsh_zpmc():"" %>"></td>
    <td width="12%" nowrap="nowrap"><div align="right">第一作者或成员：</div></td>
    <td width="15%" nowrap="nowrap"><input name="dyzz" type="text" size="20" value="<%=yshsearch!=null&&yshsearch.getYsh_dyzz()!=null?yshsearch.getYsh_dyzz():"" %>"></td>
    </tr>
    <tr>
    <td width="30%" nowrap="nowrap"><div align="right">所在部门：</div></td>
    <td width="14%" nowrap="nowrap"><select name="dept">
      <option value="">所有</option>
      <%
    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
	{
		Department_Info di = it.next();
		if(!di.getDept_name().equals(""))
		{		
    %>
      <option value="<%=di.getDept_name() %>" <%=null!=yshsearch&&yshsearch.getYsh_dept_name()!=null&&yshsearch.getYsh_dept_name().equals(di.getDept_name())?"selected":"" %>><%=di.getDept_name() %></option>
      <%}
    }
    %>
    </select></td>
    <td width="12%" nowrap="nowrap"><div align="right">获奖时间：</div></td>
    <td width="15%" nowrap="nowrap">
    <select name="starthjsjyear" id="starthjsjyear" >
    <option value="">所有</option>
          <%
          		int starthjsjyear=0;          		
          		if(yshsearch!=null&&yshsearch.getStarthjsjyear()!=null&&!yshsearch.getStarthjsjyear().equals(""))
          				starthjsjyear=Integer.parseInt(yshsearch.getStarthjsjyear());
          		int maxstarthjsjyear=Integer.parseInt(birthyear);
		    	for(int y=1990;y<=maxstarthjsjyear;y++)
		    	{
		    %>
          <option value="<%=y %>" <%=starthjsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
	年到<select name="endhjsjyear" id="endhjsjyear">
    <option value="">所有</option>
          <%
          		int endhjsjyear=0;       
          		if(yshsearch!=null&&yshsearch.getEndhjsjyear()!=null&&!yshsearch.getEndhjsjyear().equals(""))
          				endhjsjyear=Integer.parseInt(yshsearch.getEndhjsjyear());   		
          		int maxendhjsjyear=Integer.parseInt(birthyear);
		    	for(int y=1990;y<=maxendhjsjyear;y++)
		    	{
		    %>
          <option value="<%=y %>" <%=endhjsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
	年    </td>   	
	    </tr>
    <tr>
</tr>
	<tr>
	<td width="30%"><div align="right">档案号：</div></td>
    <td width="14%"><input type="text" name="danganhao"  value="<%=yshsearch!=null&&yshsearch.getYsh_danganhao()!=null?yshsearch.getYsh_danganhao():"" %>"></td>
    <td width="12%"><div align="right">作者署名单位：</div></td>
    <td width="15%"><input type="text" name="smdw"  value="<%=yshsearch!=null&&yshsearch.getYsh_smdw()!=null?yshsearch.getYsh_smdw():"" %>"></td>
    <td align="left"><input name="save" type="submit" value="查询" class="button"></td>
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
	<form name="exportform" method="post" action="../YishuServlet?action=export">
		<input type="button" value="全选" onClick="checkSelAll()"/>
		<input type="button" value="全不选" onClick="checkSelNone()"/>
		<input type="button" value="删除选中" onClick="delSel()"/>
		<input type="submit" value="导出" />
	</form>
	<table border="0" cellpadding="3" cellspacing="0" style="margin:0px auto;"  WIDTH=100%>
				<tbody>
					<tr valign="top">
						<td>
							<span class="nobreak"> 当前第<%=pageNo%>页 <span
								class="jive-paginator"> [<a
									href="../YishuServlet?action=pagesearch&pageNo=<%=pageNo-1 %>">上一页</a> | <%
								for (int i = 1; i <= totalpages; i++) {
							%> <a href="../YishuServlet?action=pagesearch&pageNo=<%=i %>"> 
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
						 %> | <a href="../YishuServlet?action=pagesearch&pageNo=<%=pageNo+1 %>">下一页</a>] </span>
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
						<td>
							<div id="checkGroup" class="jive-thread-list">
								<div class="jive-table">
									<table summary="List of threads" cellpadding="0" cellspacing="0"  WIDTH=100% >
										<thead>
											<tr>
												<th width="1%" class="jive-first" nowrap="nowrap">
													选择												
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													编号												
													</th>
												<th width="2%" class="jive-first" nowrap="nowrap">
													档案号												
													</th>
												<th width="5%" class="jive-first" nowrap="nowrap">
													作品名称											
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													第一作者												
													</th>
												<th width="1%" nowrap="nowrap" class="jive-first">
													所在部门										
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													作者署名单位											
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													承担单位排名											
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													获奖时间
													</th>	
												<th width="1%" nowrap="nowrap" class="jive-first">
													获奖名称											
													</th>																						
												<th width="1%" nowrap="nowrap" class="jive-first">
													获奖等级												
													</th>	
												<th width="1%" nowrap="nowrap" class="jive-first">
													评比主办单位									
													</th>											
												<th width="1%" class="jive-first" nowrap="nowrap">
													更多										</th>
												<th width="2%" class="jive-first" nowrap="nowrap">
													操作										</th>
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												lineNo=(pageNo-1)*pageSize+1;
												for (Iterator<Yishu_Info> it = yshlist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													Yishu_Info yshi = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">
												<td width="1%" >
													<div class="render" align="center">
														<input type="checkbox"  value="<%=yshi.getYsh_id() %>"/> 														
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=lineNo %>
													</div>
											  </td>												
												<td width="2%" >
													<div align="center">
														<%=yshi.getYsh_danganhao() %>&nbsp;
													</div>
											  </td>
												<td width="5%">
													<div align="center">
														<%=yshi.getYsh_zpmc() %>&nbsp;
													</div>
											  </td>
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_dyzz() %>&nbsp;
													</div>
											  </td>
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_dept_name() %>&nbsp;
													</div>
												</td>
												  <td width="1%" >
													<div align="center">
														<%=yshi.getYsh_smdw() %>&nbsp;
													</div>
												</td>
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_dwpm() %>&nbsp;
													</div>
												</td>
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_hjsj() %>&nbsp;
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_hjmc() %>&nbsp;
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_hjdj() %>&nbsp;
													</div>
												</td>
												<td width="1%" >
													<div align="center">
														<%=yshi.getYsh_zbdw() %>&nbsp;
													</div>
												</td>												
												<td width="1%" >
													<div align="center">
													<a href="../YishuServlet?action=showotherinfo&id=<%=yshi.getYsh_id() %>" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )">	
													more...
													</a>													
													</div>												
										      </td>	
										      <td width="2%" nowrap="nowrap">
													<div align="center">														
														<a href="../YishuServlet?action=delete&idarray=<%=yshi.getYsh_id() %>" onclick="return confirm('确定要删除吗？')"><img border="0" alt="删除" src="../icons/delete.gif"/></a>
														<a href="../YishuServlet?action=alter&id=<%=yshi.getYsh_id() %>"><img border="0" alt="修改" src="../icons/edit.gif"/></a>
														<a href="../YishuServlet?action=assign&id=<%=yshi.getYsh_id() %>"><img border="0" alt="积分分配" src="../icons/star.gif"/></a>
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