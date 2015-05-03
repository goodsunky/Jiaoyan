<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp"%>
<%@ include file="../common/getnecessaryinfo.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String path=request.getContextPath();	
	Jiaoyanchengji_Info jycji=(Jiaoyanchengji_Info)request.getAttribute("chengjiresult");
	ArrayList<Jiaoyan_Info> jyis=(ArrayList<Jiaoyan_Info>)request.getAttribute("jyis");
	String name=(String)session.getAttribute("username");
	String title=(String)session.getAttribute("title");
	String url=(String)request.getAttribute("url");
	String action=(String)request.getAttribute("action");
	String jyxm=(String)request.getAttribute("jyxm");
	String jylx=(String)request.getAttribute("jylx");
	String starttime=(String)request.getAttribute("starttime");	
	String endtime=(String)request.getAttribute("endtime");		
	String tongjitype=(String)request.getAttribute("tongjitype");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>教研与科研成绩</title>
		<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>	
		<link href="<%=path+"/css/btn.css" %>" rel="stylesheet" type="text/css"/>
		<link href="<%=path+"/css/resultstyle.css" %>" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js" %>"></script>
		<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js" %>"></script>
		<link rel="stylesheet" type="text/css" href="<%=path+"/css/highslide.css" %>" />
		<script language=javascript>   
	function doPrint() 
	{ 
		var newWin = window.open('about:blank','','');
		var titleHTML = document.getElementById("printtable").innerHTML;
		newWin.document.write(titleHTML);
		newWin.document.location.reload();
		newWin.print();
		newWin.close();
	}	
	function checkdata()
	{
		if(form.starttime.value==""||form.endtime.value=="")
		{
		  alert("请选择时间段！");		  
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
		var url="<%=path+"/JiaoyanchengjiServlet?action=filter&jylx=" %>"+form.jylx.value+"&url="+form.url.value+"&dept="+form.dept.value+"&starttime="+form.starttime.value+"&jyxm="+form.jyxm.value+"&endtime="+form.endtime.value+"&tongjitype="+form.tongjitype.value;
		window.location.href=url;
	}
</script>
		<style type="text/css">
<!--
.STYLE1 {
	font-size: small
}
-->
</style>
	</head>
	<body style="margin: 0px auto;">
		<div id="container">
			<div id="content">
				<div class="box2" panelTitle="教研与科研成绩查询">
			<form name="form" method="post" action="<%=path+"/JiaoyanchengjiServlet?action=huizong&tongjitype="+tongjitype %>" onSubmit="return checkdata()">
			<input type="hidden" name="url" value="<%=url %>" />
			<input type="hidden" name="tongjitype" value="<%=tongjitype %>" />
			<input type="hidden" name="dept" value="" />
			<TABLE WIDTH=95% BORDER=0 CELLPADDING=0 CELLSPACING=0>
				<tr>
				<td width="20%" nowrap="nowrap">
			    <div align="right">类型：</div></td>
			    <td width="10%" nowrap="nowrap">
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
			    <td width="10%" nowrap="nowrap">
			    	<select name="jyxm">
				        <option value="">所有</option>
				    	<%
				    	if(jyis!=null)
				    	{
				    	for (Iterator<Jiaoyan_Info> it = jyis.iterator(); it.hasNext();)
						{
							Jiaoyan_Info jyi = it.next();			
					    %>
					        <option value="<%=jyi.getJy_shortname() %>" <%=null!=jyi.getJy_shortname()&&jyi.getJy_shortname().equals(jyxm)?"selected":"" %>><%=jyi.getJy_name() %></option>
					    <%
					    }
					    }
					    %>
				    </select>
				 </td>
				 <td width="5%" nowrap="nowrap"><div align="right">起始时间*</div></td>
				 <td width="10%" nowrap="nowrap">
				 <select name="starttime">
					<option value="">请选择</option>
			            <%
					    	for(int y=1990;y<2100;y++)
					    	{
					    %>
			            <option value="<%=y %>" <%=starttime!=null&&!starttime.equals("")&&String.valueOf(y).equals(starttime)?"selected":"" %>><%=y %></option>
			            <%
					    }
					    %>
			          </select>
					  年
				</td>
				<td width="5%" nowrap="nowrap"><div align="right">截止时间*</div></td>
				 <td width="10%" nowrap="nowrap">
					  <select name="endtime">
					<option value="">请选择</option>
			            <%
					    	for(int y=1990;y<2100;y++)
					    	{
					    %>
			            <option value="<%=y %>" <%=endtime!=null&&String.valueOf(y).equals(endtime)?"selected":"" %>><%=y %></option>
			            <%
					    }
					    %>
			          </select>
					  年
				 </td>				
			    <td width="30%" nowrap="nowrap"><div align="center">
			      <input name="huizong" type="submit" value="查询" class="button" >
			    </div>
			      <div align="left"></div></td>
			    <td width="2%">&nbsp;</td>
			   </tr>   	
			</TABLE>	
			</form>
			</div>				
						<%
			if(jycji!=null&&jycji.getJgis()!=null&&jycji.getKchis()!=null&&jycji.getMmis()!=null&&jycji.getJcis()!=null&&jycji.getHjis()!=null&&jycji.getZhyis()!=null
			&&jycji.getZhyueis()!=null&&jycji.getKyxmis()!=null&&jycji.getKytdis()!=null&&jycji.getLwis()!=null&&jycji.getZhlis()!=null&&jycji.getYsis()!=null
			&&(jycji.getJgis().size()!=0||jycji.getKchis().size()!=0||jycji.getMmis().size()!=0||jycji.getJcis().size()!=0||jycji.getHjis().size()!=0||jycji.getZhyis().size()!=0
			   ||jycji.getZhyueis().size()!=0||jycji.getKyxmis().size()!=0||jycji.getKytdis().size()!=0||jycji.getLwis().size()!=0||jycji.getZhlis().size()!=0||jycji.getYsis().size()!=0))
			{
			%>
			<TABLE WIDTH=95% BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<tr>
			<td align="center" nowrap="nowrap" style="font-weight: bold;font-size:15px;">
			<%=title %>
			</td>
			</tr>
			</TABLE>	
			<%@ include file="../common/jiaogaichengji.jsp" %>
			<%@ include file="../common/kechengchengji.jsp" %>
			<%@ include file="../common/multimediachengji.jsp" %>
			<%@ include file="../common/jiaocaichengji.jsp" %>
			<%@ include file="../common/huojiangchengji.jsp" %>
			<%@ include file="../common/zhuangyechengji.jsp" %>
			<%@ include file="../common/keyanxmchengji.jsp" %>
			<%@ include file="../common/lunwenchengji.jsp" %>
			<%@ include file="../common/zhuanglichengji.jsp" %>
			<%@ include file="../common/yishuchengji.jsp" %>
			<%@ include file="../common/keyantdchengji.jsp" %>
			<%
			}else
			if(jycji!=null&&jycji.getJgis()!=null&&jycji.getKchis()!=null&&jycji.getMmis()!=null&&jycji.getJcis()!=null&&jycji.getHjis()!=null&&jycji.getZhyis()!=null
			&&jycji.getZhyueis()!=null&&jycji.getKyxmis()!=null&&jycji.getKytdis()!=null&&jycji.getLwis()!=null&&jycji.getZhlis()!=null&&jycji.getYsis()!=null
			&&jycji.getJgis().size()==0&&jycji.getKchis().size()==0&&jycji.getMmis().size()==0&&jycji.getJcis().size()==0&&jycji.getHjis().size()==0&&jycji.getZhyis().size()==0
			&&jycji.getZhyueis().size()==0&&jycji.getKyxmis().size()==0&&jycji.getKytdis().size()==0&&jycji.getLwis().size()==0&&jycji.getZhlis().size()==0&&jycji.getYsis().size()==0)
			{
			%>
			<br>
			<TABLE WIDTH=95% BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<tr>
			<td align="center" nowrap="nowrap" style="font-weight: bold;font-size:15px;">
			目前暂无相关记录！
			</td>
			</tr>
			</TABLE>
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










