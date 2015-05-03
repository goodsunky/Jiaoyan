<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程信息录入</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/validatenumber.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkkechengform.js" charset="gb2312"></script>
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

<script type="text/javascript">
	    var arrData=new Array();
	    <% 
			int i=0;
		    for (Iterator<Kechengjifen_Info> it = kcjfis.iterator(); it.hasNext();)
			{
					Kechengjifen_Info initjgjf = it.next();	
		%>
		arrData[<%=i%>]=new Array("<%=initjgjf.getKcjf_khzb() %>","<%=initjgjf.getKcjf_zongjifen() %>");
		<% 
		i++;
		}
		%>
	    function chgjxzf()
		{	
		    var flag=0;
			for(var i=0;i<arrData.length;i++)
			{
				if(arrData[i][0]==form.kcjb.value)
				{  
					form.jxzf.value=arrData[i][1];
					flag=1;		   
				}
			}
			if(flag==0)
				form.jxzf.value="";	
		}
</script>	
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="课程信息录入（带*号必填）">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
			<td width="5%">
			   	 &nbsp;&nbsp;&nbsp;&nbsp;<a  href="exportfile.jsp?type=KechengToMysql"  target="_blank" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )"><img alt="导入数据" border="0" src="../images/import.jpg"></a>       
	      </td>
	      <td align="left">
	      		&nbsp;&nbsp;&nbsp;&nbsp;<a href="../upload/moban/kechengmoban.xls" target="_blank"><u>模版</u></a>
	      </td>
		</tr>
	</table>
	<br>
	<form name="form" method="post" action="../KechengServlet?action=add" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>		
	    <td width="9%" nowrap="nowrap">
		    <div align="right">档案号：		    </div>	    </td>
	    <td width="18%"  nowrap="nowrap">
	        <input name="danganhao" type="text" id="danganhao" size="10" >	    </td>
		<td width="7%"  nowrap="nowrap">
			<div align="right">课程名称*：			</div>		</td>
		<td width="17%" nowrap="nowrap" align="left">
			<input name="kcmc" type="text" id="kcmc" size="22" >			</td>
		<td width="5%" nowrap="nowrap">	  
		    <div align="right">负责人*：		    </div>		</td>
		<td width="44%" nowrap="nowrap">
			<div align="left">
			  <input name="fuzeren" type="text" id="fuzeren" size="10" >
			</div>		</td>
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
		    <div align="right">预结题时间：		    </div>	    </td>
	    <td nowrap="nowrap"><select name="yjtsjyear">
         <option value="">请选择</option>
          <%
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>"><%=y %></option>
          <%
		    }
		    %>			
        </select>
年
<select name="yjtsjmonth">
<option value="">请选择</option>
  <%
		    	String yjtmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		yjtmon="0"+m;
		    	else
		    		yjtmon=String.valueOf(m);
		    %>
  <option value="<%=yjtmon %>"><%=yjtmon %></option>
  <%
		    }
		    %>
</select>
月 </td>
	    <td nowrap="nowrap">
	    	<div align="right">所在部门*：</div>	    </td>
	    <td nowrap="nowrap"><select name="dept">
          <option value="">--部门机构--</option>
          <%
			    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
				{
					Department_Info di = it.next();		
					if(!di.getDept_name().equals(""))
					{
			    %>
          <option value="<%=di.getDept_name() %>" ><%=di.getDept_name() %></option>
          <%}
			    }
			    %>
        </select></td>	    
	</tr>
	    <tr>
	    <td nowrap="nowrap">
	   		 <div align="right">课程级别*：</div>	    </td>
	    <td nowrap="nowrap">
	   <select name="kcjb" onChange="chgjxzf()">
          <option value="">--课程级别--</option>
          <%
			    for (Iterator<Kechengjifen_Info> it = kcjfis.iterator(); it.hasNext();)
				{
			    	Kechengjifen_Info kcjfi = it.next();		
					if(!kcjfi.getKcjf_khzb().equals(""))
					{
			    %>
          <option value="<%=kcjfi.getKcjf_khzb() %>" ><%=kcjfi.getKcjf_khzb() %></option>
          		<%
			    }}
			    %>
        </select>	
	    </td>		
	    <td nowrap="nowrap">		    
		      <div align="right">绩效总分*：</div></td>
	        <td nowrap="nowrap"><input name="jxzf" type="text" id="jxzf" size="10" maxlength="5"></td>
	    <td nowrap="nowrap">
		    <div align="right">结题情况：		    </div>	    </td>
	    <td nowrap="nowrap"><input name=jtqk type="text" id="jtqk" size="10" ></td>
	     
	    
	    
	    </tr>  
		<tr>
	    <td nowrap="nowrap"><div align="right">中检时间：</div></td>
	    <td nowrap="nowrap">
	      <div align="left">
	        <select name="zjsjyear">
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
	        <select name="zjsjmonth">
	         <option value="">请选择</option>
	          <%
		    	String zjsjmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		zjsjmon="0"+m;
		    	else
		    		zjsjmon=String.valueOf(m);
		    %>
	          <option value="<%=zjsjmon %>" ><%=zjsjmon %></option>
	          <%
		    }
		    %>
	          </select>
	        月</div></td>
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
 <td nowrap="nowrap">
		    <div align="right">授奖时间：</div>	    </td>
	    <td nowrap="nowrap"><input name="sjsj" type="text" id="sjsj" size="10" ></td>
	  
		</tr>  	
		<tr>
		 <td nowrap="nowrap"><div align="right">立项评审专家：</div></td>
	    <td nowrap="nowrap"><input name="lxzj" type="text" id="lxzj" size="20" >
		    <div align="right"></div></td>
	    <td nowrap="nowrap"><div align="right">结题专家：</div></td>
	    <td nowrap="nowrap">
	      <div align="left">
	        <input name="jtzj" type="text" id="jtzj" size="20" >
	        </div></td>
	    <td nowrap="nowrap"><div align="right">中检专家：</div></td>
	    <td nowrap="nowrap"><input name="zjzj" type="text" id="zjzj" size="20" ></td>
	    <td width="0%" nowrap="nowrap">&nbsp;		    </td>
	    <td width="0%" nowrap="nowrap">&nbsp;</td>
		</tr>  	
		<tr>
	    <td nowrap="nowrap"><div align="right">项目成员：</div></td>
	    <td colspan="5" nowrap="nowrap" align="left">
	    	<table border=0 cellspacing=0 cellpadding=0 id=secTable width=549> 
				<tr height=20 align=center> 
				<td class=sec2 width=10% onClick="secBoard(0)">立项时成员</td> 
				<td class=sec1 width=10% onClick="secBoard(1)">中检时成员</td> 
				<td class=sec1 width=10% onClick="secBoard(2)">结题时成员</td> 
				</tr> 
			</table> 
			<table border=0 cellspacing=0 cellpadding=0 id=mainTable class=main_tab width=549> 
				<tbody style="display:block;"> 
				<%
					String name="lxmember";
					int maxcount=10;
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
				<tbody style="display:none;"> 
				<%
					name="zjmember";
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
	    </table>
		 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		 <tr>
		<td width="9%" nowrap="nowrap"><div align="right">立项文号： </div></td>
	    <td width="34%" nowrap="nowrap"><input name="lxwh"  type="text" size="50" maxlength="200" onKeyDown="gbcount(this.form.lxwh,this.form.lxwhtotal,this.form.lxwhused,this.form.lxwhremain);" onKeyUp="gbcount(this.form.lxwh,this.form.lxwhtotal,this.form.lxwhused,this.form.lxwhremain);"/>
            <p>最多字数：
              <input disabled maxLength="4" name="lxwhtotal" size="3" value="100" class="inputtext"/>
              已用字数：
              <input disabled maxLength="4" name="lxwhused" size="3" value="0" class="inputtext"/>
              剩余字数：
              <input disabled maxLength="4" name="lxwhremain" size="3" value="100" class="inputtext"/>
            </td>
	    <td width="6%" nowrap="nowrap"><div align="right">结题文号：</div></td>
	    <td width="51%" nowrap="nowrap"><input name="jtwh"  type="text" size="50" maxlength="200" onKeyDown="gbcount(this.form.jtwh,this.form.jtwhtotal,this.form.jtwhused,this.form.jtwhremain);" onKeyUp="gbcount(this.form.jtwh,this.form.jtwhtotal,this.form.jtwhused,this.form.jtwhremain);"/>
          <p>最多字数：
            <input disabled maxLength="4" name="jtwhtotal" size="1" value="100" class="inputtext"/>
            已用字数：
  <input disabled maxLength="4" name="jtwhused" size="1" value="0" class="inputtext"/>
            剩余字数：
  <input disabled maxLength="4" name="jtwhremain" size="1" value="100" class="inputtext"/>
          </td>
		 </tr>
		<tr>
		<td nowrap="nowrap"><div align="right">中期检查情况：</div></td>
		<td nowrap="nowrap"><p>
		  <input name="zjqk" type="text" size="50"  maxlength="200" onKeyDown="gbcount(this.form.zjqk,this.form.zjqktotal,this.form.zjqkused,this.form.zjqkremain);" onKeyUp="gbcount(this.form.zjqk,this.form.zjqktotal,this.form.zjqkused,this.form.zjqkremain);"/>
          <p>最多字数：
            <input disabled maxLength="4" name="zjqktotal" size="1" value="100" class="inputtext"/>
            已用字数：
  <input disabled maxLength="4" name="zjqkused" size="1" value="0" class="inputtext"/>
            剩余字数：
  <input disabled maxLength="4" name="zjqkremain" size="1" value="100" class="inputtext"/>
          </td>
        <td nowrap="nowrap"><div align="right">中检意见：</div></td>
        <td nowrap="nowrap"><input name="zjyj"  type="text" size="50" maxlength="200" onKeyDown="gbcount(this.form.zjyj,this.form.zjyjtotal,this.form.zjyjused,this.form.zjyjremain);" onKeyUp="gbcount(this.form.zjyj,this.form.zjyjtotal,this.form.zjyjused,this.form.zjyjremain);"/>
          <p>最多字数：
            <input disabled maxLength="4" name="zjyjtotal" size="1" value="120" class="inputtext"/>
            已用字数：
  <input disabled maxLength="4" name="zjyjused" size="1" value="0" class="inputtext"/>
            剩余字数：
  <input disabled maxLength="4" name="zjyjremain" size="1" value="120" class="inputtext"/>
          </td>
		</tr>
	    <tr>
		<td nowrap="nowrap"><div align="right">结题意见：</div></td>
	    <td colspan="3" nowrap="nowrap"><p>
	      <input name="jtyj" type="text" size="50"  maxlength="200" onKeyDown="gbcount(this.form.jtyj,this.form.jtyjtotal,this.form.jtyjused,this.form.jtyjremain);" onKeyUp="gbcount(this.form.jtyj,this.form.jtyjtotal,this.form.jtyjused,this.form.jtyjremain);"/>
          <p>最多字数：
            <input disabled maxLength="4" name="jtyjtotal" size="1" value="120" class="inputtext"/>
            已用字数：
  <input disabled maxLength="4" name="jtyjused" size="1" value="0" class="inputtext"/>
            剩余字数：
  <input disabled maxLength="4" name="jtyjremain" size="1" value="120" class="inputtext"/>
          </td>
	    </tr>
	    
	    <tr>
		<td height="151">
	    	<div align="right">备注：	    	</div></td>
	    <td colspan="3" nowrap="nowrap">
			<textarea name="remark" rows="10" wrap=PHYSICAL cols="50" onKeyDown="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);" onKeyUp="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);"></textarea>
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
			<td>
			    <div align="right">
			    	<input name="save" type="submit" value="保存" class="button">
		    </div></td>
		    <td nowrap="nowrap">
			    <div align="left">&nbsp;&nbsp;
			    	<input name="cancel" type="reset" value="清空" class="button">
			    </div>		    </td>
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