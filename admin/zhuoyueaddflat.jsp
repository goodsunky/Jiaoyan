<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>卓越工程师和专业综合信息录入</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkzhuoyueform.js" charset="gb2312"></script>
<SCRIPT language=JavaScript type="text/javascript" src="../js/ESONCalendar.js" charset="gb2312"></SCRIPT>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';
</script>
<style type=text/css> <!-- CSS 内部样式表 --> 
.sec1 { 
background-color: #EEEEEE; 
cursor: hand; 
color: #000000; 
border-left: 0px solid #FFFFFF; 
border-top: 1px solid #FFFFFF; 
border-right: 1px solid gray; 
border-bottom: 1px solid #FFFFFF 
} 
.sec2 { 
background-color: #D4D0C8; 
cursor: hand; 
color: #000000; 
border-left: 0px solid #FFFFFF; 
border-top: 1px solid #FFFFFF; 
border-right: 1px solid gray; 
font-weight: bold; 
} 
.main_tab { 
background-color: #D4D0C8; 
color: #000000; 
border-left:0px solid #FFFFFF; 
border-right: 1px solid gray; 
border-bottom: 1px solid gray; 
} 
</style> 
<script language=javascript> 
function secBoard(n) 
{ 
for(i=0;i<secTable.cells.length;i++) 
secTable.cells[i].className="sec1"; 
secTable.cells[n].className="sec2"; 
for(i=0;i<mainTable.tBodies.length;i++) 
mainTable.tBodies[i].style.display="none"; 
mainTable.tBodies[n].style.display="block"; 
} 
</script> 

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="卓越工程师和专业综合信息录入（带*号必填）">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
			<td width="5%">&nbsp;&nbsp;&nbsp;&nbsp;<a  href="exportfile.jsp?type=ZhuoyueToMysql"  target="_blank" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )"><img alt="导入数据" border="0" src="../images/import.jpg"></a>
		    </td>
		    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="../upload/moban/zhuoyuemoban.xls" target="_blank"><u>模版</u></a></td>
		</tr>
	</table>
	<br>
	<form name="form" method="post" action="../ZhuoyueServlet?action=add" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
	    <td width="7%" nowrap="nowrap">
		    <div align="right">档案号：		    </div>	    </td>
	    <td width="13%"  nowrap="nowrap">
	        <input name="danganhao" type="text" id="danganhao" size="10" >	    </td>
		<td width="8%"  nowrap="nowrap">
			<div align="right">专业名称*：			</div>		</td>
		<td width="22%" nowrap="nowrap">
			<div align="left">
				<input name="zymc" type="text" id="zymc" size="30">
			</div>		</td>
		<td width="8%" nowrap="nowrap">	  
		    <div align="right">负责人*：		    </div>		</td>
		<td width="42%" nowrap="nowrap">
			<div align="left">
			  <input name="fuzeren" type="text" id="fuzeren" size="10" >
			</div>		
		</td>
	</tr>	
	<tr>
		<td nowrap="nowrap">
			<div align="right">立项时间*：</div>		</td>
	    <td nowrap="nowrap"><select name="lxsjyear">
	     <option value="">请选择</option>
          <%          		
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
          <option value="<%=y %>" ><%=y %></option>
          <%
		    }
		    %>
        </select>
年
<select name="lxsjmonth">
 <option value="">请选择</option>
  <%
		    	String lxsjmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		lxsjmon="0"+m;
		    	else
		    		lxsjmon=String.valueOf(m);
		    %>
  <option value="<%=lxsjmon %>" ><%=lxsjmon %></option>
  <%
		    }
		    %>
</select>
月</td>
		<td   nowrap="nowrap">
		    <div align="right">专业代码：		    </div>	    
		    </td>
	    <td nowrap="nowrap">
         	<input name="zydm" type="text" id="zydm" size="10" >
         </td>
		<td nowrap="nowrap"><div align="right">所在部门*：</div></td>
	    <td nowrap="nowrap"><select name="dept">
          <option value="">--部门机构--</option>
          <%
			    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
				{
					Department_Info di = it.next();		
					if(!di.getDept_name().equals(""))
					{
			    %>
          <option value="<%=di.getDept_name() %>"><%=di.getDept_name() %></option>
          <%
			    }}
			    %>
        </select></td>
	    
	</tr>
	    <tr>
	    		
<td nowrap="nowrap">
		    <div align="right">结题时间：</div>	    </td>
	    <td nowrap="nowrap"><select name="jtsjyear">
	     <option value="">请选择</option>
          <%		    	
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" ><%=y %></option>
          <%
		    }
		    %>
        </select>
年
<select name="jtsjmonth">
 <option value="">请选择</option>
  <%
		    	String jtsjmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		jtsjmon="0"+m;
		    	else
		    		jtsjmon=String.valueOf(m);
		    %>
  <option value="<%=jtsjmon %>" ><%=jtsjmon %></option>
  <%
		    }
		    %>
</select>
月</td>	    
        <td nowrap="nowrap"><div align="right">绩效总分*：</div></td>
	    <td nowrap="nowrap" colspan="3"><input name="jxzf" type="text" id="jxzf" size="10" ></td>
	    </tr>  	
		  	
		<tr>
	    <td nowrap="nowrap"><div align="right">项目成员：</div></td>
	    <td colspan="5" nowrap="nowrap" align="left">
	    	<table border=0 cellspacing=0 cellpadding=0 id=secTable width=549> 
				<tr height=20 align=center> 
				<td class=sec2 width=10% onclick="secBoard(0)">立项时成员</td> 
				<td class=sec1 width=10% onclick="secBoard(1)">结题时成员</td> 
				</tr> 
			</table> 
			<table border=0 cellspacing=0 cellpadding=0 id=mainTable class=main_tab width=549> 
				<tbody style="display:block;"> 
				<%
					String name="lxmember";
					int maxcount=10;
					int i=1;
					while(i<maxcount)
					{
				%>
				 <tr>
				    <td nowrap="nowrap"><div align="right">成员<%=i %>：</div></td>
				    <td><input name="<%=name+i %>" type="text" id="<%=name+i %>" size="5" ></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+1 %>：</div></td>
				    <td><input name="<%=name+i+1 %>" type="text" id="<%=name+i+1 %>" size="5" ></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+2 %>：</div></td>
				    <td><input name="<%=name+i+2 %>" type="text" id="<%=name+i+2 %>" size="5" ></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+3 %>：</div></td>
				    <td><input name="<%=name+i+3 %>" type="text" id="<%=name+i+3 %>" size="5" ></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+4 %>：</div></td>
				    <td><input name="<%=name+i+4 %>" type="text" id="<%=name+i+4 %>" size="5" ></td>
				</tr>
		 <%
		 			i=i+5;
					}
		 %>
		 <tr>		
	    <td><div align="right">成员<%=i %>：</div></td>
	    <td colspan="9"><input name="<%=name+i %>" type="text"  size="30" >（若有多个成员请用&隔开，如：张三&李四） </td>	  
		 </tr>
				</tbody> 
				<tbody style="display:none;"> 
				<%
					name="jtmember";
					i=1;
					while(i<maxcount)
					{
				%>
						 <tr>
						    <td nowrap="nowrap"><div align="right">成员<%=i %>：</div></td>
						    <td><input name="<%=name+i %>" type="text" id="<%=name+i %>" size="5" ></td>
						    <td nowrap="nowrap"><div align="right">成员<%=i+1 %>：</div></td>
						    <td><input name="<%=name+i+1 %>" type="text" id="<%=name+i+1 %>" size="5" ></td>
						    <td nowrap="nowrap"><div align="right">成员<%=i+2 %>：</div></td>
						    <td><input name="<%=name+i+2 %>" type="text" id="<%=name+i+2 %>" size="5" ></td>
						    <td nowrap="nowrap"><div align="right">成员<%=i+3 %>：</div></td>
						    <td><input name="<%=name+i+3 %>" type="text" id="<%=name+i+3 %>" size="5" ></td>
						    <td nowrap="nowrap"><div align="right">成员<%=i+4 %>：</div></td>
						    <td><input name="<%=name+i+4 %>" type="text" id="<%=name+i+4 %>" size="5" ></td>
						</tr>
				 <%
				 	i=i+5;
					}
				 %>
				 <tr>		
			    <td><div align="right">成员<%=i %>：</div></td>
			    <td colspan="9"><input name="<%=name+i %>" type="text"  size="30" >（若有多个成员请用&隔开，如：张三&李四） </td>	  
				 </tr>
				</tbody>
			</table> 
	    </td>
	    </tr>
		  
	    <tr>
	    <td nowrap="nowrap">
	    	<div align="right">备注：	    	</div>	    </td>
	    <td colspan="5" nowrap="nowrap">
			<textarea name="remark" rows="10" wrap=PHYSICAL cols="70" onKeyDown="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);" onKeyUp="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);"></textarea>
			<p>最多字数：
			<input disabled maxLength="4" name="remarktotal" size="2" value="500" class="inputtext">
			已用字数：
			<input disabled maxLength="4" name="remarkused" size="2" value="0" class="inputtext">
			剩余字数：
			<input disabled maxLength="4" name="remarkremain" size="2" value="500" class="inputtext">
	    	<div align="right"></div>	    	<p></td>
	    </tr>
   </table>
		 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	    <tr>
	     <td colspan="2">&nbsp;		    </td>
	    </tr>
	    <tr>
		 <td colspan="2">&nbsp;		    </td>
	    </tr>

	    <tr>
			<td width="42%">			    
			   <div align="right">
			     <input name="save" type="submit" value="保存" class="button">		   
	           </div></td>
		    <td width="58%"  nowrap="nowrap">
		    	&nbsp;&nbsp;
				<input name="cancel" type="reset" value="清空" class="button">			    	    
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
<script type="text/javascript"> 
	   ESONCalendar.bind("cksj");
	   ESONCalendar.bind("rksj");
</script>
<!--代码高亮end-->
</html>