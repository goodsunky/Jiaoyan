<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String path=request.getContextPath();	
	ArrayList<Jifenhuizong_Info> jfhzis=(ArrayList<Jifenhuizong_Info>)request.getAttribute("jifenhuizongresult");
	ArrayList<Jiaoyan_Info> jyis=(ArrayList<Jiaoyan_Info>)request.getAttribute("jyis");
	Search_Info searchcon = (Search_Info)request.getAttribute("searchcon");
	String action=(String)request.getAttribute("action");
	String jyxm=(String)request.getAttribute("jyxm");
	String jylx=(String)request.getAttribute("jylx");
	String starttime=(String)request.getAttribute("starttime");
	String endtime=(String)request.getAttribute("endtime");	
	String dept=(String)request.getAttribute("dept");
	String title = searchcon!=null?searchcon.getTitle():"";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教研绩效分汇总</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>	
<link href="<%=path+"/css/btn.css" %>" rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/resultstyle.css" %>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js" %>"></script>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.PrintArea.js" %>"></script>
<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js" %>"></script>
<link rel="stylesheet" type="text/css" href="<%=path+"/css/highslide.css" %>" />


<script language=javascript>   
	$(document).ready(function(){
	  $("input#printButton").click(function(){
	  $("div#printArea").printArea();
	});
	});
	function checkdata()
	{
		if(form.starttime.value==""||form.endtime.value=="")
		{
		  alert("请选择时间！");
		  return false;
		}else
			if(form.starttime.value>form.endtime.value)
			{
				alert("请选择正确的时间段！");
		  		return false;
			}
	}
	function changexm()
	{
		var url="<%=path+"/JifenhuizongServlet?action=filter&jylx=" %>"+form.jylx.value+"&url="+form.url.value+"&dept="+form.dept.value+"&starttime="+form.starttime.value+"&jyxm="+form.jyxm.value+"&endtime="+form.endtime.value;
		window.location.href=url;
	}
</script>

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
			<div class="box2" panelTitle="绩效分汇总" >
			<form name="form" method="post" action="<%=path+"/JifenhuizongServlet?action=huizong&tongjitype=teacher" %>" onSubmit="return checkdata()">
			<input type="hidden" name="url" value="teacher/huizongflat.jsp" />
			<input type="hidden" name="dept" value="" />
			<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
				<tr>
				<td width="20%" nowrap="nowrap">
			    <div align="right">类型：</div></td>
			    <td width="9%" nowrap="nowrap">
			    	<select name="jylx" onchange="changexm();">
				        <option value="">所有</option>
				    	<%
				    	for (Iterator<Jiaoyan_Info> it = jytypeis.iterator(); it.hasNext();)
						{
							Jiaoyan_Info jyi = it.next();		
							if(!"".equals(jyi.getJy_type()))
							{	
					    %>
					        <option value="<%=jyi.getJy_type() %>" <%=null!=jyi.getJy_type()&&jyi.getJy_type().equals(jylx)?"selected":"" %>><%=jyi.getJy_type() %></option>
					    <%
					    	}
					    }
					    %>
				    </select>
				 </td>		   
			    <td width="5%" nowrap="nowrap">
			    <div align="right">项目：</div></td>
			    <td width="9%" nowrap="nowrap">
			    	<select name="jyxm">
				        <option value="">所有</option>
				    	<%
				    	if(jyis!=null)
				    	{
				    	for (Iterator<Jiaoyan_Info> it = jyis.iterator(); it.hasNext();)
						{
							Jiaoyan_Info jyi = it.next();		
							if(!"".equals(jyi.getJy_name()))
							{	
					    %>
					        <option value="<%=jyi.getJy_shortname() %>" <%=null!=jyi.getJy_shortname()&&jyi.getJy_shortname().equals(jyxm)?"selected":"" %>><%=jyi.getJy_name() %></option>
					    <%
					        }
					    }
					    }
					    %>
				    </select>
				 </td>
				 <td width="8%" nowrap="nowrap"><div align="right">开始时间*</div></td>
				 <td width="9%" nowrap="nowrap">
				 <select name="starttime">
					<option value="">请选择</option>
			            <%
					    	for(int y=1990;y<2100;y++)
					    	{
					    %>
			            <option value="<%=y %>" <%=null!=starttime&&!"".equals(starttime)&&Integer.parseInt(starttime)==y?"selected":"" %>><%=y %></option>
			            <%
					    }
					    %>
			          </select>
					  年
				 </td>	
				 <td width="8%" nowrap="nowrap"><div align="right">结束时间*</div></td>
				 <td width="9%" nowrap="nowrap">
				 <select name="endtime">
					<option value="">请选择</option>
			            <%
					    	for(int y=1990;y<2100;y++)
					    	{
					    %>
			            <option value="<%=y %>" <%=null!=endtime&&!"".equals(endtime)&&Integer.parseInt(endtime)==y?"selected":"" %>><%=y %></option>
			            <%
					    }
					    %>
			          </select>
					  年
				 </td>			 		    
			    <td width="22%" nowrap="nowrap"><div align="center">
			      <input name="huizong" type="submit" value="汇总" class="button" >
			    </div>
			      <div align="left"></div></td>
			    <td width="2%">&nbsp;</td>
			   </tr>   	
			</TABLE>		
			</form>
			</div>				
			<%
				if(jfhzis!=null&&jfhzis.size()!=0)
				{
			 %>			
			 <form name="exportform" method="post" action="<%=path+"/JifenhuizongServlet?action=export&exptype=teacher" %>">
			 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
			 	<tr>
			 	<td>&nbsp;</td>
			 	</tr>
			 	<tr>				   
			    <td width="5%" nowrap="nowrap">					
			    	<input type="hidden" name="jyxm" value="<%=jyxm %>" />
			    	<input type="hidden" name="starttime" value="<%=starttime %>" />
			    	<input type="hidden" name="endtime" value="<%=endtime %>" />
			    	<input type="hidden" name="dept" value="<%=dept %>" />
			    	<input type="hidden" name="jylx" value="<%=jylx %>" />
			    	<input type="hidden" name="title" value="<%=title %>" />
					<input type="submit" value="导出" class="button" />
					<input type="button" value="打印" class="button" id="printButton"/>
				</td>
				<td align="center" style="font-weight: bold;font-size: 15px;">
					<div id="title"><%=title %></div>
				</td>
				<td width="5%" nowrap="nowrap">
				&nbsp;		
				</td>
				</tr>	
				</TABLE>	
				</form>	 
				<div id="printArea">
			<table class="jive-table" id="printtable" cellspacing="0" cellpadding="0"	bgcolor="#FFFFFF" border="1" align="center">
					<thead>
											<tr>																															
												<th  width="1%" rowspan="2" nowrap="nowrap" class="jive-first">
													编号											
												</th>
												<th  width="1%" rowspan="2" nowrap="nowrap" class="jive-first">
													时间										
												</th>
												<th  width="1%" rowspan="2" nowrap="nowrap" class="jive-first">
													姓名												
												</th>
												<th  width="1%" rowspan="2" nowrap="nowrap" class="jive-first">
													所在部门												
												</th>
												<th width="1%" rowspan="2" class="jive-first" >
													本人<%=searchcon!=null&&"".equals(searchcon.getJylx())?"教研与科研":searchcon.getJylx() %>工作绩效积分												
												</th>
												<th width="1%" rowspan="2" class="jive-first" >
													突出业绩量化积分	
												</th>
												<%
												int maxcount=jfhzis!=null&&jfhzis.size()!=0?jfhzis.get(0).getMaxcount():0;
												ArrayList<Number_Info> numbers=DB.getNumberDetailInfo("select id,num,name from number_info");												
												for(int i=0;i<maxcount;i++)
												{
												%>										
												<th  width="1%" colspan="3" class="jive-first" >
													<%="项目"+numbers.get(i).getName() %>												
												</th>		
												<%
												}
												 %>												 																																			
											</tr>
											<tr>
											<%							
												for(int j=0;j<maxcount;j++)
												{
												%>	
											  <th width="1%" class="jive-first" >负责人</th>
										      <th width="1%" class="jive-first" >本人积分</th>
										      <th width="1%" class="jive-first" >突出绩效分</th>
										     <%
										     }
										      %>
										  </tr>										 
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												for (Iterator<Jifenhuizong_Info> it = jfhzis.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													Jifenhuizong_Info ji = it.next();
													ArrayList<Canyuxiangmu_Info> cyxmis=new ArrayList<Canyuxiangmu_Info>();			
													cyxmis=ji.getCyxmi();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>									
																														
											<tr class="<%=classStr%>">		
												<td width="1%" align="center"><%=lineNo %>&nbsp;</td>
												<td width="1%" align="center"><%=ji.getStarttime() %>&nbsp;</td>
												<td width="1%" align="center" style="<%=ji.getWarn()==1?"color: red;font-weight: bold;":"" %>"><%=ji.getBenrenname() %>&nbsp;</td>
												<td width="1%" align="center"><%=ji.getDept() %>&nbsp;</td>
												<td width="1%" align="center"><%=ji.getBenrenzongjifen() %>&nbsp;</td>	
												<td width="1%" align="center"><%=ji.getBenrentuchuzongjifen() %>&nbsp;</td>									                                       
											  <%												 
											  int remaincount=maxcount-cyxmis.size();									  
											  for (Iterator<Canyuxiangmu_Info> cit = cyxmis.iterator(); cit.hasNext();)
											  {
											  	Canyuxiangmu_Info ci = cit.next();											  	
											  %>											 
												<td width="1%" align="center"><%=ci.getFuzeren() %>&nbsp;</td>	
												<td width="1%" align="center"><%=ci.getBenrenjifen() %>&nbsp;</td>	
												<td width="1%" align="center"><%=ci.getTuchu() %>&nbsp;</td>	
											  <%
											  }
											  %>		
											  <%
											   	for(int j=0;j<remaincount;j++)
											   	{
											  %>
											  <td width="1%" align="center">&nbsp;</td>
											  <td width="1%" align="center">&nbsp;</td>	
											  <td width="1%" align="center">&nbsp;</td>	
											  <%
											  }
											  %>					
											</tr>	
											<%
												lineNo++;
												}
											%>
			</tbody>
			</table>		
			</div>
			<%}else
			if(action!=null&&action.equals("huizong")&&jfhzis.size()==0)
			{
			 %>
			  <div align="center">
			  <br>
			 	目前暂无相关记录！
			 </div>
			 <%
			 }
			  %>
</div>	
</div>



</body>
<!--代码高亮start-->
<script type="text/javascript" src="<%=path+"/highlight/highlight.js" %>"></script>
<script type="text/javascript" src="<%=path+"/highlight/lang-xml.js" %>"></script>
<script type="text/javascript" src="<%=path+"/highlight/lang-html.js" %>"></script>
<link href="<%=path+"/highlight/mainstyle.css" %>" rel="stylesheet" type="text/css"/>
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