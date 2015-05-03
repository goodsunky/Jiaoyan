<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	ArrayList<Keyan_Info> kilist=(ArrayList<Keyan_Info>)session.getAttribute("kislist");
	Keyan_Info kysearch=(Keyan_Info)session.getAttribute("kysearch");
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
<title>科研团队信息查询与修改</title>
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
			window.location.href="../KeyanServlet?action=delete&idarray="+msg;
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
	if((form.startlxsjyear.value!=""&&form.endlxsjyear.value=="")||(form.startlxsjyear.value==""&&form.endlxsjyear.value!="")||(form.startlxsjyear.value>form.endlxsjyear.value))
	{
		alert('请选择正确的时间段！');
		return false;
	}else
		if((form.startjtsjyear.value!=""&&form.endjtsjyear.value=="")||(form.startjtsjyear.value==""&&form.endjtsjyear.value!="")||(form.startjtsjyear.value>form.endjtsjyear.value))
		{
			alert('请选择正确的时间段！');
			return false;
		}else
			if((form.startzjsjyear.value!=""&&form.endzjsjyear.value=="")||(form.startzjsjyear.value==""&&form.endzjsjyear.value!="")||(form.startzjsjyear.value>form.endzjsjyear.value))
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
<div class="box2"  panelTitle="科研团队信息查询与修改">
<form name="form" method="post" action="../KeyanServlet?action=search&pageNo=1" onSubmit="return checkdata()">
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
	<td width="16%" align="right" nowrap="nowrap">团队名称：</td>
    <td width="15%" nowrap="nowrap"><input name="tdmc" type="text" size="20" value="<%=kysearch!=null&&kysearch.getKy_tdmc()!=null?kysearch.getKy_tdmc():"" %>"></td>
    <td width="10%" nowrap="nowrap"><div align="right">负责人或成员：</div></td>
    <td width="59%" nowrap="nowrap"><input name="fuzeren" type="text" size="20" value="<%=kysearch!=null&&kysearch.getKy_fuzeren()!=null?kysearch.getKy_fuzeren():"" %>"></td>
    </tr>
    <tr>
    <td width="16%" nowrap="nowrap"><div align="right">所在部门：</div></td>
    <td width="15%" nowrap="nowrap"><select name="dept">
      <option value="">所有</option>
      <%
    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
	{
		Department_Info di = it.next();
		if(!di.getDept_name().equals(""))
		{		
    %>
      <option value="<%=di.getDept_name() %>" <%=null!=kysearch&&kysearch.getKy_dept_name()!=null&&kysearch.getKy_dept_name().equals(di.getDept_name())?"selected":"" %>><%=di.getDept_name() %></option>
      <%}
    }
    %>
    </select></td>
    <td nowrap="nowrap">
	   		 <div align="right">团队类别：</div>	    </td>
	    <td nowrap="nowrap">
	   <select name="tdlb">
          <option value="">所有</option>
          <%
			    for (Iterator<Kechengjifen_Info> it = kcjfis.iterator(); it.hasNext();)
				{
			    	Kechengjifen_Info kcjfi = it.next();		
					if(!kcjfi.getKcjf_khzb().equals(""))
					{
			    %>
          <option value="<%=kcjfi.getKcjf_khzb() %>" <%=null!=kysearch&&kysearch.getKy_tdlb()!=null&&kysearch.getKy_tdlb().equals(kcjfi.getKcjf_khzb())?"selected":"" %>><%=kcjfi.getKcjf_khzb() %></option>
          		<%
			    }}
			    %>
        </select>	
	    </td>	
	    </tr>
    <tr>
    <td width="16%" nowrap="nowrap"><div align="right">立项时间：</div></td>
    <td width="15%" nowrap="nowrap">
    <select name="startlxsjyear" id="startlxsjyear" >
    <option value="">所有</option>
          <%
          		int startlxsjyear=0;          		
          		if(kysearch!=null&&kysearch.getStartlxsjyear()!=null&&!kysearch.getStartlxsjyear().equals(""))
          				startlxsjyear=Integer.parseInt(kysearch.getStartlxsjyear());
          		int maxstartlxsjyear=Integer.parseInt(birthyear);
		    	for(int y=1990;y<=maxstartlxsjyear;y++)
		    	{
		    %>
          <option value="<%=y %>" <%=startlxsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
	年到<select name="endlxsjyear" id="endlxsjyear">
    <option value="">所有</option>
          <%
          		int endlxsjyear=0;       
          		if(kysearch!=null&&kysearch.getEndlxsjyear()!=null&&!kysearch.getEndlxsjyear().equals(""))
          				endlxsjyear=Integer.parseInt(kysearch.getEndlxsjyear());   		
          		int maxendlxsjyear=Integer.parseInt(birthyear);
		    	for(int y=1990;y<=maxendlxsjyear;y++)
		    	{
		    %>
          <option value="<%=y %>" <%=endlxsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
	年    </td>
		    <td width="10%" nowrap="nowrap"><div align="right">中检时间：</div></td>
		    <td colspan="2" nowrap="nowrap">
		    <div id="zjsjdiv">
		    <select name="startzjsjyear" id="startzjsjyear" >
		         <option value="">所有</option>
		          <%
		         	 int startzjsjyear=0;          			
		         	 if(kysearch!=null&&kysearch.getStartzjsjyear()!=null&&!kysearch.getStartzjsjyear().equals(""))
          				startzjsjyear=Integer.parseInt(kysearch.getStartzjsjyear());   
				    	for(int y=1990;y<2100;y++)
				    	{
				    %>
					  <option value="<%=y %>" <%=startzjsjyear==y?"selected":"" %>><%=y %></option>
		          <%
				    }
				    %>
		    </select>
		年到<select name="endzjsjyear" id="endzjsjyear">
		         <option value="">所有</option>
		          <%
		           int endzjsjyear=0;
		           if(kysearch!=null&&kysearch.getEndzjsjyear()!=null&&!kysearch.getEndzjsjyear().equals(""))
          				endzjsjyear=Integer.parseInt(kysearch.getEndzjsjyear());   
          			for(int y=1990;y<2100;y++)
				    	{
				    %>
					  <option value="<%=y %>" <%=endzjsjyear==y?"selected":"" %>><%=y %></option>
		          <%
				    }
				    %>
		    </select>
		年		</div>		</td>
</tr>
	<tr>
	<td width="18%" nowrap="nowrap"><div align="right">是否结题：</div></td>
    <td width="24%" nowrap="nowrap">
     <input type="radio" name="isjt" id="isjt" value="all" <%=kysearch!=null&&kysearch.getIsjt()!=null&&kysearch.getIsjt().equals("all")?"checked":"" %>  onClick="ablejtsj()">
     	所有				
     <input type="radio" name="isjt" id="isjt" value="yesjt"  <%=kysearch!=null&&kysearch.getIsjt()!=null&&kysearch.getIsjt().equals("yesjt")?"checked":"" %> onClick="ablejtsj()">
     	已结
     <input type="radio" name="isjt" id="isjt" value="nojt"  <%=kysearch!=null&&kysearch.getIsjt()!=null&&kysearch.getIsjt().equals("nojt")?"checked":"" %> onClick="disablejtsj()">
     	未结	</td>
	<td width="6%" nowrap="nowrap"><div id="jtsjtitlediv">
		      <div align="right">结题时间：</div>
		    </div></td>
		    <td colspan="2" nowrap="nowrap">
		    <div id="jtsjdiv">
		    <select name="startjtsjyear" id="startjtsjyear" >
		         <option value="">所有</option>
		          <%
		         	 int startjtsjyear=0;          		
		         	 if(kysearch!=null&&kysearch.getStartjtsjyear()!=null&&!kysearch.getStartjtsjyear().equals(""))
          				startjtsjyear=Integer.parseInt(kysearch.getStartjtsjyear());   	
				    	for(int y=1990;y<2100;y++)
				    	{
				    %>
					  <option value="<%=y %>" <%=startjtsjyear==y?"selected":"" %>><%=y %></option>
		          <%
				    }
				    %>
		    </select>
		年到<select name="endjtsjyear" id="endjtsjyear">
		         <option value="">所有</option>
		          <%
		              int endjtsjyear=0;          		
		               if(kysearch!=null&&kysearch.getEndjtsjyear()!=null&&!kysearch.getEndjtsjyear().equals(""))
          				endjtsjyear=Integer.parseInt(kysearch.getEndjtsjyear());   	
				      for(int y=1990;y<2100;y++)
				    	{
				    %>
					  <option value="<%=y %>" <%=endjtsjyear==y?"selected":"" %>><%=y %></option>
		          <%
				    }
				    %>
		    </select>
		年		</div>		</td>
	</tr>
	<tr>
	<td width="6%"><div align="right">档案号：</div></td>
    <td width="18%"><input type="text" name="danganhao"  value="<%=kysearch!=null&&kysearch.getKy_danganhao()!=null?kysearch.getKy_danganhao():"" %>"></td>
    <td width="16%" nowrap="nowrap">
    </td>
    <td width="15%">
    <input name="save" type="submit" value="查询" class="button">
    </td>
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
	<form name="exportform" method="post" action="../KeyanServlet?action=export">
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
									href="../KeyanServlet?action=pagesearch&pageNo=<%=pageNo-1 %>">上一页</a> | <%
								for (int i = 1; i <= totalpages; i++) {
							%> <a href="../KeyanServlet?action=pagesearch&pageNo=<%=i %>"> 
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
						 %> | <a href="../KeyanServlet?action=pagesearch&pageNo=<%=pageNo+1 %>">下一页</a>] </span>
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
													团队名称											
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													负责人												
													</th>
												<th width="1%" nowrap="nowrap" class="jive-first">
													所在部门										
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													团队类别											
													</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													立项时间												
													</th>	
												<th width="1%" nowrap="nowrap" class="jive-first">
													中检时间												
													</th>																						
												<th width="1%" nowrap="nowrap" class="jive-first">
													结题时间												
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
												for (Iterator<Keyan_Info> it = kilist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													Keyan_Info ki = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">
												<td width="1%" >
													<div class="render" align="center">
														<input type="checkbox"  value="<%=ki.getKy_id() %>"/> 														
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=lineNo %>
													</div>
											  </td>												
												<td width="2%" >
													<div align="center">
														<%=ki.getKy_danganhao() %>&nbsp;
													</div>
											  </td>
												<td width="5%">
													<div align="center">
														<%=ki.getKy_tdmc() %>&nbsp;
													</div>
											  </td>
												<td width="1%" >
													<div align="center">
														<%=ki.getKy_fuzeren() %>&nbsp;
													</div>
											  </td>
												<td width="1%" >
													<div align="center">
														<%=ki.getKy_dept_name() %>&nbsp;
													</div>
												</td>
												  <td width="1%" >
													<div align="center">
														<%=ki.getKy_tdlb() %>&nbsp;
													</div>
												</td>
												<td width="1%" >
													<div align="center">
														<%=ki.getKy_lxsj() %>&nbsp;
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=ki.getKy_zjsj() %>&nbsp;
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=ki.getKy_jtsj() %>&nbsp;
													</div>
												</td>											
												<td width="1%" >
													<div align="center">
													<a href="../KeyanServlet?action=showotherinfo&id=<%=ki.getKy_id() %>" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )">	
													more...
													</a>													
													</div>												
										      </td>	
										      <td width="2%" nowrap="nowrap">
													<div align="center">														
														<a href="../KeyanServlet?action=delete&idarray=<%=ki.getKy_id() %>" onclick="return confirm('确定要删除吗？')"><img border="0" alt="删除" src="../icons/delete.gif"/></a>
														<a href="../KeyanServlet?action=alter&id=<%=ki.getKy_id() %>"><img border="0" alt="修改" src="../icons/edit.gif"/></a>
														<a href="../KeyanServlet?action=assign&id=<%=ki.getKy_id() %>"><img border="0" alt="积分分配" src="../icons/star.gif"/></a>
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