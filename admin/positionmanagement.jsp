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
<title>职称管理</title>
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
			window.location.href="../PositionServlet?action=delete&idarray="+msg;
		else
			return false;
}
function checkdata(field)
{	
	if(field.position.value=="")
	{
		alert('请输入职称名称！');
   		field.position.select();
   		return false;
	}
}
</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="职称管理" roller="true">		
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
			<td width="5%">
			   	 <a  href="exportfile.jsp?type=PositionToMysql"  target="_blank" onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )"><img alt="导入数据" border="0" src="../images/import.jpg"></a>       
		    </td>
		    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="../upload/moban/positionmoban.xls" target="_blank"><u>模版</u></a></td>
		</tr>
</table>
<br/>
<form name="exportform" method="post" action="../PositionServlet?action=export">	
	<input type="button" value="删除选中" onclick="delSel()"/>	
	<input type="button" value="增加" onclick="javascript:window.location.href='positionmanagement.jsp?action=add'"/>
	<input type="submit" value="导出" />
	<input type="button" value="刷新" onclick="javascript:window.location.href='positionmanagement.jsp'"/>
</form>
	<%
		if(action!=null&&action.equals("add"))
		{
	%>
	<form name="addform" action="../PositionServlet?action=add" method="post" onSubmit="return checkdata(this);">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
		<th align="left">职称名称</th>
		</tr>
		<tr>
		<td width=10%><input type="text" name="position" size="20"/></td>
		<td align="left">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" class="button" name="save"  value="增加"/>
		<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='positionmanagement.jsp'"/>
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
			<th align="center" width="15%"  nowrap="nowrap">职称名称</th>
			<th align="center" width="50%"  nowrap="nowrap">操作</th>
		</tr>
		<%
				int lineNo=1;
			    for (Iterator<Position_Info> it = pis.iterator(); it.hasNext();)
				{
					Position_Info pi = it.next();	
					if(!pi.getPos_name().equals(""))
					{					
		%>
		<tr>
			<td>
				<div align="center">														
				<input type="checkbox"  value="<%=pi.getPos_id() %>"/> 														
				</div>
			</td>
			<td align="center" nowrap="nowrap"><%=lineNo %>&nbsp;</td>				
			<%
				if(action!=null&&action.equalsIgnoreCase("alter")&&id!=0&&id==pi.getPos_id())
				{					
			%>						
				<form name="form" action="../PositionServlet?action=alter&id=<%=id %>" method="post" onSubmit="return checkdata(this);">
				<td nowrap="nowrap">	
				<input type="text" name="position" size="20" value="<%=pi.getPos_name() %>"/>
				</td>				
				<td align="center">				
				<input type="submit" class="button" name="save"  value="保存"/>
				<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='positionmanagement.jsp'"/>
				</td>
				</form>			
			<%
			}else
			{
			%>
			<td align="center"><%=pi.getPos_name() %>&nbsp;</td>			
			<td align="center">
			<a href="../PositionServlet?action=delete&idarray=<%=pi.getPos_id()+"," %>" onclick="return confirm('确定要删除吗？')"><img alt="删除" src="../icons/delete.gif"/></a>
			<a href="positionmanagement.jsp?action=alter&id=<%=pi.getPos_id() %>"><img alt="修改" src="../icons/edit.gif"/></a>			
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