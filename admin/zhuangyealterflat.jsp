<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	Zhuangye_Info zhyi=(Zhuangye_Info)session.getAttribute("zhyidetail");
	String id = (String)request.getParameter("id");
	String[][] lxmemscore = (String[][]) session.getAttribute("lxmemscore");
	String[][] jtmemscore = (String[][]) session.getAttribute("jtmemscore");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>专业与示范中心信息修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkzhuangyeform.js" charset="gb2312"></script>
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
		    for (Iterator<Zhuangyejifen_Info> it = zyjfis.iterator(); it.hasNext();)
			{
		    	Zhuangyejifen_Info initjgjf = it.next();	
		%>
		arrData[<%=i%>]=new Array("<%=initjgjf.getZyjf_khzb() %>","<%=initjgjf.getZyjf_zongjifen() %>");
		<% 
		i++;
		}
		%>
	    function chgjxzf()
		{	
		    var flag=0;
			for(var i=0;i<arrData.length;i++)
			{
				if(arrData[i][0]==form.xmlb.value)
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
<div class="box2" panelTitle="专业与示范中心信息修改（注：带*号必填，若修改申报人或成员信息，则积分将被清零！）">	
	<br>
	<form name="form" method="post" action="../ZhuangyeServlet?action=doalter&id=<%=id %>" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
	    <td width="7%" nowrap="nowrap">
		    <div align="right">档案号：		    </div>	    </td>
	    <td width="13%"  nowrap="nowrap">
	        <input name="danganhao" type="text" id="danganhao" size="10" value="<%=zhyi.getZhy_danganhao() %>">	    </td>
		<td width="8%"  nowrap="nowrap">
			<div align="right">项目名称*：			</div>		</td>
		<td width="22%" nowrap="nowrap">
			<div align="left">
				<input name="xmmc" type="text" id="xmmc" size="40" value="<%=zhyi.getZhy_xmmc() %>">
			</div>		</td>
		<td width="8%" nowrap="nowrap">	  
		    <div align="right">申报人*：		    </div>		</td>
		<td width="42%" nowrap="nowrap">
			<div align="left">
			  <input name="shenbaoren" type="text" id="shenbaoren" size="10" value="<%=zhyi.getZhy_shenbaoren() %>">
			</div>		</td>
	</tr>	
	<tr>
	<td nowrap="nowrap"><div align="right">立项时间*： </div></td>
		<td nowrap="nowrap"><select name="lxsjyear">
		<option value="">请选择</option>
          <%
		    	String lxsj=zhyi.getZhy_lxsj();  
		    	int lxsjyindex=0,lxsjyear=0;
				String lxsjstryear="",lxsjmonth="";	 
		    	if(lxsj!=null&&!lxsj.equals("")&&lxsj.contains("."))//有月
		    	{ 
		    		lxsjyindex=lxsj.indexOf(".");    	
		    		lxsjstryear=lxsj.substring(0,lxsjyindex);
		    		lxsjmonth=lxsj.substring(lxsjyindex+1,lxsjyindex+3);
		    		lxsjyear=Integer.parseInt(lxsjstryear);
		    	}else
		    		if(lxsj!=null&&!lxsj.equals("")&&lxsj.length()<5)//无月
		    		{		    			
		    			lxsjyear=Integer.parseInt(lxsj);
		    		}
		    	         		
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" <%=lxsjyear==y?"selected":"" %>><%=y %></option>
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
  <option value="<%=lxsjmon %>" <%=null!=lxsjmonth&&lxsjmonth.equals(lxsjmon)?"selected":"" %>><%=lxsjmon %></option>
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
		          	String yjtsj=zhyi.getZhy_yjtsj();   
	 				int yjtsjyindex=0,yjtsjyear=0;
					String yjtsjstryear="",yjtsjmonth="";	 
			    	if(yjtsj!=null&&!yjtsj.equals("")&&yjtsj.contains("."))//有月
			    	{ 
			    		yjtsjyindex=yjtsj.indexOf(".");    	
			    		yjtsjstryear=yjtsj.substring(0,yjtsjyindex);
			    		yjtsjmonth=yjtsj.substring(yjtsjyindex+1,yjtsjyindex+3);
			    		yjtsjyear=Integer.parseInt(yjtsjstryear);
			    	}else
			    		if(yjtsj!=null&&!yjtsj.equals("")&&yjtsj.length()<5)//无月
			    		{			    				
			    			yjtsjyear=Integer.parseInt(yjtsj);
			    		}
				    	for(int y=1990;y<2100;y++)
				    	{
				    %>
					 <option value="<%=y %>" <%=yjtsjyear==y?"selected":"" %>><%=y %></option>
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
		  <option value="<%=yjtmon %>" <%=null!=yjtsjmonth&&yjtsjmonth.equals(yjtmon)?"selected":"" %>><%=yjtmon %></option>
		  <%
				    }
				    %>
		</select>
		月 </td>     
		
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
          <option value="<%=di.getDept_name() %>" <%=null!=zhyi.getZhy_dept_name()&&di.getDept_name().equals(zhyi.getZhy_dept_name())?"selected":"" %>><%=di.getDept_name() %></option>
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
		    	String jtsj=zhyi.getZhy_jtsj();
		    	int jtsjyindex=0,jtsjyear=0;
				String jtsjstryear="",jtsjmonth="";	 
		    	if(jtsj!=null&&!jtsj.equals("")&&jtsj.contains("."))//有月
		    	{ 
		    		jtsjyindex=jtsj.indexOf(".");    	
		    		jtsjstryear=jtsj.substring(0,jtsjyindex);
		    		jtsjmonth=jtsj.substring(jtsjyindex+1,jtsjyindex+3);
		    		jtsjyear=Integer.parseInt(jtsjstryear);
		    	}else
		    		if(jtsj!=null&&!jtsj.equals("")&&jtsj.length()<5)  		
		    		{
		    			jtsjyear=Integer.parseInt(jtsj);
		    		}
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" <%=jtsjyear==y?"selected":"" %>><%=y %></option>
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
  <option value="<%=jtsjmon %>" <%=null!=jtsjmonth&&jtsjmonth.equals(jtsjmon)?"selected":"" %>><%=jtsjmon %></option>
  <%
		    }
		    %>
</select>
月</td>
<td nowrap="nowrap"><div align="right">项目类别*：</div></td>
		<td nowrap="nowrap">
		<select name="xmlb" onchange="chgjxzf()">
          <option value="" <%=null!=zhyi.getZhy_xmlb()&&"".equals(zhyi.getZhy_xmlb())?"selected":"" %>>--项目类别--</option>
          <%
			    for (Iterator<Zhuangyejifen_Info> it = zyjfis.iterator(); it.hasNext();)
				{
					Zhuangyejifen_Info zyjfi = it.next();		
					if(!zyjfi.getZyjf_khzb().equals(""))
					{
			    %>
          <option value="<%=zyjfi.getZyjf_khzb() %>" <%=null!=zhyi.getZhy_xmlb()&&zyjfi.getZyjf_khzb().equals(zhyi.getZhy_xmlb())?"selected":"" %>><%=zyjfi.getZyjf_khzb() %></option>
          		<%}
			    }
			    %>
        </select>		</td>
        <td nowrap="nowrap"><div align="right">绩效总分*：</div></td>
	    <td nowrap="nowrap"><input name="jxzf" type="text" id="jxzf" size="10" value="<%=zhyi.getZhy_jxzf()==0?"":zhyi.getZhy_jxzf() %>"></td>
	      	</tr>
		  	
		 <tr>
	    <td nowrap="nowrap"><div align="right">项目成员：</div></td>
	    <td colspan="5" nowrap="nowrap" align="left">
	    	<table border=0 cellspacing=0 cellpadding=0 id=secTable width=549> 
				<tr height=20 align=center> 
				<td class=sec2 width=10% onClick="secBoard(0)">立项时成员</td> 
				<td class=sec1 width=10% onClick="secBoard(1)">结题时成员</td> 
				</tr> 
			</table> 
			<table border=0 cellspacing=0 cellpadding=0 id=mainTable class=main_tab width=549> 
				<tbody style="display:block;"> 
				 <%
					String name="lxmember",remain="";
					int maxmems=10;
					i=1;
					int len = lxmemscore!=null?lxmemscore.length:0;
					while(i<maxmems)
					{
				%>
				 <tr>
				    <td nowrap="nowrap"><div align="right">成员<%=i %>：</div></td>
				    <td><input name="<%=name+i %>" type="text" id="<%=name+i %>" size="5" value="<%=(i-1)<len?lxmemscore[i-1][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+1 %>：</div></td>
				    <td><input name="<%=name+(i+1) %>" type="text" id="<%=name+(i+1) %>" size="5" value="<%=i<len?lxmemscore[i][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+2 %>：</div></td>
				    <td><input name="<%=name+(i+2) %>" type="text" id="<%=name+(i+2) %>" size="5" value="<%=(i+1)<len?lxmemscore[i+1][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+3 %>：</div></td>
				    <td><input name="<%=name+(i+3) %>" type="text" id="<%=name+(i+3) %>" size="5" value="<%=(i+2)<len?lxmemscore[i+2][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+4 %>：</div></td>
				    <td><input name="<%=name+(i+4) %>" type="text" id="<%=name+(i+4) %>" size="5" value="<%=(i+3)<len?lxmemscore[i+3][0]:""%>"></td>
				</tr>
				 <%
		 			i = i + 5;
					}
					if(len > maxmems)
					{
						int j = maxmems;
						while(j < len)
							remain += lxmemscore[j++][0] + "&";
					}
				 %>
				 <tr>		
				    <td><div align="right">成员<%=i %>：</div></td>
				    <td colspan="9"><input name="<%=name+i %>" type="text"  size="30" value="<%=remain %>">（若有多个成员请用&隔开，如：张三&李四） </td>	  
				</tr>
				</tbody> 
				<tbody style="display:none;"> 
				  <%
					name="jtmember";
					remain="";
					i=1;
					len = jtmemscore!=null?jtmemscore.length:0;
					while(i<maxmems)
					{
				%>
				 <tr>
				    <td nowrap="nowrap"><div align="right">成员<%=i %>：</div></td>
				    <td><input name="<%=name+i %>" type="text" id="<%=name+i %>" size="5" value="<%=(i-1)<len?jtmemscore[i-1][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+1 %>：</div></td>
				    <td><input name="<%=name+(i+1) %>" type="text" id="<%=name+(i+1) %>" size="5" value="<%=i<len?jtmemscore[i][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+2 %>：</div></td>
				    <td><input name="<%=name+(i+2) %>" type="text" id="<%=name+(i+2) %>" size="5" value="<%=(i+1)<len?jtmemscore[i+1][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+3 %>：</div></td>
				    <td><input name="<%=name+(i+3) %>" type="text" id="<%=name+(i+3) %>" size="5" value="<%=(i+2)<len?jtmemscore[i+2][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+4 %>：</div></td>
				    <td><input name="<%=name+(i+4) %>" type="text" id="<%=name+(i+4) %>" size="5" value="<%=(i+3)<len?jtmemscore[i+3][0]:""%>"></td>
				</tr>
				 <%
		 			i = i + 5;
					}
					if(len > maxmems)
					{
						int j = maxmems;
						while(j < len)
							remain += jtmemscore[j++][0] + "&";
					}
				 %>
				 <tr>		
				    <td><div align="right">成员<%=i %>：</div></td>
				    <td colspan="9"><input name="<%=name+i %>" type="text"  size="30" value="<%=remain %>">（若有多个成员请用&隔开，如：张三&李四） </td>	  
				</tr>
				</tbody>
			</table> 
	    </td>
	    </tr>
		  
	    <tr>
	    <td nowrap="nowrap">
	    	<div align="right">备注：	    	</div>	    </td>
	    <td colspan="5" nowrap="nowrap">
			<textarea name="remark" rows="10" wrap=PHYSICAL cols="70" onKeyDown="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);" onKeyUp="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);"><%=zhyi.getZhy_remark() %></textarea>
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
				<input name="cancel" type="reset" value="取消" class="button" onclick="javascript:window.location.href='../ZhuangyeServlet?action=cancel';">			    	    
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