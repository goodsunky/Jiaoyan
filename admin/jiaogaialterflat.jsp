<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String id = (String)request.getParameter("id");
	Jiaogai_Info ji=(Jiaogai_Info)session.getAttribute("jidetail");
	String[][] lxmemscore = (String[][]) session.getAttribute("lxmemscore");
	String[][] jtmemscore = (String[][]) session.getAttribute("jtmemscore");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教改课题修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/validatenumber.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkjiaogaiform.js" charset="gb2312"></script>
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
		    for (Iterator<Jiaogaijifen_Info> it = jgjfis.iterator(); it.hasNext();)
			{
					Jiaogaijifen_Info initjgjf = it.next();	
		%>
		arrData[<%=i%>]=new Array("<%=initjgjf.getJgjf_khzb() %>","<%=initjgjf.getJgjf_zongjifen() %>");
		<% 
		i++;
		}
		%>
	    function chgjxzf()
		{	
		    var flag=0;
		    form.jxzf.value="";	
			for(var i=0;i<arrData.length;i++)
			{
				if(arrData[i][0]==form.ktlb.value)
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
<div class="box2" panelTitle="教改课题信息修改（注：带*号必填，若修改负责人或成员信息，则积分将被清零！）">	
	<br>
	<form name="form" method="post" action="../JiaogaiServlet?action=doalter&id=<%=ji.getJg_id() %>" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
	    <td width="7%" nowrap="nowrap">
		    <div align="right">档案号：		    </div>	    </td>
	    <td width="13%"  nowrap="nowrap">
	        <input name="danganhao" type="text" id="danganhao" size="10"  value="<%=ji.getJg_danganhao() %>">	    </td>
		<td width="8%"  nowrap="nowrap">
			<div align="right">课题名称*：			</div>		</td>
		<td width="22%" nowrap="nowrap">
			<div align="left">
				<input name="ktmc" type="text" id="ktmc" size="40" value="<%=ji.getJg_ktmc() %>">
			</div>		</td>
		<td width="6%" nowrap="nowrap">	  
		    <div align="right">负责人*：		    </div>		</td>
		<td width="44%" nowrap="nowrap">
			<div align="left">
			  <input name="fuzeren" type="text" id="fuzeren" size="10"  value="<%=ji.getJg_fuzeren() %>">
			</div>		</td>
	</tr>	
	<tr>
		<td nowrap="nowrap">
			<div align="right">立项时间*：			</div>		</td>
	    <td nowrap="nowrap"><select name="lxsjyear" id="lxsjyear">
	       <option value="">请选择</option>
          <%
 				String lxsj=ji.getJg_lxsj();		   
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
年<select name="lxsjmonth">
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
		          	String yjtsj=ji.getJg_yjtsj();	   
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
	    <td nowrap="nowrap">
	    	<div align="right">所在部门*：</div>	    </td>
	    <td nowrap="nowrap">
	    <select name="dept">
          <option value="" <%=null!=ji.getJg_dept_name()&&"".equals(ji.getJg_dept_name())?"selected":"" %>>--部门机构--</option>
          <%
			    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
				{
					Department_Info di = it.next();
					if(!di.getDept_name().equals(""))
					{		
			    %>
          <option value="<%=di.getDept_name() %>" <%=null!=ji.getJg_dept_name()&&di.getDept_name().equals(ji.getJg_dept_name())?"selected":"" %>><%=di.getDept_name() %></option>
          <%
          			}
               }
			    %>
        </select></td>
	   
		</tr>
	    <tr>
	     <td nowrap="nowrap">
	   		 <div align="right">课题类别*：</div>	    </td>
	    <td nowrap="nowrap">	 
	    <select name="ktlb" onchange="chgjxzf()">
          <option value="" <%=null!=ji.getJg_ktlb_name()&&"".equals(ji.getJg_ktlb_name())?"selected":"" %>>--课题类别--</option>
          <%
			    for (Iterator<Jiaogaijifen_Info> it = jgjfis.iterator(); it.hasNext();)
				{
					Jiaogaijifen_Info jgjfi = it.next();		
					if(!jgjfi.getJgjf_khzb().equals(""))
					{
			    %>
          <option value="<%=jgjfi.getJgjf_khzb() %>" <%=null!=ji.getJg_ktlb_name()&&jgjfi.getJgjf_khzb().equals(ji.getJg_ktlb_name())?"selected":"" %>><%=jgjfi.getJgjf_khzb() %></option>
          		<%}
			    }
			    %>
        </select>
        </td>	   
	    <td nowrap="nowrap">
		    <div align="right">绩效总分：</div>	    </td>
	    <td nowrap="nowrap"><input name="jxzf" type="text" id="jxzf" size="10"  value="<%=ji.getJg_jxzf()==0?"":ji.getJg_jxzf() %>" onblur="validate(this)"></td>
	     <td nowrap="nowrap">
		    <div align="right">经费（元）：		    </div>	    </td>
	    <td nowrap="nowrap"><input name="cost" type="text" id="cost" size="10"  value="<%=ji.getJg_cost()==0.0?"":ji.getJg_cost() %>"></td>
	    <td nowrap="nowrap">
		    <div align="right"></div>	    </td>
	    <td nowrap="nowrap">&nbsp;</td>
	    </tr>  	
		<tr>
	    <td nowrap="nowrap">
		    <div align="right">结题时间：		    </div>	    </td>
	    <td nowrap="nowrap"><select name="jtsjyear">
         <option value="">请选择</option>
          <%	
          		String jtsj=ji.getJg_jtsj();	
          		int jtsjyindex=0,jtsjyear=0;
				String jtsjstryear="",jtsjmonth="";	 
		    	if(jtsj!=null&&!jtsj.equals("")&&jtsj.contains("."))//有月
		    	{ 
		    		jtsjyindex=jtsj.indexOf(".");    	
		    		jtsjstryear=jtsj.substring(0,jtsjyindex);
		    		jtsjmonth=jtsj.substring(jtsjyindex+1,jtsjyindex+3);
		    		jtsjyear=Integer.parseInt(jtsjstryear);
		    	}else
		    		if(jtsj!=null&&!jtsj.equals("")&&jtsj.length()<5)//无月
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
		    	String mon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		mon="0"+m;
		    	else
		    		mon=String.valueOf(m);
		    %>
  <option value="<%=mon %>" <%=null!=jtsjmonth&&jtsjmonth.equals(mon)?"selected":"" %>><%=mon %></option>
  <%
		    }
		    %>
</select>
月 </td>
	    <td nowrap="nowrap">
		    <div align="right">立项评审专家：</div>	    </td>
	    <td nowrap="nowrap"><input name="lxzj" type="text" id="lxzj" size="10"  value="<%=ji.getJg_lxzj() %>"></td>
	    <td nowrap="nowrap">
		    <div align="right">结题评审专家：</div>	    </td>
	    <td nowrap="nowrap"><input name="jtzj" type="text" id="jtzj" size="10"  value="<%=ji.getJg_jtzj() %>"></td>
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
					int maxmems=7;
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
	    <td nowrap="nowrap"><div align="right">立项文号： </div></td>
	    <td colspan="5" nowrap="nowrap"><input name="lxwh" type="text" value="<%=ji.getJg_lxwh() %>" size="50" maxlength="200" onKeyDown="gbcount(this.form.lxwh,this.form.lxwhtotal,this.form.lxwhused,this.form.lxwhremain);" onKeyUp="gbcount(this.form.lxwh,this.form.lxwhtotal,this.form.lxwhused,this.form.lxwhremain);"/>
            <p>最多字数：
              <input disabled maxLength="4" name="lxwhtotal" size="3" value="100" class="inputtext"/>
              已用字数：
              <input disabled maxLength="4" name="lxwhused" size="3" value="0" class="inputtext"/>
              剩余字数：
              <input disabled maxLength="4" name="lxwhremain" size="3" value="100" class="inputtext"/>
          </td>
          </tr>
          <tr>
	    <td nowrap="nowrap"><div align="right">结题文号： </div></td>
	    <td nowrap="nowrap" colspan="5"><input name="jtwh" type="text" value="<%=ji.getJg_jtwh() %>" size="50" maxlength="200" onKeyDown="gbcount(this.form.jtwh,this.form.jtwhtotal,this.form.jtwhused,this.form.jtwhremain);" onKeyUp="gbcount(this.form.jtwh,this.form.jtwhtotal,this.form.jtwhused,this.form.jtwhremain);"/>
            <p>最多字数：
              <input disabled maxLength="4" name="jtwhtotal" size="3" value="100" class="inputtext"/>
              已用字数：
              <input disabled maxLength="4" name="jtwhused" size="3" value="0" class="inputtext"/>
              剩余字数：
              <input disabled maxLength="4" name="jtwhremain" size="3" value="100" class="inputtext"/>
        </td>
	    </tr>
	    <tr>
	    <td nowrap="nowrap">
	    	<div align="right">备注：	    	</div>	    </td>
	    <td colspan="5" nowrap="nowrap">
			<textarea name="remark" rows="8" wrap=PHYSICAL cols="50" onKeyDown="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);" onKeyUp="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);"><%=ji.getJg_remark() %></textarea>
			<p>最多字数：
			<input disabled maxLength="4" name="remarktotal" size="3" value="500" class="inputtext">
			已用字数：
			<input disabled maxLength="4" name="remarkused" size="3" value="0" class="inputtext">
			剩余字数：
			<input disabled maxLength="4" name="remarkremain" size="3" value="500" class="inputtext">
	    	<div align="right"></div><p></td>
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
				<input name="cancel" type="reset" value="取消" class="button" onclick="javascript:window.location.href='../JiaogaiServlet?action=cancel';">			    	    
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