<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String path=request.getContextPath();
	ArrayList<Scorecoef_Info> silist=(ArrayList<Scorecoef_Info>)request.getAttribute("silist");
	String action=(String)request.getParameter("action");
	String searchtype=(String)request.getParameter("searchtype");
	int max_count=0;
	if(silist!=null)
	{
		for(Scorecoef_Info si:silist)
			if(si.getCoefarray().length>max_count)
				max_count=si.getCoefarray().length;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>积分系数管理</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/table_style.css" %>"  rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/reset.css" %>"  rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/div.css" %>"  rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/btn.css" %>"  rel="stylesheet" type="text/css"/>
<script type="text/javascript"  src="<%=path+"/js/jquery/jquery.js" %>" ></script>
<script type="text/javascript" src="<%=path+"/js/table_split.js" %>" ></script>
<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js" %>" ></script>
<script type="text/javascript" src="<%=path+"/js/checkcoef.js" %>" charset="gb2312"></script>
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
			window.location.href="<%=path+"/ScorecoefServlet?action=delete&searchtype="+searchtype+"&idarray=" %>"+msg;
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
		if(tableform.coef.value=="")
		{
			alert("请输入积分系数！");
			return false;
		}else
		{
			var url ="<%=path+"/ScorecoefServlet?action=add&searchtype="+searchtype %>&type="+tableform.type.value+"&row="+tableform.row.value+"&coef="+tableform.coef.value;
			window.location.href = url;
		}
}

function filter()
{
	var url ="<%=path+"/ScorecoefServlet?action=coefflat&searchtype=" %>"+tableform.searchtype.value;
	window.location.href = url;
}

</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="积分系数管理" roller="true">		
	<form name="tableform" action="<%=path+"/ScorecoefServlet?action=alter&searchtype="+searchtype %>"  method="post" onSubmit="return update(this);">
	<input type="button" value="删除选中" onclick="delSel()"/>	
	<input type="button" value="增加" onclick="javascript:window.location.href='<%=path+"/ScorecoefServlet?action=addflat&searchtype="+searchtype %>'"/>
	<input type="button" value="刷新" onclick="javascript:window.location.href='<%=path+"/ScorecoefServlet?action=coefflat&searchtype="+searchtype %>'"/>
	<input type="submit" name="save"  value="保存"/>
	<%
		if(action!=null&&action.equals("addflat"))
		{
	%>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
		<th align="left">&nbsp;&nbsp;&nbsp;类型</th>
		<th align="left">行号</th>
		<th align="left">积分系数(请用半角,隔开)</th>
		</tr>
		<tr>
		<td width=10%>&nbsp;&nbsp;
			<select name="type">
				<option value="教研">教研</option>
				<option value="科研">科研</option>
			</select>
		</td>
		<td width=10%><input type="text" name="row" size="2"/></td>
		<td width=10%><input type="text" name="coef" size="80"/></td>
		<td align="left">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="button" name="save"  value="增加" onclick="javascript:add();"/>
		<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='<%=path+"/ScorecoefServlet?action=coefflat&searchtype="+searchtype %>'"/>
		</td>
		</tr>
	</table>
	<%
	}
	%>
	<input type="hidden" name="idarray"  value=""/>
	<input type="hidden" name="max_count"  value="<%=max_count %>"/>
	<div align="center">
	类型:<select name="searchtype" onchange="javascript:filter();">
		<option value="">所有</option>
		<option value="教研" <%=searchtype!=null&&"教研".equals(searchtype)?"selected":"" %>>教研</option>
		<option value="科研" <%=searchtype!=null&&"科研".equals(searchtype)?"selected":"" %>>科研</option>
	</select>
	</div>
	<table class="tableStyle" useColor="false" useHover="false" useClick="false" id="checkboxTable">	
		<tr>
			<th width="2%" align="center"></th>
			<th align="center" width="2%"  nowrap="nowrap">类型</th>			
			<th align="center" width="2%"  nowrap="nowrap">行号</th>
			<th align="center" width="2%"  nowrap="nowrap">人数</th>
			<%
				for(int i=1;i<=max_count;i++)
				{
			%>
			<th align="center" width="2%"  nowrap="nowrap">第<%=i %></th>
			<%
				}
			%>
			<th align="center" width="2%"  nowrap="nowrap">删除</th>
		</tr>
		<%
				int lineNo=1;
			    for (Iterator<Scorecoef_Info> it = silist.iterator(); it.hasNext();)
				{
					Scorecoef_Info si = it.next();				
		%>
		<tr>
			<td>
				<div align="center">														
				<input type="checkbox"  value="<%=si.getId() %>"/> 														
				</div>
			</td>							
				<td nowrap="nowrap">	
				<input readonly="readonly" class="inputclass" type="text" name="type<%=si.getId() %>" size="3" value="<%=si.getType() %>"/>
				</td>					
				<td nowrap="nowrap">	
				<input class="inputclass" type="text" name="row<%=si.getId() %>" size="2" value="<%=si.getRow() %>"/>
				</td>
				<td nowrap="nowrap">	
					<input type="hidden" name="num<%=si.getId() %>"  value="<%=si.getCoefarray().length %>"/>
					<%=si.getCoefarray().length %>人
				</td>
				<%
					for(int i=0;i<si.getCoefarray().length;i++)
					{
				%>
				<td nowrap="nowrap">	
				<input class="inputclass" type="text" name="coef<%=String.valueOf(si.getId())+"_"+String.valueOf(i+1) %>" size="2" value="<%=si.getCoefarray()[i] %>"/>
				</td>
				<%
					}
				 %>	
				 <%
				 	for(int i=si.getCoefarray().length;i<max_count;i++)
				 	{
				  %>
				 <td nowrap="nowrap">	
					<input class="inputclass" type="text" name="coef<%=String.valueOf(si.getId())+"_"+String.valueOf(i+1) %>" size="2"/>
				</td>
				<%
					}
				 %>
			<td align="center">
			<a href="<%=path+"/ScorecoefServlet?action=delete&searchtype="+searchtype+"&idarray="+si.getId()+"," %>" onclick="return confirm('确定要删除吗？')"><img alt="删除" src="<%=path+"/icons/delete.gif" %>" /></a>	
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