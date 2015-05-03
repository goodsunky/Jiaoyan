<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String path=request.getContextPath();
	//ArrayList<User_Info> uislist=(ArrayList<User_Info>)request.getAttribute("uislist");
	//User_Info uiss=(User_Info)session.getAttribute("uisearch");	
	//User_Info uisearch=(User_Info)request.getAttribute("uisearch");
	//PageBean pagebean=(PageBean)request.getAttribute("pagebean");
	//String action=(String)request.getAttribute("action");	
%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息修改</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>	
<link href="<%=path+"/css/btn.css"%> " rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/checkbox.css"%> " rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/resultstyle.css"%>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/checkbox_split.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js"%>"></script>
<link rel="stylesheet" type="text/css" href="<%=path+"/css/highslide.css"%>" />

<script type="text/javascript">
function checkdata()
{
	if(form.year.value==""&&form.month.value!="")
	{
		alert("请选择年份！");
		form.year.focus();
		return false;
	}
}
</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2"  panelTitle="用户基本信息查询">
	<form name="form" method="post" action="<%=path+"/UserServlet?action=search&pageNo=1" %>" onSubmit="return checkdata()" target="bottomframe">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
	    <td width="9%"  nowrap="nowrap">
		    <div align="right">工号：		    </div>	    </td>
	    <td width="14%"  nowrap="nowrap">
	        <input name="gh" type="text" size="3" maxlength="6">	    
	    </td>	       
		<td width="14%"   nowrap="nowrap">
			<div align="right">姓名：			</div>		</td>
		<td width="17%"  nowrap="nowrap">
			<div align="left">
				<input name="name" type="text" size="5" >
			</div>		
		</td>		
		<td width="9%" nowrap="nowrap">
   		    <div align="right">所在部门：</div>	    </td>
	    <td width="9%" nowrap="nowrap">
	    	<select name="dept">
	      		<option value="">所有</option>
	      		<%
			    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
				{
					Department_Info di = it.next();		
					if(!di.getDept_name().equals(""))
					{	
			    %>
			      <option value="<%=di.getDept_name() %>" ><%=di.getDept_name() %></option>
			      <%
			    }}
			    %>
	    	</select>	    
	    	</td>	
	    	
	</tr>	
	<tr>
		<td width="9%" nowrap="nowrap">
   		    <div align="right">用户类型：</div>	    </td>
	    <td width="14%" nowrap="nowrap">
	    	<select name='usertype' id='usertype'>
	    	<option value="">所有</option>
			<%
			    for (Iterator<Usertype_Info> it = utis.iterator(); it.hasNext();)
				{
					Usertype_Info ui = it.next();							
			    %>
			    <option value="<%=ui.getUsertype_name() %>" ><%=ui.getUsertype_name() %></option>
			    <%
			    }
			    %>		  
		</select>
		</td>	
		<td width="14%" nowrap="nowrap">
			<div align="right">所属学科：			</div>		</td>
	    <td width="17%" nowrap="nowrap">
		    <select name="xueke">
			    <option value="">所有</option>
			    <%
			    for (Iterator<Xueke_Info> it = xks.iterator(); it.hasNext();)
				{
					Xueke_Info xki = it.next();		
			    %>
			    <option value="<%=xki.getXueke_name() %>" ><%=xki.getXueke_name() %></option>
			    <%
			    }
			    %>
		    </select>		
		    </td> 	
		    <td nowrap="nowrap">
		    <div align="right">最高学位：		    </div>	    </td>
	    <td nowrap="nowrap">
	    <select name="xuewei">    
		    <option value="">所有</option>
		    <%
		    for (Iterator<XueWei_Info> it = xws.iterator(); it.hasNext();)
			{
				XueWei_Info xi = it.next();		
		    %>
		    <option value="<%=xi.getXuewei_name() %>" ><%=xi.getXuewei_name() %></option>
		    <%
		    }
		    %>
	    </select>	    
	    </td>     
		</tr> 
		<tr>
		 <td nowrap="nowrap">
	    	<div align="right">出生年月：	    	</div>	    </td>
	    <td nowrap="nowrap">
		    <select name="year">
		    <option value="">所有</option>
		    <%
		    	/*String birthday="";
		    	if(uiss!=null)
		    		  birthday=uiss.getUser_birthday();
		    	int birthdayindex=0,birthdayyear=0;
				String birthdaystryear="",birthdaymonth="";	 
		    	if(birthday!=null&&!birthday.equals("")&&birthday.length()>5)//有月
		    	{ 
		    		birthdayindex=birthday.indexOf("年");    	
		    		birthdaystryear=birthday.substring(0,birthdayindex);
		    		birthdaymonth=birthday.substring(birthdayindex+1,birthdayindex+3);
		    		birthdayyear=Integer.parseInt(birthdaystryear);
		    	}else
		    		if(birthday!=null&&!birthday.equals("")&&birthday.length()<=5)//无月
		    		{
		    			birthdayindex=birthday.indexOf("年");  
		    			birthdaystryear=birthday.substring(0,birthdayindex);  	
		    			birthdayyear=Integer.parseInt(birthdaystryear);
		    		}*/
		    	for(int y=1900;y<2100;y++)
		    	{
		    %>
		    	<option value="<%=y %>" ><%=y %></option>
		    <%
		    }
		    %>
		    </select> 
	                     年       	                     
		    <select name="month">
		     <option value="">所有</option>
		    <%
		    	String mon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		mon="0"+m;
		    	else
		    		mon=String.valueOf(m);
		    %>
		   	    <option value="<%=mon %>" ><%=mon %></option>
		    <%
		    }
		    %>
		    </select>
	                     月	    </td>
		 <td  nowrap="nowrap">	  
		    <div align="right">性别：		    </div>		</td>
		<td  nowrap="nowrap">
			<div align="left">
			  <select name="sex">
			    	<option value="">所有</option>    
			    	<option value="男" >男</option>
			    	<option value="女" >女</option>
		    	</select>			</div>		</td>
	    <td nowrap="nowrap">
		    <div align="right">专业技术资格：		    </div>	    </td>
	    <td nowrap="nowrap">
		    <select name="position">
			    <option value="">所有</option>
			    <%
			    for (Iterator<Position_Info> it = pis.iterator(); it.hasNext();)
				{
					Position_Info pi = it.next();		
			    %>
			    <option value="<%=pi.getPos_name() %>" ><%=pi.getPos_name() %></option>
			    <%
			    }
			    %>
		    </select>	    </td>
		    <td width="17%" nowrap="nowrap">
	      	<div align="left">
	        <input name="save" type="submit" value="查询" class="button">
	      </div>
	    </td>
		</tr>	    
	</TABLE>		
	</form>
</div>
<div align="center">
		<iframe  src="admin/searchuserresult.jsp"   width="100%"  height="<%=availheight %>"  scrolling="auto" frameborder="0" name="bottomframe"></iframe>
</div>
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