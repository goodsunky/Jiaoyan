<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String id = (String)request.getParameter("id");
	Lunwen_Info lwi=(Lunwen_Info)session.getAttribute("lwidetail");
	String[][] memscore = (String[][]) session.getAttribute("memscore");
	Float zongjifen = (Float) session.getAttribute("zongjifen");
	
	int mcount = memscore!=null?memscore.length:0;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>论文积分分配</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
<script type="text/javascript" src="../js/checklunwenjifenform.js" charset="gb2312"></script>
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';     
</script>

</head>
<body style="margin:0px auto;">
<div id="container">
<div id="content">
<div class="box2" panelTitle="论文、论著、标准或画册等积分分配" panelWidth="100%">
	<br>
	<form name="form" method="post" action="../LunwenServlet?action=doassign&id=<%=id %>" onSubmit="return checkdata(<%=mcount %>,<%=lwi.getLw_jxzf() %>)">
	<input name="id" type="hidden" value="<%=id %>"/>
	<fieldset>
	    <legend style="font-weight: bold; ">基本资料</legend>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>	    
		<td width="12%"  nowrap="nowrap">
			<div align="left">
			【名称】<%=lwi.getLw_lwmc() %>			
			</div>		
		</td>	
		<td width="18%" nowrap="nowrap">
		    <div align="left">
		         【收录情况】<%=lwi.getLw_slqk() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		         【承担单位排名】<%=lwi.getLw_dwpm() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		         【绩效总分】<%=lwi.getLw_jxzf() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		        <input type="button" value="一键分配" class="button2" onClick="javascript:window.location.href='../LunwenServlet?action=onekeyassign&id=<%=id %>'">
		   </div>	   
	    </td>	
	    </tr>
	    </table>
	  </fieldset>
	  <br/>
	   <%
		   if(lwi.getLw_cbsj()!=null&&!"".equals(lwi.getLw_cbsj()))
		   {
		 %>
		 <fieldset>
	     <legend style="font-weight: bold; ">成员积分分配信息</legend>
		 <%
		  		if(lwi.getLw_member()!=null&&"".equals(lwi.getLw_member()))
		   		{
		%>
				成员信息为空，无法分配积分！
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
		<td align="right" nowrap="nowrap" width="8%">&nbsp;&nbsp;【绩效总分】</td>
		<td align="left">
		    &nbsp;&nbsp;<input type="text" name="zongjifen" id="zongjifen" size="3" value="<%=zongjifen==0?"":zongjifen %>" />	   
	    </td>
		</tr>
		 <%
		 	int i=0;
			while(i<mcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<mcount;j++)
	    	{
	    		String token="成员"+(i+1);
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=memscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="jifen"+(i+1) %>" id="<%="jifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(memscore[i][1])==0?"":memscore[i][1] %>">
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
				<input name="cancel" type="reset" value="取消"  class="button" onClick="javascript:window.location.href='../LunwenServlet?action=cancel';">			    	    
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