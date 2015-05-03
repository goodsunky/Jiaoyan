<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String path=request.getContextPath();
	ArrayList<Monitor_Info> milist=(ArrayList<Monitor_Info>)request.getAttribute("milist");
	String action=(String)request.getParameter("action");
	String searchgw_id=(String)request.getParameter("searchgw_id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>积分监控管理</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/table_style.css" %>"  rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/reset.css" %>"  rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/div.css" %>"  rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/btn.css" %>"  rel="stylesheet" type="text/css"/>
<script type="text/javascript"  src="<%=path+"/js/jquery/jquery.js" %>" ></script>
<script type="text/javascript" src="<%=path+"/js/table_split.js" %>" ></script>
<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js" %>" ></script>
<script type="text/javascript" src="<%=path+"/js/checkmonitor.js" %>" charset="gb2312"></script>
<link rel="stylesheet" type="text/css" href="<%=path+"/css/filehighslide.css" %>" />
<style type="text/css">
	.inputclass{
		border-width: 0;
		/*font-size: 16px;*/
	}
</style>
<script type="text/javascript">
		hs.graphicsDir = '<%=path+"/graphics/" %>';
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
			window.location.href="<%=path+"/MonitorServlet?action=delete&searchgw_id="+searchgw_id+"&idarray=" %>"+msg;
		else
			return false;
}
function add()
{	
	if(tableform.row.value=="")
	{
		alert("请输入行号！");
		return false;
	}else
		if(tableform.score.value=="")
		{
			alert("请输入积分阈值！");
			return false;
		}else
		{
			var url ="<%=path+"/MonitorServlet?action=add&searchgw_id="+searchgw_id %>&gw_id="+tableform.gw_id.value+"&row="+tableform.row.value+"&score="+tableform.score.value+"&pos_id="+tableform.pos_id.value;
			window.location.href = url;
		}
}

function filter()
{
	var url ="<%=path+"/MonitorServlet?action=monitorflat&searchgw_id=" %>"+tableform.searchgw_id.value;
	window.location.href = url;
}

</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="考核预警管理" roller="true">		
	<form name="tableform" action="<%=path+"/MonitorServlet?action=alter&searchgw_id="+searchgw_id %>"  method="post" onSubmit="return update(this);">
	<input type="button" value="删除选中" onclick="delSel()"/>	
	<input type="button" value="增加" onclick="javascript:window.location.href='<%=path+"/MonitorServlet?action=addflat&searchgw_id="+searchgw_id %>'"/>
	<input type="button" value="刷新" onclick="javascript:window.location.href='<%=path+"/MonitorServlet?action=monitorflat&searchgw_id="+searchgw_id %>'"/>
	<input type="submit" name="save"  value="保存"/>
	<%
		if(action!=null&&action.equals("addflat"))
		{
	%>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
		<th align="left">&nbsp;&nbsp;&nbsp;行号</th>
		<th align="left">岗位</th>
		<th align="left">职称</th>
		<th align="left">积分阈值</th>
		</tr>
		<tr>
		<td width=5%>&nbsp;&nbsp;
			<input type="text" name="row" size="2"/>
		</td>
		<td width=10%>
			<select name="gw_id">
				<%
					for (Iterator<Gangwei_Info> it = gws.iterator(); it.hasNext();)
					{
						Gangwei_Info di = it.next();
				%>
				<option value="<%=di.getGw_id() %>"><%=di.getGw_name() %></option>
				<%
					}
				%>
			</select>
		</td>
		<td width=10%>
			<select name="pos_id">
				<%
					for (Iterator<Position_Info> it = pis.iterator(); it.hasNext();)
					{
						Position_Info pi = it.next();
				%>
				<option value="<%=pi.getPos_id() %>"><%=pi.getPos_name() %></option>
				<%
					}
				%>
			</select>
		</td>
		<td width=10%>
			<input type="text" name="score" size="2"/>
		</td>
		<td align="left">
		&nbsp;&nbsp;
		<input type="button" class="button" name="save"  value="增加" onclick="javascript:add();"/>
		<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='<%=path+"/MonitorServlet?action=monitorflat&searchgw_id="+searchgw_id %>'"/>
		</td>
		</tr>
	</table>
	<%
	}
	%>
	<input type="hidden" name="idarray"  value=""/>
	<div align="center">
	岗位类别:<select name="searchgw_id" onchange="javascript:filter();">
				<option value="">所有</option>
				<%
					for (Iterator<Gangwei_Info> it = gws.iterator(); it.hasNext();)
					{
						Gangwei_Info di = it.next();
				%>
				<option value="<%=di.getGw_id() %>" <%=searchgw_id!=null&&searchgw_id.equals(String.valueOf(di.getGw_id()))?"selected":"" %>><%=di.getGw_name() %></option>
				<%
					}
				%>
			</select>
	</div>
	<table class="tableStyle" useColor="false" useHover="false" useClick="false" id="checkboxTable">	
		<tr>
			<th width="2%" align="center"></th>
			<th align="center" width="2%"  nowrap="nowrap">行号</th>
			<th align="center" width="2%"  nowrap="nowrap">岗位类别</th>			
			<th align="center" width="2%"  nowrap="nowrap">职称</th>
			<th align="center" width="2%"  nowrap="nowrap">积分阈值</th>
			<th align="center" width="2%"  nowrap="nowrap">删除</th>
		</tr>
		<%
				int lineNo=1;
			    for (Iterator<Monitor_Info> it = milist.iterator(); it.hasNext();)
				{
					Monitor_Info si = it.next();				
		%>
		<tr>
			<td>
				<div align="center">														
				<input type="checkbox"  value="<%=si.getId() %>"/> 														
				</div>
			</td>		
				<td nowrap="nowrap">	
				<input type="hidden" name="gw<%=si.getId() %>"  value="<%=si.getGw_id() %>"/>
				<input type="hidden" name="pos<%=si.getId() %>"  value="<%=si.getPos_id() %>"/>
				<input class="inputclass" type="text" name="row<%=si.getId() %>" size="2" value="<%=si.getRow() %>"/>
				</td>					
				<td nowrap="nowrap">	
					<%=si.getGw().getGw_name() %>
				</td>					
				<td nowrap="nowrap">	
					<%=si.getPos().getPos_name() %>
				</td>
				<td nowrap="nowrap">	
				<input class="inputclass" type="text" name="score<%=si.getId() %>" size="2" value="<%=si.getScore() %>"/>
				</td>
			<td align="center">
			<a href="<%=path+"/MonitorServlet?action=delete&searchgw_id="+searchgw_id+"&idarray="+si.getId()+"," %>" onclick="return confirm('确定要删除吗？')"><img alt="删除" src="<%=path+"/icons/delete.gif" %>" /></a>	
			</td>
		</tr>		
		<%
		lineNo++;
		}
		 %>
	</table>	
	</form>			
</div>
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