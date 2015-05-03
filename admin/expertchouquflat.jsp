<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>

<%
	ArrayList<Expert_Info> eislist=(ArrayList<Expert_Info>)session.getAttribute("eislist");
	String action=(String)session.getAttribute("action");
	String shuliang=(String)session.getAttribute("shuliang");
	String sex=(String)session.getAttribute("sex");
	String dept=(String)session.getAttribute("dept");
	String position=(String)session.getAttribute("position");
	String xueke=(String)session.getAttribute("xueke");
	String strpageNo=(String)session.getAttribute("pageNo");
	String strtotalcounts=(String)session.getAttribute("totalcounts");
    String strtotalpages=(String)session.getAttribute("totalpages");
    String pageSize=(String)session.getAttribute("pageSize");
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
<link href="../css/resultstyle.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.PrintArea.js"></script>
<script type="text/javascript" src="../js/remaincount.js"></script>
<SCRIPT type="text/javascript" src="../js/ESONCalendar.js" charset="gb2312"  ></SCRIPT>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/highslide.css" />



<script language=javascript>   
	$(document).ready(function(){
	  $("input#printButton").click(function(){
	  $("div#printArea").printArea();
	});
	});
	function checkdata()
	{
		var shuliang=document.getElementById("shuliang");
		var ok=validate(shuliang);
		if(ok=="no")
		{
			alert("请输入非负整数！");
			shuliang.select();
			return false;
		}
	}	
	function validate(field) 
	{
	   var valid = "0123456789";
	   var ok = "yes";
	   var temp;
	   for (var i=0; i<field.value.length; i++) {
	       temp = "" + field.value.substring(i, i+1);
	       if (valid.indexOf(temp) == "-1"||field.value<=0)
		      ok = "no";		     
	   }		  
	   return ok;
	}
</script>

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
			<div class="box2" panelTitle="专家抽取" >
			<form name="form" method="post" action="../ExpertServlet?action=chouqu&pageNo=1" onsubmit="return checkdata()">
			<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
				<tr>	
			    <td width="7%" nowrap="nowrap"><div align="right">性别：</div></td>
			    <td width="8%" nowrap="nowrap">
			    	<select name="sex">
			    	<option value="">所有</option>    
			    	<option value="男" <%=null!=sex&&sex.equals("男")?"selected":"" %>>男</option>
			    	<option value="女" <%=null!=sex&&sex.equals("女")?"selected":"" %>>女</option>
			    	</select>    </td>
			    <td width="7%" nowrap="nowrap"><div align="left">专业技术资格：</div></td>
			    <td width="5%" nowrap="nowrap">
			    <div align="left">
				    <select name="position">
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
				    </select>
				 </div>    </td>
			    <td width="8%" nowrap="nowrap"><div align="right">所在部门：</div></td>
			    <td width="9%" nowrap="nowrap">
			    	<select name="dept">
				        <option value="">所有</option>
				    	<%
				    	for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
						{
							Department_Info di = it.next();		
							if(!di.getDept_name().equals(""))
							{	
					    %>
					        <option value="<%=di.getDept_name() %>" <%=null!=dept&& dept.equals(di.getDept_name())?"selected":"" %>><%=di.getDept_name() %></option>
					        <%}
					    }
					    %>
				    </select>    </td>
			    <td width="9%" nowrap="nowrap"><div align="right">所属学科：</div></td>
			    <td width="6%" nowrap="nowrap">
			    	<select name="xueke">
				        <option value="">所有</option>
				    	<%
				    	for (Iterator<Xueke_Info> it = xks.iterator(); it.hasNext();)
						{
							Xueke_Info xi = it.next();		
					    %>
					        <option value="<%=xi.getXueke_name() %>" <%=null!=xueke&&xueke.equals(xi.getXueke_name())?"selected":"" %>><%=xi.getXueke_name() %></option>
					        <%
					    }
					    %>
				    </select>    </td>
			    <td width="9%" align="right" nowrap="nowrap">抽取数量：</td>
			    <td width="8%" nowrap="nowrap"><input name="shuliang" id="shuliang" type="text" size="2" value="<%=shuliang==null?"":shuliang %>"></td>
			    <td width="22%" nowrap="nowrap"><div align="center">
			      <input name="save" type="submit" value="查询" class="button" >
			    </div>
			      <div align="left"></div></td>
			    <td width="2%">&nbsp;</td>
			   </tr>   	
			</TABLE>		
			</form>
			</div>			
			<%
			if(action!=null&&action.equals("chouqu")&&totalcounts!=0)
			{
			%>
				<form name="exportform" method="post" action="../ExpertServlet?action=exportchouqu">
					<input type="submit" value="导出" class="button" />
					<input type="button" value="打印" class="button" id="printButton"/>
				</form>				
				<div id="printArea">
				<table class="jive-table" id="printtable" cellspacing="0" cellpadding="0"	bgcolor="#FFFFFF" border="1" align="center">
						<thead>
							<tr>
								<th width="1%" class="jive-first" nowrap="nowrap">
									编号												
								</th>												
								<th width="1%" class="jive-first" nowrap="nowrap">
									姓名												
								</th>
								<th width="2%" class="jive-first" nowrap="nowrap">
									所在部门											
								</th>
								<th width="1%" class="jive-first" nowrap="nowrap">
									性别												
								</th>
								<th width="2%" class="jive-first" nowrap="nowrap">
									专业技术资格												
								</th>
								<th width="1%" class="jive-first" nowrap="nowrap">
									最高学位												
								</th>							
								<th width="1%" nowrap="nowrap" class="jive-first">
									所属学科							
								</th>	
								<th width="1%" nowrap="nowrap" class="jive-first">
									移动电话												
								</th>	
								<th width="1%" nowrap="nowrap" class="jive-first">
									办公电话												
								</th>											
								<th width="8%" class="jive-first" nowrap="nowrap">
									教研方向												
								</th>																					
							</tr>
						</thead>										
						<tbody>
								<%
								int lineNo=1;
								for (Iterator<Expert_Info> it = eislist.iterator(); it.hasNext();)
								 {
									/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
									Expert_Info ei = it.next();
									String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
								%>											
							<tr class='<%=classStr%>'>
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=lineNo %>
									</div>
								</td>												
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_name() %>&nbsp;
									</div>
								</td>
								<td width="3%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_dept_name() %>&nbsp;
									</div>
								</td>
								 <td width="1%">
									<div align="center">
										<%=ei.getExpt_sex() %>&nbsp;
									</div>
								</td>
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_pos_name() %>&nbsp;
									</div>
								</td>
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_xw_name() %>&nbsp;
									</div>
								</td>
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_xk_name() %>&nbsp;
									</div>
								</td>	
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_mphone() %>&nbsp;
									</div>
								</td>
								<td width="1%" nowrap="nowrap">
									<div align="center">
										<%=ei.getExpt_ophone() %>&nbsp;
									</div>
								</td>												
								<td width="3%">
									<div align="center">
										<%=ei.getExpt_jyfx() %>&nbsp;
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
		    <%
			}
			%>			
			<%
			if(action!=null&&action.equals("chouqu")&&totalcounts==0)
			{				
			%>
				<div id="NoResult" style="text-align:center;">
							目前暂无相关记录！
				</div>
			<%
			}
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