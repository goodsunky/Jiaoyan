<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String id = (String)request.getParameter("id");
	Kecheng_Info ki=(Kecheng_Info)session.getAttribute("kidetail");
	String[][] lxmemscore = (String[][]) session.getAttribute("lxmemscore");
	String[][] zjmemscore = (String[][]) session.getAttribute("zjmemscore");
	String[][] jtmemscore = (String[][]) session.getAttribute("jtmemscore");
	Float lxzongjifen = (Float) session.getAttribute("lxzongjifen");
	Float zjzongjifen = (Float) session.getAttribute("zjzongjifen");
	Float jtzongjifen = (Float) session.getAttribute("jtzongjifen");
	
	int lxmcount = lxmemscore!=null?lxmemscore.length:0, zjmcount = zjmemscore!=null?zjmemscore.length:0, jtmcount = jtmemscore!=null?jtmemscore.length:0;
	int i=0;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程积分分配</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
<script type="text/javascript" src="../js/checkkechengjifenform.js" charset="gb2312"></script>
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';     
</script>

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="课程积分分配" panelWidth="100%">	
	<br>
	<form name="form" method="post" action="../KechengServlet?action=doassign&id=<%=id %>" onSubmit="return checkdata(<%=lxmcount %>,<%=zjmcount %>,<%=jtmcount %>,<%=ki.getKch_jxzf() %>)">
	<input name="id" type="hidden" value="<%=id %>"/>
	<fieldset>
	    <legend style="font-weight: bold; ">基本资料</legend>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>	    
		<td width="12%"  nowrap="nowrap">
			<div align="left">
			【课程名称】<%=ki.getKch_kcmc() %>			
			</div>		
		</td>	
		<td width="18%" nowrap="nowrap">
		    <div align="left">
		         【课程级别】<%=ki.getKch_kcjb() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		         【本课题绩效总分】<%=ki.getKch_jxzf() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		       <input type="button" value="一键分配" class="button2" onClick="javascript:window.location.href='../KechengServlet?action=onekeyassign&id=<%=id %>'">
		   </div>	   
	    </td>
	    </tr>
	    </table>
	    </fieldset>
	    <br>
	    <%
		   if(ki.getKch_lxsj()!=null&&!"".equals(ki.getKch_lxsj()))
		   {
		 %>
		 <fieldset>
	     <legend style="font-weight: bold; ">立项时积分分配信息</legend>
		 <%
		  		if(ki.getKch_lxmember()!=null&&"".equals(ki.getKch_lxmember()))
		   		{
		%>
				立项时成员信息为空，无法分配积分！
	    <%
				}else
				{
		%>
	    <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	    <tr>
	    <td width="10%" align="left" valign="middle" nowrap="nowrap">
		&nbsp;&nbsp;<input type="button" value="系统分配" class="button2" onClick="return checkzjf(1)">
		</td>	
	    </tr>
	    <tr>	
		<td align="right" nowrap="nowrap" width="8%">&nbsp;&nbsp;【立项时绩效总分】</td>
		<td align="left"> 
		    &nbsp;&nbsp;<input type="text" name="lxzongjifen" id="lxzongjifen" size="3" value="<%=lxzongjifen==0?"":lxzongjifen %>" />	   
	    </td>	
		</tr>
		 <%
			while(i<lxmcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<lxmcount;j++)
	    	{
	    		String token="成员"+(i+1);
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=lxmemscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="lxjifen"+(i+1) %>" id="<%="lxjifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(lxmemscore[i][1])==0?"":lxmemscore[i][1] %>">
	    </td>
	    <%
	    	i++;
	    	}
	    %>	    
		 </tr>		
		 <%
	      }
	    %>
	   </table>	   
	   <%
	   }
	   %>
	   </fieldset>
	   <%
	   	}
	   %>
	   <br>
	    <%
		   if(ki.getKch_zjsj()!=null&&!"".equals(ki.getKch_zjsj()))
		   {
		 %>
		 <fieldset>
	     <legend style="font-weight: bold; ">中检时积分分配信息</legend>
		 <%
		  		if(ki.getKch_zjmember()!=null&&"".equals(ki.getKch_zjmember()))
		   		{
		%>
				中检时成员信息为空，无法分配积分！
	    <%
				}else
				{
		%>
		 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		 <tr>
	    <td width="10%" align="left" valign="middle" nowrap="nowrap">
		&nbsp;&nbsp;<input type="button" value="系统分配" class="button2" onClick="return checkzjf(2)">
		</td>	
	    </tr>
		 <tr>
		 <td width="8%" align="right" nowrap="nowrap">&nbsp;&nbsp;【中检时绩效总分】</td>
		 <td align="left"> 
		    &nbsp;&nbsp;<input type="text" name="zjzongjifen" id="zjzongjifen" size="3" value="<%=zjzongjifen==0?"":zjzongjifen %>" />	   
	    </td>	
		</tr>
		 <%
		 	i=0;
			while(i<zjmcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<zjmcount;j++)
	    	{
	    		String token=(i==0?"负责人":"成员"+(i+1));
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=zjmemscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="zjjifen"+(i+1) %>" id="<%="zjjifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(zjmemscore[i][1])==0?"":zjmemscore[i][1] %>">
	    </td>
	    <%
	    	i++;
	    	}
	    %>	    
		 </tr>		
		 <%
	      }
	    %>
	   </table>
	   <%
	   	}
	   %>
	   </fieldset>
	   <%
	   	}
	   %>
	   <br>
	    <%
		   if(ki.getKch_jtsj()!=null&&!"".equals(ki.getKch_jtsj()))
		   {
		 %>
		 <fieldset>
	     <legend style="font-weight: bold; ">结题时积分分配信息</legend>
		 <%
		  		if(ki.getKch_jtmember()!=null&&"".equals(ki.getKch_jtmember()))
		   		{
		%>
				结题时成员信息为空，无法分配积分！
	    <%
				}else
				{
		%>
		 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		 <tr>
	    <td width="10%" align="left" valign="middle" nowrap="nowrap">
		&nbsp;&nbsp;<input type="button" value="系统分配" class="button2" onClick="return checkzjf(3)">
		</td>	
	    </tr>
		 <tr>	
		<td width="8%" align="right" nowrap="nowrap">&nbsp;&nbsp;【结题时绩效总分】</td>
		<td align="left"> 
		    &nbsp;&nbsp;<input type="text" name="jtzongjifen" id="jtzongjifen" size="3" value="<%=jtzongjifen==0?"":jtzongjifen %>" />	   
	    </td>	
		</tr>
		 <%
		 	i=0;
			while(i<jtmcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<jtmcount;j++)
	    	{
	    		String token=(i==0?"负责人":"成员"+(i+1));
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=jtmemscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="jtjifen"+(i+1) %>" id="<%="jtjifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(jtmemscore[i][1])==0?"":jtmemscore[i][1] %>">
	    </td>
	    <%
	    	i++;
	    	}
	    %>	    
		 </tr>		
		 <%
	      }
	    %>
	   </table>
	   <%
	   	}
	   %>
	    </fieldset>
	   <%
	   	}else
	   	{
	   %>
	   	  <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	    <tr>
	     <td colspan="2">&nbsp;&nbsp;该课程目前还未结题！&nbsp;		    </td>
	    </tr>	
	    </TABLE>
	   
	   <%
	   	}
	   %>
		 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	    <tr>
	     <td colspan="2">&nbsp;		    </td>
	    </tr>
	    <tr>
		 <td colspan="2">&nbsp;		    </td>
	    </tr>

	    <tr>
			<td width="50%">			    
			   <div align="right">
			     <input name="save" type="submit" value="保存" class="button">		   
	           </div></td>
		    <td width="50%"  nowrap="nowrap">
		    	&nbsp;&nbsp;
				<input name="cancel" type="reset" value="取消"  class="button" onclick="javascript:window.location.href='../KechengServlet?action=cancel';">			    	    
		    </td>
	    </tr>
	    <tr>
		    <td colspan="2">&nbsp;		    </td>
	    </tr>
	    <tr>
		    <td colspan="2">&nbsp;		    </td>
	    </tr>
	    <tr>
		    <td colspan="2">&nbsp;		    </td>
	    </tr>
	     <tr>
		    <td colspan="2">&nbsp;		    </td>
	    </tr>		       
	</TABLE>		
	</form>
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