<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String id = (String)request.getParameter("id");
	Keyanxm_Info kyxmi=(Keyanxm_Info)session.getAttribute("kyxmidetail");
	String[][] lxmemscore = (String[][]) session.getAttribute("lxmemscore");
	String[][] zjmemscore = (String[][]) session.getAttribute("zjmemscore");
	String[][] jtmemscore = (String[][]) session.getAttribute("jtmemscore");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>科研项目信息修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/validatenumber.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkkeyanxmform.js" charset="gb2312"></script>
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
		    for (Iterator<Keyanxmjifen_Info> it = kyxmjfis.iterator(); it.hasNext();)
			{
					Keyanxmjifen_Info initjgjf = it.next();	
		%>
		arrData[<%=i%>]=new Array("<%=initjgjf.getKyxmjf_khzb() %>","<%=initjgjf.getKyxmjf_zongjifen() %>");
		<% 
		i++;
		}
		%>
	    function chgjxzf()
		{	
		    var flag=0;
			for(var i=0;i<arrData.length;i++)
			{
				if(arrData[i][0]==form.kylx.value)
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
<div class="box2" panelTitle="科研项目信息修改（注：带*号必填，若修改负责人或成员信息，则积分将被清零！）">
	<br>
	<form name="form" method="post" action="../KeyanxmServlet?action=doalter&id=<%=id %>" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>		
	    <td width="9%" nowrap="nowrap">
		    <div align="right">档案号：		    </div>	    </td>
	    <td width="24%"  nowrap="nowrap">
	        <input name="danganhao" type="text" id="danganhao" size="10" value="<%=kyxmi.getKy_danganhao() %>">	    </td>
		<td width="8%"  nowrap="nowrap">
			<div align="right">项目名称*：			</div>		</td>
		<td width="26%" nowrap="nowrap" align="left">
			<input name="xmmc" type="text" id="xmmc" size="15" value="<%=kyxmi.getKy_xmmc() %>">			</td>
		<td width="8%" nowrap="nowrap">	  
		    <div align="right">项目负责人*：		    </div>		</td>
		<td width="25%" nowrap="nowrap">
			<div align="left">
			  <input name="fuzeren" type="text" id="fuzeren" size="10" value="<%=kyxmi.getKy_fuzeren() %>">
			</div>		</td>
	</tr>	
	<tr>
		
		<td nowrap="nowrap">
			<div align="right">立项时间*：</div>		</td>
	    <td nowrap="nowrap"><select name="lxsjyear">
	     <option value="">请选择</option>
          <%
          		String lxsj=kyxmi.getKy_lxsj();	   
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
          <option value="<%=di.getDept_name() %>" <%=null!=kyxmi.getKy_dept_name()&&di.getDept_name().equals(kyxmi.getKy_dept_name())?"selected":"" %>><%=di.getDept_name() %></option>
          <%}
			    }
			    %>
        </select></td>
	    <td nowrap="nowrap">
	   		 <div align="right">科研类型：</div>	    </td>
	    <td nowrap="nowrap">
	   <select name="kylx" onChange="chgjxzf()">
          <option value="">--科研类型--</option>
          <%
			    for (Iterator<Keyanxmjifen_Info> it = kyxmjfis.iterator(); it.hasNext();)
				{
			    	Keyanxmjifen_Info kcjfi = it.next();		
					if(!kcjfi.getKyxmjf_khzb().equals(""))
					{
			    %>
          <option value="<%=kcjfi.getKyxmjf_khzb() %>" <%=null!=kyxmi.getKy_kylx()&&kcjfi.getKyxmjf_khzb().equals(kyxmi.getKy_kylx())?"selected":"" %>><%=kcjfi.getKyxmjf_khzb() %></option>
          		<%
			    }}
			    %>
        </select>	
	    </td>
	</tr>
	    <tr>	
	    <td nowrap="nowrap"><div align="right">中检时间：</div></td>
	    <td nowrap="nowrap">
	      <div align="left">
	        <select name="zjsjyear">
	         <option value="">请选择</option>
	         <%
		    	String zjsj=kyxmi.getKy_zjsj();	
		    	int zjsjyindex=0,zjsjyear=0;
				String zjsjstryear="",zjsjmonth="";	     
		    	if(zjsj!=null&&!zjsj.equals("")&&zjsj.contains("."))
		    	{ 
		    		zjsjyindex=zjsj.indexOf(".");    	
		    		zjsjstryear=zjsj.substring(0,zjsjyindex);
		    		zjsjmonth=zjsj.substring(zjsjyindex+1,zjsjyindex+3);
		    		zjsjyear=Integer.parseInt(zjsjstryear);
		    	}else
		    		if(zjsj!=null&&!zjsj.equals("")&&zjsj.length()<5)  		
		    		{
		    			zjsjyear=Integer.parseInt(zjsj);
		    		}          		
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" <%=zjsjyear==y?"selected":"" %>><%=y %></option>
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
	          <option value="<%=zjsjmon %>" <%=null!=zjsjmonth&&zjsjmonth.equals(zjsjmon)?"selected":"" %>><%=zjsjmon %></option>
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
		    	String jtsj=kyxmi.getKy_jtsj();	    
		    	int jtsjyindex=0,jtsjyear=0;
				String jtsjstryear="",jtsjmonth="";	 
		    	if(jtsj!=null&&!jtsj.equals("")&&jtsj.contains("."))
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
	     <td nowrap="nowrap">
		      <div align="right">绩效总分*：</div></td>
	        <td nowrap="nowrap"><input name="jxzf" type="text" id="jxzf" size="10" maxlength="5" value="<%=kyxmi.getKy_jxzf() %>"></td>
	    </tr> 
		<tr>
		 <td nowrap="nowrap">
			<div align="right">承担单位排名*：</div>		</td>
		<td nowrap="nowrap"><select name="dwpm">
	     <option value="">请选择</option>
          <%
          		int max=4;
          		String order="";
		    	for(int s=1;s<=3;s++)
		    	{
		    	order="第"+s;
		    %>
          <option value="<%=order %>" <%=String.valueOf(order).equals(kyxmi.getKy_dwpm())?"selected":"" %>><%=order %></option>
          <%
		    }
		    order="第"+max+"及以后";
		    %>
		  <option value="<%=order %>" <%=String.valueOf(order).equals(kyxmi.getKy_dwpm())?"selected":"" %>><%=order %></option>
        </select>
        </td>
        <td nowrap="nowrap">		    
		    <div align="right">经费（万元）：</div></td>
	    <td nowrap="nowrap"><input name="kyjf" type="text" id="kyjf" size="10" value="<%=kyxmi.getKy_kyjf() %>"></td>
	    <td nowrap="nowrap">
		    <div align="right">经费到账时间：</div>	    </td>
	    <td nowrap="nowrap"><select name="dzsjyear">
	     <option value="">请选择</option>
          <%
		    	String dzsj=kyxmi.getKy_dzsj();	    
		    	int dzsjyindex=0,dzsjyear=0;
				String dzsjstryear="",dzsjmonth="";	 
		    	if(dzsj!=null&&!dzsj.equals("")&&dzsj.contains("."))
		    	{ 
		    		dzsjyindex=dzsj.indexOf(".");    	
		    		dzsjstryear=dzsj.substring(0,dzsjyindex);
		    		dzsjmonth=dzsj.substring(dzsjyindex+1,dzsjyindex+3);
		    		dzsjyear=Integer.parseInt(dzsjstryear);
		    	}else
		    		if(dzsj!=null&&!dzsj.equals("")&&dzsj.length()<5)  		
		    		{
		    			dzsjyear=Integer.parseInt(dzsj);
		    		}
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" <%=dzsjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
年
<select name="dzsjmonth">
 <option value="">请选择</option>
  <%
		    	String dzsjmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		dzsjmon="0"+m;
		    	else
		    		dzsjmon=String.valueOf(m);
		    %>
  <option value="<%=dzsjmon %>" <%=null!=dzsjmonth&&dzsjmonth.equals(dzsjmon)?"selected":"" %>><%=dzsjmon %></option>
  <%
		    }
		    %>
</select>
月</td>
		</tr>
		<tr>	
	    <td nowrap="nowrap"><div align="right">项目开始时间：</div></td>
	    <td nowrap="nowrap">
	      <div align="left">
	        <select name="kssjyear">
	         <option value="">请选择</option>
	         <%
		    	String kssj=kyxmi.getKy_kssj();	
		    	int kssjyindex=0,kssjyear=0;
				String kssjstryear="",kssjmonth="";	     
		    	if(kssj!=null&&!kssj.equals("")&&kssj.contains("."))
		    	{ 
		    		kssjyindex=kssj.indexOf(".");    	
		    		kssjstryear=kssj.substring(0,kssjyindex);
		    		kssjmonth=kssj.substring(kssjyindex+1,kssjyindex+3);
		    		kssjyear=Integer.parseInt(kssjstryear);
		    	}else
		    		if(kssj!=null&&!kssj.equals("")&&kssj.length()<5)  		
		    		{
		    			kssjyear=Integer.parseInt(kssj);
		    		}          		
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" <%=kssjyear==y?"selected":"" %>><%=y %></option>
	          <%
		    }
		    %>
	          </select>
	        年
	        <select name="kssjmonth">
	         <option value="">请选择</option>
	          <%
		    	String kssjmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		kssjmon="0"+m;
		    	else
		    		kssjmon=String.valueOf(m);
		    %>
	          <option value="<%=kssjmon %>" <%=null!=kssjmonth&&kssjmonth.equals(kssjmon)?"selected":"" %>><%=kssjmon %></option>
	          <%
		    }
		    %>
	          </select>
	        月</div></td>	   
   <td nowrap="nowrap">
		    <div align="right">项目结束时间：</div>	    </td>
	    <td nowrap="nowrap"><select name="jssjyear">
	     <option value="">请选择</option>
          <%
		    	String jssj=kyxmi.getKy_jssj();	    
		    	int jssjyindex=0,jssjyear=0;
				String jssjstryear="",jssjmonth="";	 
		    	if(jssj!=null&&!jssj.equals("")&&jssj.contains("."))
		    	{ 
		    		jssjyindex=jssj.indexOf(".");    	
		    		jssjstryear=jssj.substring(0,jssjyindex);
		    		jssjmonth=jssj.substring(jssjyindex+1,jssjyindex+3);
		    		jssjyear=Integer.parseInt(jssjstryear);
		    	}else
		    		if(jssj!=null&&!jssj.equals("")&&jssj.length()<5)  		
		    		{
		    			jssjyear=Integer.parseInt(jssj);
		    		}
		    	for(int y=1990;y<2100;y++)
		    	{
		    %>
			 <option value="<%=y %>" <%=jssjyear==y?"selected":"" %>><%=y %></option>
          <%
		    }
		    %>
        </select>
年
<select name="jssjmonth">
 <option value="">请选择</option>
  <%
		    	String jssjmon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		jssjmon="0"+m;
		    	else
		    		jssjmon=String.valueOf(m);
		    %>
  <option value="<%=jssjmon %>" <%=null!=jssjmonth&&jssjmonth.equals(jssjmon)?"selected":"" %>><%=jssjmon %></option>
  <%
		    }
		    %>
</select>
月</td>
	     <td nowrap="nowrap">
		      <div align="right">成果获奖名称：</div></td>
	        <td nowrap="nowrap"><input name="hjmc" type="text" id=""hjmc"" size="10" maxlength="5" value="<%=kyxmi.getKy_hjmc() %>"></td>
	    </tr> 
	    <tr>
	    	<td nowrap="nowrap">
	   		 <div align="right">成果获奖等级：</div>	    </td>
		    <td nowrap="nowrap" colspan="5">
		   <select name="hjdj">
	          <option value="">--获奖等级--</option>
	          <%
				    for (Iterator<Yishujifen_Info> it = yshjfis.iterator(); it.hasNext();)
					{
				    	Yishujifen_Info kcjfi = it.next();		
						if(!kcjfi.getYshjf_khzb().equals(""))
						{
				    %>
	          <option value="<%=kcjfi.getYshjf_khzb() %>" <%=null!=kyxmi.getKy_hjdj()&&kcjfi.getYshjf_khzb().equals(kyxmi.getKy_hjdj())?"selected":"" %>><%=kcjfi.getYshjf_khzb() %></option>
	          		<%
				    }}
				    %>
	        </select>	
		    </td>
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
					String name="lxmember",remain="";
					i=1;
					int len = lxmemscore!=null?lxmemscore.length:0;
					while(i<20)
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
					if(len > 20)
					{
						int j = 20;
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
					name="zjmember";
					remain="";
					i=1;
					len = zjmemscore!=null?zjmemscore.length:0;
					while(i<20)
					{
				%>
				 <tr>
				    <td nowrap="nowrap"><div align="right">成员<%=i %>：</div></td>
				    <td><input name="<%=name+i %>" type="text" id="<%=name+i %>" size="5" value="<%=(i-1)<len?zjmemscore[i-1][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+1 %>：</div></td>
				    <td><input name="<%=name+(i+1) %>" type="text" id="<%=name+(i+1) %>" size="5" value="<%=i<len?zjmemscore[i][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+2 %>：</div></td>
				    <td><input name="<%=name+(i+2) %>" type="text" id="<%=name+(i+2) %>" size="5" value="<%=(i+1)<len?zjmemscore[i+1][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+3 %>：</div></td>
				    <td><input name="<%=name+(i+3) %>" type="text" id="<%=name+(i+3) %>" size="5" value="<%=(i+2)<len?zjmemscore[i+2][0]:""%>"></td>
				    <td nowrap="nowrap"><div align="right">成员<%=i+4 %>：</div></td>
				    <td><input name="<%=name+(i+4) %>" type="text" id="<%=name+(i+4) %>" size="5" value="<%=(i+3)<len?zjmemscore[i+3][0]:""%>"></td>
				</tr>
				 <%
		 			i = i + 5;
					}
					if(len > 20)
					{
						int j = 20;
						while(j < len)
							remain += zjmemscore[j++][0] + "&";
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
					while(i<20)
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
					if(len > 20)
					{
						int j = 20;
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
	    </table>
	    <br/>
		 <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
	    <tr>
		<td height="151" width="9%">
	    	<div align="right">备注：	    	</div></td>
	    <td colspan="3" nowrap="nowrap">
			<textarea name="remark" rows="10" wrap=PHYSICAL cols="50" onKeyDown="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);" onKeyUp="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);"><%=kyxmi.getKy_remark() %></textarea>
			<p>最多字数：
			<input disabled maxLength="4" name="remarktotal" size="2" value="500" class="inputtext">
			已用字数：
			<input disabled maxLength="4" name="remarkused" size="2" value="<%=kyxmi.getKy_remark().length() %>" class="inputtext">
			剩余字数：
			<input disabled maxLength="4" name="remarkremain" size="2" value="<%=500-kyxmi.getKy_remark().length() %>" class="inputtext">
	    	<div align="right"></div>	    	<p></td>
	    </tr>
	    <tr>
		<td colspan="5">&nbsp;</td>
	    </tr>
	    <tr>
		<td colspan="5">&nbsp;</td>
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
			    	<input name="cancel" type="reset" value="取消" class="button" onclick="javascript:window.location.href='../KeyanxmServlet?action=cancel';">
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