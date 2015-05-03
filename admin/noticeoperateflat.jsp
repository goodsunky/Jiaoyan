<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jiaoyan.notice.*,java.util.* " %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String path=request.getContextPath();
	ArrayList<Notice_Info> nislist=(ArrayList<Notice_Info>)request.getAttribute("nislist");
	PageBean pb=(PageBean)request.getAttribute("pagebean");
	Notice_Info nisearch=(Notice_Info)request.getAttribute("nisearch");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教研管理系统</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>	
<link href="<%=path+"/css/btn.css" %>" rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/date.css" %>" rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/checkbox.css"%>" rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/resultstyle.css"%>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js"%>" ></script>
<script type="text/javascript" src="<%=path+"/js/checkbox_split.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/datePicker/WdatePicker.js"%>"></script>

<script type="text/javascript">
var dateSkin="blue";
$(document).ready(function(){
	document.getElementById("startissuedate").onfocus=function(){
		var endissuedate=$dp.$('endissuedate');WdatePicker({
			skin:dateSkin,onpicked:function(){endissuedate.focus();},maxDate:'#F{$dp.$D(\'endissuedate\')}'
		})
	}
	document.getElementById("endissuedate").onfocus=function(){
		WdatePicker({skin:dateSkin,minDate:'#F{$dp.$D(\'startissuedate\')}'})
	}	
})		
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
	var cpp=form.countperpage.value;
	var pNo=form.pageNo.value;
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
			window.location.href="NoticeServlet?action=delete&idarray="+msg+"&pageNo="+pNo+"&countperpage="+cpp;
		else
			return false;
	//<a href="../ExpertServlet?action=delete&expid=ei.getExpt_id()" onClick="return confirm('确定要删除吗？'); ">删除</a>
	//alert(msg);
}
</script>
<script type="text/javascript">
	function checkdata(para)
	{
		var pNo=0;
		var cpp=form.countperpage.value;
		if(para=='mid')
			pNo=form.pageNo.value;
		else
			if(para=='up')
				pNo=parseInt(form.pageNo.value)-1;
			else
				if(para='down')
					pNo=parseInt(form.pageNo.value)+1;
		var url="NoticeServlet?action=pagesearch&pageNo="+pNo+"&countperpage="+cpp;
		window.location.href=url;
	}
	function alter(id)
	{
		var cpp=form.countperpage.value;
		var pNo=form.pageNo.value;
		var url="NoticeServlet?action=alter&pageNo="+pNo+"&countperpage="+cpp+"&notid="+id;
		window.location.href=url;
	}
	function checkdate()
	{
		if((conditionform.startissuedate.value==""&&conditionform.endissuedate.value!="")||(conditionform.startissuedate.value!=""&&conditionform.endissuedate.value==""))
		{
			alert("请选择时间段！");
			return false;
		}
	}
</script>
</head>
<body>
<div id="container">
<div id="content">
<div class="box2"  panelTitle="信息查询与修改">
	<form name="conditionform" method="post" action="<%=path+"/NoticeServlet?action=search"%>" onsubmit="return checkdate()">
	<TABLE width=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
		<td>
		&nbsp;&nbsp;类别：
		<select name="noticetype">
			<option value="">所有</option>
			<option value="重要公告" <%=nisearch!=null&&nisearch.getNot_type()!=null&&nisearch.getNot_type().equals("重要公告")?"selected":"" %>>重要公告</option>
			<option value="重要通知" <%=nisearch!=null&&nisearch.getNot_type()!=null&&nisearch.getNot_type().equals("重要通知")?"selected":"" %>>重要通知</option>
		</select>		
		</td>
		<td> 
		标题：<input name="title" type="text" value="<%=nisearch!=null&&nisearch.getNot_title()!=null?nisearch.getNot_title():"" %>"/>	
		</td>
		<td> 
		更新日期：
		<input name="startissuedate" id="startissuedate" class="cusDate" type="text" value="<%=nisearch!=null&&nisearch.getStartissuedate()!=null?nisearch.getStartissuedate():"" %>"/> 
		至 <input name="endissuedate" id="endissuedate" class="cusDate"  type="text" value="<%=nisearch!=null&&nisearch.getEndissuedate()!=null?nisearch.getEndissuedate():"" %>"/>
		</td>
	    <td>
	      <div align="left">
	        <input name="save" type="submit" value="查询" class="button">
	      </div>
	    </td>
	    <td width="2%">&nbsp;</td>
	   </tr>   	
	</TABLE>		
	</form>
	</div>
	<%
	//action!=null&&(action.equals("search")||action.equals("pagesearch"))&&
	if(nislist!=null&&nislist.size()!=0)
	{
	%>
	<form name="form" method="post" action="#">
			<br>
	        <table border="0" cellpadding="3" cellspacing="0" style="margin:0px auto;"  WIDTH=100% >
				<tr>
					<td colspan="5" align="left" nowrap="nowrap">
						当前第<%=pb.getPageNo() %>页						
					    [
						<a href="<%=path+"/NoticeServlet?action=pagesearch&pageNo="+(pb.getPageNo()-1)+"&countperpage="+pb.getNotice_Page_Size() %>">上一页</a> 
						|
						<select name="pageNo" onchange="javascript:checkdata('mid');" >
 						<%
 						for(int i=1;i<=pb.getTotalPages();i++)
 						{
 						%>
 						<option value="<%=i %>" <%=pb!=null&&pb.getPageNo()==i?"selected":"" %>><%=i %></option>
 						<%
 						}
 						%>
 						</select> 						
					    |
					    <a href="<%=path+"/NoticeServlet?action=pagesearch&pageNo="+(pb.getPageNo()+1)+"&countperpage="+pb.getNotice_Page_Size() %>">下一页</a>] 
 					共<%=pb.getTotalRecords() %>条记录/每页显示
 					<select name="countperpage" onchange="javascript:checkdata('mid');">
 					<%
 					for(int i=10;i<=10*10;i+=10)
 					{
 					%>
 					<option value="<%=i %>" <%=pb!=null&&pb.getNotice_Page_Size()==i?"selected":"" %>><%=i %></option>
 					<%
 					}
 					%>
 					</select>
 					记录					
 					</td>				
					<td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td width="13%" >&nbsp;</td>
				    <td width="13%" >&nbsp;</td>
			</tr>
			</table>
			<br>
			</form>
			<form name="exportform" method="post" action="exportexpert.jsp?action=export" target="_blank">
			<input type="button" value="全选" onClick="checkSelAll()"/>
			<input type="button" value="全不选" onClick="checkSelNone()"/>
			<input type="button" value="删除选中" onClick="delSel()"/>
			</form>
			<div id="checkGroup" class="jive-table">
			<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >				
				<thead>
					<tr>
						<th width="1%" class="jive-first" nowrap="nowrap">
							选择												
						</th>
						<th width="1%" class="jive-first" nowrap="nowrap">
							编号												
						</th>												
						<th width="1%" class="jive-first" nowrap="nowrap">
							信息类别												
						</th>
						<th width="1%" class="jive-first" nowrap="nowrap">
							标题												
						</th>
						<th width="1%" class="jive-first" nowrap="nowrap">
							更新日期												
						</th>						
						<th width="1%" class="jive-first" nowrap="nowrap">
							操作										
						</th>
					</tr>
				</thead>	
				<tbody>
					<%
							int lineNo=1;
							lineNo=(pb.getPageNo()-1)*pb.getNotice_Page_Size()+1;
							for (Iterator<Notice_Info> it = nislist.iterator(); it.hasNext();)
							 {
								/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
								Notice_Info ni = it.next();
								String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
							%>											
						<tr class="<%=classStr%>">
							<td width="1%" nowrap="nowrap">
								<div class="render" align="center">
									<input type="checkbox"  value="<%=ni.getNot_id() %>"/> 														
								</div>
							</td>	
							<td width="1%" nowrap="nowrap">
								<div align="center">
									<%=lineNo %>
								</div>
							</td>																							
							<td width="1%" nowrap="nowrap">
								<div align="center">
									<%=ni.getNot_type() %>&nbsp;
								</div>
						  </td>
							<td width="1%">
								<div align="center">
								<a href="<%=path+"/NoticeServlet?action=show&notid="+ni.getNot_id() %>" target="_blank"><%=ni.getNot_title() %></a>&nbsp;
								</div>
							</td>
							<td width="1%" nowrap="nowrap">
								<div align="center">
									<%=ni.getNot_issuedate() %>&nbsp;
								</div>
							</td>									
					      <td width="1%" nowrap="nowrap">
								<div align="center">
									<a href="<%=path+"/NoticeServlet?action=delete&idarray="+ni.getNot_id()+"&pageNo="+pb.getPageNo()+"&countperpage="+pb.getNotice_Page_Size() %>" onclick="return confirm('确定要删除吗？')"><img border="0" alt="删除" src="<%=path+"/icons/delete.gif"%> "/></a>														
									<a href="<%=path+"/NoticeServlet?action=alter&pageNo="+pb.getPageNo()+"&countperpage="+pb.getNotice_Page_Size()+"&notid="+ni.getNot_id() %>"><img border="0" alt="修改" src="<%=path+"/icons/edit.gif"%> "/></a>
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
			<form name="exportform" method="post" action="exportexpert.jsp?action=export" target="_blank">
			<input type="button" value="全选" onClick="checkSelAll()"/>
			<input type="button" value="全不选" onClick="checkSelNone()"/>
			<input type="button" value="删除选中" onClick="delSel()"/>
			</form>			
	<%
	}else
		if(nislist!=null&&nislist.size()==0)
		{
	%>
	<br>
	<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" >
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
</div>
</body>		
<!--代码高亮start-->
<script type="text/javascript" src="<%=path+"/highlight/highlight.js"%>"></script>
<script type="text/javascript" src="<%=path+"/highlight/lang-xml.js"%>"></script>
<script type="text/javascript" src="<%=path+"/highlight/lang-html.js"%>"></script>
<link href="<%=path+"/highlight/mainstyle.css"%>" rel="stylesheet" type="text/css"/>
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