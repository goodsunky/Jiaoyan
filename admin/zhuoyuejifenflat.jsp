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
<title>卓越工程师和专业综合积分标准管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../css/table_style.css" rel="stylesheet" type="text/css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css"/>
<link href="../css/div.css" rel="stylesheet" type="text/css"/>
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/table_split.js"></script>
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
			window.location.href="../ZhuoyuejifenServlet?action=delete&idarray="+msg;
		else
			return false;
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
   if(field.value=="")
   	ok="no";
   return ok;
}
function checkdata(field)
{	
	var ok=validate(field.zongjifen);
	if(field.khzb.value=="")
	{
		alert('请输入考核指标！');
   		field.khzb.select();
   		return false;
	}else
		if(ok=="no")
		{
			alert('请输入非负整数积分！');
	   		field.zongjifen.select();
	   		return false;
		}else
			if(field.remark.value=="")
			{
				alert('请输入备注！');
		   		field.remark.select();
		   		return false;
			}
}
</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="卓越工程师和专业综合积分标准管理（注：有“*”号标记的为突出业绩项目）" roller="true">		
<form name="exportform" method="post" action="exportzhuoyuejifen.jsp?action=export">	
	<input type="button" value="删除选中" onclick="delSel()"/>	
	<input type="button" value="增加" onclick="javascript:window.location.href='zhuoyuejifenflat.jsp?action=add'"/>
	<input type="button" value="导入" onclick="javascript:window.location.href='zhuoyuejifenflat.jsp?action=import'"/>
	<input type="submit" value="导出" />
</form>
	<%
		if(action!=null&&action.equals("add"))
		{
	%>
	<form name="addform" action="../ZhuoyuejifenServlet?action=add" method="post" onSubmit="return checkdata(this);">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
		<th align="left">考核指标</th>
		<th align="left">积分</th>
		<th align="left">备注</th>
		</tr>
		<tr>
		<td><input type="text" name="khzb" size="20"/></td>
		<td><input type="text" name="zongjifen" size="3"/></td>
		<td>
		<input type="text" name="remark" size="70"/>
		<input type="submit" class="button" name="save"  value="增加"/>
		<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='zhuoyuejifenflat.jsp'"/>
		</td>
		</tr>
	</table>
	</form>
	<%
	}
	%>
	<table class="tableStyle" id="checkboxTable">	
		<tr>
			<th width="2%"></th>
			<th align="center" width="2%"  nowrap="nowrap">序号</th>
			<th align="center" width="16%"  nowrap="nowrap">考核指标</th>
			<th align="center" width="3%"  nowrap="nowrap">积分（分/项）</th>
			<th align="center" width="52%"  nowrap="nowrap">备注</th>
			<th align="center" width="52%"  nowrap="nowrap">操作</th>
		</tr>
		<%
				int lineNo=1;
			    for (Iterator<Zhuoyuejifen_Info> it = zyjfis.iterator(); it.hasNext();)
				{
					Zhuoyuejifen_Info zhyjf = it.next();						
		%>
		<tr>
			<td>
				<div align="center">														
				<input type="checkbox"  value="<%=zhyjf.getZyjf_id() %>"/> 														
				</div>
			</td>
			<td align="center" nowrap="nowrap"><%=lineNo %>&nbsp;</td>				
			<%
				if(action!=null&&action.equalsIgnoreCase("alter")&&id!=0&&id==zhyjf.getZyjf_id())
				{					
			%>						
				<form name="form" action="../ZhuoyuejifenServlet?action=alter&id=<%=id %>" method="post" onSubmit="return checkdata(this);">
				<td nowrap="nowrap">	
				<input type="text" name="khzb" size="20" value="<%=zhyjf.getZyjf_khzb() %>"/>
				</td>
				<td nowrap="nowrap">	
				<input type="text" name="zongjifen" size="7" value="<%=zhyjf.getZyjf_zongjifen() %>" />
				</td>
				<td>				
				<input type="text" name="remark" size=70 value="<%=zhyjf.getZyjf_remark() %>"/>				
				</td>
				<td align="center">				
				<input type="submit" class="button" name="save"  value="保存"/>
				<input type="button" class="button" name="cancel"  value="取消" onclick="javascript:window.location.href='zhuoyuejifenflat.jsp'"/>
				</td>
				</form>			
			<%
			}else
			{
			%>
			<td align="center"><%=zhyjf.getZyjf_khzb() %>&nbsp;</td>
			<td align="center" nowrap="nowrap"><%=zhyjf.getZyjf_zongjifen() %>&nbsp;</td>	
			<td><%=zhyjf.getZyjf_remark() %>&nbsp;</td>
			<td align="center">
			<a href="../ZhuoyuejifenServlet?action=delete&idarray=<%=zhyjf.getZyjf_id()+"," %>" onclick="return confirm('确定要删除吗？')">删除</a>
			&nbsp;&nbsp;
			<a href="Zhuoyuejifenflat.jsp?action=alter&id=<%=zhyjf.getZyjf_id() %>">修改</a>			
			</td>
			<%
			}
			%>
		</tr>		
		<%
		lineNo++;
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