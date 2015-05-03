<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String path=request.getContextPath();
	ArrayList<User_Info> uislist=(ArrayList<User_Info>)request.getAttribute("uislist");
	User_Info uisearch=(User_Info)request.getAttribute("uisearch");
	String action=(String)request.getAttribute("action");	
%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
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
<div class="box2"  panelTitle="教师基本信息查询">
	<form name="form" method="post" action="<%=path+"/UserServlet?action=deptsearch" %>" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
	    <td width="10%"  nowrap="nowrap">
	      <div align="right">工号：		    </div>	    </td>
	    <td width="12%"  nowrap="nowrap">
	        <input name="gh" type="text" size="3" maxlength="6" value="<%=uisearch!=null?uisearch.getUser_jiaogonghao():"" %>">	    </td>	       
		<td width="13%"   nowrap="nowrap">
		  <div align="right">姓名：			</div>		</td>
		<td width="12%"  nowrap="nowrap">
			<div align="left">
				<input name="name" type="text" size="5" value="<%=uisearch!=null&&uisearch.getUser_name()!=null?uisearch.getUser_name():"" %>">
			</div>		</td>		
	    <td width="9%" nowrap="nowrap">
	      <div align="right">用户类型：</div>	    </td>
	    <td width="44%" nowrap="nowrap">
	    	<select name='usertype' id='usertype'>
	    	<option value="">所有</option>
			<%
			    for (Iterator<Usertype_Info> it = utis.iterator(); it.hasNext();)
				{
					Usertype_Info ui = it.next();							
			    %>
			    <option value="<%=ui.getUsertype_name() %>" <%=uisearch!=null&&uisearch.getUser_type()!=null&&uisearch.getUser_type().equals(ui.getUsertype_name())?"selected":"" %>><%=ui.getUsertype_name() %></option>
			    <%
			    }
			    %>		  
		</select>		</td>		
	</tr>	
	<tr>
		
		<td width="10%" nowrap="nowrap">
		  <div align="right">所属学科：			</div>		</td>
	    <td width="12%" nowrap="nowrap">
		    <select name="xueke">
			    <option value="">所有</option>
			    <%
			    for (Iterator<Xueke_Info> it = xks.iterator(); it.hasNext();)
				{
					Xueke_Info xki = it.next();		
			    %>
			    <option value="<%=xki.getXueke_name() %>" <%=uisearch!=null&&uisearch.getUser_xk_name()!=null&&uisearch.getUser_xk_name().equals(xki.getXueke_name())?"selected":"" %>><%=xki.getXueke_name() %></option>
			    <%
			    }
			    %>
		    </select>	      </td> 	
		    <td nowrap="nowrap">
		    <div align="right">最高学位：		    </div>	    </td>
	    <td nowrap="nowrap">
	    <select name="xuewei">    
		    <option value="">所有</option>
		    <%
		    for (Iterator<Xuewei_Info> it = xws.iterator(); it.hasNext();)
			{
				Xuewei_Info xi = it.next();		
		    %>
		    <option value="<%=xi.getXuewei_name() %>" <%=uisearch!=null&&uisearch.getUser_xw_name()!=null&&uisearch.getUser_xw_name().equals(xi.getXuewei_name())?"selected":"" %>><%=xi.getXuewei_name() %></option>
		    <%
		    }
		    %>
	    </select>	    </td>
	     <td nowrap="nowrap">
	    	<div align="right">出生年月：	    	</div>	    </td>
	    <td nowrap="nowrap">
		    <select name="year">
		    <option value="">所有</option>
		    <%
		    	String birthday="";
		    	if(uisearch!=null)
		    		  birthday=uisearch.getUser_birthday();
		    	int birthdayindex=0,birthdayyear=0;
				String birthdaystryear="",birthdaymonth="";	 
		    	if(birthday!=null&&!birthday.equals("")&&birthday.length()>5&&birthday.indexOf(".")>=0)//有月
		    	{ 
		    		birthdayindex=birthday.indexOf(".");    	
		    		birthdaystryear=birthday.substring(0,birthdayindex);
		    		birthdaymonth=birthday.substring(birthdayindex+1,birthdayindex+3);
		    		birthdayyear=Integer.parseInt(birthdaystryear);
		    	}else
		    		if(birthday!=null&&!birthday.equals("")&&birthday.length()<5)//无月
		    		{
		    			birthdayyear=Integer.parseInt(birthday);
		    		}
		    	int maxyear=Integer.parseInt(birthyear);
		    	for(int y=1900;y<=maxyear;y++)
		    	{
		    %>
		    	<option value="<%=y %>" <%=birthdayyear==y?"selected":"" %>><%=y %></option>
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
		   	    <option value="<%=mon %>" <%=uisearch!=null&&null!=birthdaymonth&&birthdaymonth.equals(mon)?"selected":"" %>><%=mon %></option>
		    <%
		    }
		    %>
		    </select>
	                     月	    </td>     
		</tr> 
		<tr>		
		 <td  nowrap="nowrap">	  
		    <div align="right">性别：		    </div>		</td>
		<td  nowrap="nowrap">
			<div align="left">
			  <select name="sex">
			    	<option value="">所有</option>    
			    	<option value="男" <%=uisearch!=null&&uisearch.getUser_sex()!=null&&uisearch.getUser_sex().equals("男")?"selected":"" %>>男</option>
			    	<option value="女" <%=uisearch!=null&&uisearch.getUser_sex()!=null&&uisearch.getUser_sex().equals("女")?"selected":"" %>>女</option>
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
			    <option value="<%=pi.getPos_name() %>" <%=uisearch!=null&&uisearch.getUser_pos_name()!=null&&uisearch.getUser_pos_name().equals(pi.getPos_name())?"selected":"" %>><%=pi.getPos_name() %></option>
			    <%
			    }
			    %>
		    </select>	    </td>
		    <td  nowrap="nowrap">
	      	<div align="left"></div>	    	</td>
		    <td  nowrap="nowrap"><input name="save" type="submit" value="查询" class="button"></td>
		</tr>	    
	</TABLE>		
	</form>
</div>
<%
	if(uislist!=null&&uislist.size()!=0&&(action!=null&&(action.equals("deptsearch"))))
	{
%>
<div>
	<form name="exportform" method="post" action="<%=path+"/UserServlet?action=export" %>">
		<input type="submit" value="导出" class="button"/>
	</form>	
			<table border="0" cellpadding="0"  class="jive-table" cellspacing="0" style="margin:0px auto;" WIDTH=100% >				
										<thead>
											<tr>												
												<th class="jive-first" >
													编号												
												</th>	
												<th width="1%" class="jive-first" >
													工号												
												</th>											
												<th width="1%" class="jive-first" >
													姓名												
												</th>
												<th width="1%" class="jive-first" >
													部门名称												
												</th>
												<th width="1%" class="jive-first" >
													用户类型											
												</th>
												<th width="1%" class="jive-first" >
													性别												
												</th>
												<th width="1%" class="jive-first" >
													出生年月												
												</th>
												<th width="1%" class="jive-first" >
													所属学科												
												</th>
												<th width="1%" class="jive-first" >
													最高学位										
												</th>
												<th width="1%" class="jive-first" >
													专业技术资格											
												</th>		
												<th width="1%"  class="jive-first">
													联系电话												
												</th>
												<th width="1%"  class="jive-first">
													电子邮箱												
												</th>																						
												<th width="1%" class="jive-first" >
													教研方向												
												</th>																															
												<th width="1%" class="jive-first" >
													主讲课程											
												</th>												
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												for (Iterator<User_Info> it = uislist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													User_Info ui = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">												
												<td width="1%" >
													<div align="center">
														<%=lineNo %>
													</div>
												</td>	
												<td width="1%" >
													<div align="center">
														<%=ui.getUser_jiaogonghao() %>
													</div>
												</td>																						
												<td width="1%">
													<div align="center">
														<%=ui.getUser_name() %>&nbsp;
													</div>
											  </td>
											  <td>
													<div align="center">
														<%=ui.getUser_dept_name() %>&nbsp;
													</div>
												</td>
												<td>
													<div align="center">
														<%=ui.getUser_type() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_sex() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_birthday() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_xk_name() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_xw_name() %>&nbsp;
													</div>
												</td>
												<td width="1%">
													<div align="center">
														<%=ui.getUser_pos_name() %>&nbsp;
													</div>
												</td>	
												<td>
													<div align="center">
														<%=ui.getUser_phone() %>&nbsp;
													</div>
												</td>	
												<td>
													<div align="center">
														<%=ui.getUser_mail() %>&nbsp;
													</div>
												</td>												
												  <td>
													<div align="center">
														<%=ui.getUser_jyfx() %>&nbsp;
													</div>
												</td>																																			
												<td width="1%">
													<div align="center">
													<%=ui.getUser_zjkc() %>&nbsp;
													</a>													
													</div>												
										      </td>											     									
											</tr>	
											<%
												lineNo++;
												}
											%>
										</tbody>
								  </table>			
			<%
			}else
			if(action!=null&&(action.equals("deptsearch")))
			{%>
			<br>
			<TABLE WIDTH=95% BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<tr>
			<td align="center" nowrap="nowrap" style="font-weight: bold;font-size:15px;">
			目前暂无相关记录！
			</td>
			</tr>
			</TABLE>	
			<%
			}//=availheight
			%> 			
			</div>
	</div>
</div>


</body>		
<script>
  document.getElementById("FootBg").style.top=document.body.clientHeight-120;
</script>
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