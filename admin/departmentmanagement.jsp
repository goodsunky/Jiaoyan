<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String action=(String)request.getParameter("action");
	String strid=(String)request.getParameter("id");
	int id=0;
	if(strid!=null)
		id=Integer.parseInt(strid);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>部门管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../css/table_style.css" rel="stylesheet" type="text/css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css"/>
<link href="../css/div.css" rel="stylesheet" type="text/css"/>
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/table_split.js"></script>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';
</script>
<script type="text/javascript">
function delSel()
{
	var msg="";
	$("#checkboxTable input[type=checkbox]").each(function(){
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
			window.location.href="../DepartmentServlet?action=delete&idarray="+msg;
		else
			return false;
}
function checkdata(field)
{	
	if(field.dept.value=="")
	{
		alert('请输入部门！');
   		field.dept.select();
   		return false;
	}
}

</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="部门管理" roller="true">		
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
			<td width="5%">
			   	 <a  href="exportfile.jsp?type=DepartmentToMysql"  target="_blank" onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )"><img alt="导入数据" border="0" src="../images/import.jpg"></a>       
		    </td>
		    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="../upload/moban/departmentmoban.xls" target="_blank"><u>模版</u></a></td>
		</tr>
</table>
<br/>
<form name="exportform" method="post" action="../DepartmentServlet?action=export">	
	<input type="button" value="删除选中" onclick="delSel()"/>	
	<input type="button" value="增加" onclick="javascript:window.location.href='departmentmanagement.jsp?action=add'"/>
	<input type="submit" value="导出" />
	<input type="button" value="刷新" onclick="javascript:window.location.href='departmentmanagement.jsp'"/>
</form>
	<%
		if(action!=null&&action.equals("add"))
		{
	%>
	<form name="addform" action="../DepartmentServlet?action=add" method="post" onSubmit="return checkdata(this);">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
		<th align="left">部门名称</th>
		</tr>
		<tr>
		<td width=10%><input type="text" name="dept" size="20"/></td>
		<td align="left">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" class="button" name="save"  value="增加"/>
		<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='departmentmanagement.jsp'"/>
		</td>
		</tr>
	</table>
	</form>
	<%
	}
	%>
	<table class="tableStyle" id="checkboxTable">	
		<tr>
			<th width="2%" align="center"></th>
			<th align="center" width="2%"  nowrap="nowrap">序号</th>
			<th align="center" width="15%"  nowrap="nowrap">部门名称</th>
			<th align="center" width="50%"  nowrap="nowrap">操作</th>
		</tr>
		<%
				int lineNo=1;
			    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
				{
					Department_Info di = it.next();	
					if(!di.getDept_name().equals(""))
					{					
		%>
		<tr>
			<td>
				<div align="center">														
				<input type="checkbox"  value="<%=di.getDept_id() %>"/> 														
				</div>
			</td>
			<td align="center" nowrap="nowrap"><%=lineNo %>&nbsp;</td>				
			<%
				if(action!=null&&action.equalsIgnoreCase("alter")&&id!=0&&id==di.getDept_id())
				{					
			%>						
				<form name="form" action="../DepartmentServlet?action=alter&id=<%=id %>" method="post" onSubmit="return checkdata(this);">
				<td nowrap="nowrap">	
				<input type="text" name="dept" size="20" value="<%=di.getDept_name() %>"/>
				</td>				
				<td align="center">				
				<input type="submit" class="button" name="save"  value="保存"/>
				<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='departmentmanagement.jsp'"/>
				</td>
				</form>			
			<%
			}else
			{
			%>
			<td align="center"><%=di.getDept_name() %>&nbsp;</td>			
			<td align="center">
			<a href="../DepartmentServlet?action=delete&idarray=<%=di.getDept_id()+"," %>" onclick="return confirm('确定要删除吗？')"><img alt="删除" src="../icons/delete.gif"/></a>
			<a href="departmentmanagement.jsp?action=alter&id=<%=di.getDept_id() %>"><img alt="修改" src="../icons/edit.gif"/></a>			
			</td>
			<%
			}
			%>
		</tr>		
		<%
		lineNo++;
		}
		}
		 %>
	</table>			
	<input type="button" value="删除选中" onclick="delSel()"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
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