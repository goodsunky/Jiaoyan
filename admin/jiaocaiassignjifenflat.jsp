<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	Jiaocai_Info ji=(Jiaocai_Info)session.getAttribute("jcidetail");
	String id = (String)request.getParameter("id");
	String[][] zbscore = CommonUtil.splitMemScore(ji.getJc_zhubian());
	String[][] fzbscore = CommonUtil.splitMemScore(ji.getJc_fuzhubian());
	String[][] cbscore = CommonUtil.splitMemScore(ji.getJc_member());
	int zbmcount=zbscore!=null?zbscore.length:0,fzbmcount=fzbscore!=null?fzbscore.length:0,cbmcount = cbscore!=null?cbscore.length:0;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教材积分分配</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkjiaocaijifenform.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';
</script>

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="教材积分分配" panelWidth="100%">	
	<br>
	<form name="form" method="post" action="../JiaocaiServlet?action=doassign&id=<%=id %>" onSubmit="return checkdata(<%=zbmcount %>,<%=fzbmcount %>,<%=cbmcount %>,<%=ji.getJc_jxzf() %>)">
	<input type="hidden" name="id" value="<%=id %>"/>
	<fieldset>
	    <legend style="font-weight: bold; ">基本资料</legend>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>	    
		<td width="18%"  nowrap="nowrap">
			<div align="left">
			【教材名称】<%=ji.getJc_jcmc() %>			
			</div>		
		</td>	
		<td width="18%" nowrap="nowrap">
		    <div align="left">
		         【教材类别】<%=ji.getJc_jclb() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		        【绩效总分】<%=ji.getJc_jxzf() %>
		   </div>	   
	    </td>
	    <td width="18%" nowrap="nowrap">
		    <div align="left">
		       <input type="button" value="一键分配" class="button2" onClick="javascript:window.location.href='../JiaocaiServlet?action=onekeyassign&id=<%=id %>'">
		   </div>	   
	    </td>	
	    </tr>
	    </table>
	    </fieldset>
	    <br>
	    <%
		   if(ji.getJc_cbsj()!=null&&!"".equals(ji.getJc_cbsj()))
		   {
		 %>
		 <fieldset>
	     <legend style="font-weight: bold; ">成员积分分配信息</legend>
		 <%
		  		if(ji!=null&&("".equals(ji.getJc_zhubian())&&"".equals(ji.getJc_fuzhubian())&&"".equals(ji.getJc_member())))
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
		    &nbsp;&nbsp;<input type="text" name="zongjifen" id="zongjifen" size="3" value="<%=ji.getJc_jxzf()==0?"":ji.getJc_jxzf() %>" />	   
	    </td>
		</tr>
		 <%
		 	int i=0;
			while(i<zbmcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<zbmcount;j++)
	    	{
	    		String token="主编"+(i+1);
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=zbscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="zhubianjifen"+(i+1) %>" id="<%="zhubianjifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(zbscore[i][1])==0?"":zbscore[i][1] %>">
	    </td>
	    <%
	    	i++;
	    	}
	    %>	    
		 </tr>		
		 <%
	      }
	    %>
	    <%
		 	i=0;
			while(i<fzbmcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<fzbmcount;j++)
	    	{
	    		String token="副主编"+(i+1);
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=fzbscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="fuzhubianjifen"+(i+1) %>" id="<%="fuzhubianjifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(fzbscore[i][1])==0?"":fzbscore[i][1] %>">
	    </td>
	    <%
	    	i++;
	    	}
	    %>	    
		 </tr>		
		 <%
	      }
	    %>
	    <%
		 	i=0;
			while(i<cbmcount)
			{		
	     %>
	    <tr>
	    <%
	    	for(int j=0;j<5&&i<cbmcount;j++)
	    	{
	    		String token="参编"+(i+1);
	    %>	    
	    <td nowrap="nowrap" align="right" width="8%"><%=token %>：<%=cbscore[i][0] %></td>
	    <td nowrap="nowrap" align="left">
	    &nbsp;&nbsp;<input name="<%="canbianjifen"+(i+1) %>" id="<%="canbianjifen"+(i+1) %>" type="text"  size="3" value="<%=Float.parseFloat(cbscore[i][1])==0?"":cbscore[i][1] %>">
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
				<input name="cancel" type="reset" value="取消"  class="button" onclick="javascript:window.location.href='../JiaocaiServlet?action=cancel';">			    	    
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