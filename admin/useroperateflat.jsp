<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String path=request.getContextPath();
	ArrayList<User_Info> uislist=(ArrayList<User_Info>)request.getAttribute("uislist");
	User_Info uiss=(User_Info)session.getAttribute("uisearch");	
	User_Info uisearch=(User_Info)request.getAttribute("uisearch");
	PageBean pagebean=(PageBean)request.getAttribute("pagebean");
	String action=(String)request.getAttribute("action");
%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息修改</title>
<link href="<%=path+"/css/style.css"%>" rel="stylesheet" type="text/css"/>	
<link href="<%=path+"/css/btn.css"%> " rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/checkbox.css"%> " rel="stylesheet" type="text/css"/>
<link href="<%=path+"/css/resultstyle.css"%>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/checkbox_split.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js"%>"></script>
<link rel="stylesheet" type="text/css" href="<%=path+"/css/highslide.css"%>" />

<script type="text/javascript">
function checkSelAll(){
	$("#checkGroup input:checkbox").attr("checked",true);
	checkRefresh("checkGroup")
}
function checkSelNone(){
	$("#checkGroup input:checkbox").attr("checked",false);
	checkRefresh("checkGroup")
}
function delSel()
{
	var msg="";
	var cpp=form.countperpage.value;
	var pNo=form.pageNo.value;
	$("#checkGroup input[type=checkbox]").each(function(){
		if($(this).attr("checked")){
			msg=msg+$(this).val()+",";
		}
	})

	if(msg=="")
	{	
		alert("请选择！");
		return false;
	}else
		if(confirm('确定要删除选中的吗？'))
		{
			var rootpath='<%=path%>';
			var url=rootpath+"/UserServlet?action=delete&idarray="+msg+"&pageNo="+pNo+"&countperpage="+cpp;
			window.location.href=url;			
		}
		else
			return false;
	//<a href="../UserServlet?action=delete&expid=ei.getExpt_id()" onClick="return confirm('确定要删除吗？'); ">删除</a>
	//alert(msg);
}
function checkdate()
{
	if(searchform.year.value==""&&searchform.month.value!="")
	{
		alert("请选择年份！");
		searchform.year.focus();
		return false;
	}
}

function checkdata(para)
	{
		var pNo=0;
		var cpp=form.countperpage.value;
		if(para=='mid')
			pNo=form.pageNo.value;
		else
			if(para=='up')
				pNo=parseInt(form.pageNo.value)-1;
			else
				if(para='down')
					pNo=parseInt(form.pageNo.value)+1;
		var url="UserServlet?action=pagesearch&pageNo="+pNo+"&countperpage="+cpp;
		window.location.href=url;
	}
</script>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2"  panelTitle="用户基本信息修改">
	<form name="searchform" method="post" action="<%=path+"/UserServlet?action=search&pageNo=1"%>" onSubmit="return checkdate()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
	    <td width="9%"  nowrap="nowrap">
		    <div align="right">工号：		    </div>	    </td>
	    <td width="14%"  nowrap="nowrap">
	        <input name="gh" type="text" size="3" maxlength="6" value="<%=uiss!=null?uiss.getUser_jiaogonghao():""%>">	    
	    </td>	       
		<td width="14%"   nowrap="nowrap">
			<div align="right">姓名：			</div>		</td>
		<td width="17%"  nowrap="nowrap">
			<div align="left">
				<input name="name" type="text" size="5" value="<%=uiss!=null&&uiss.getUser_name()!=null?uiss.getUser_name():""%>">
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
			      <option value="<%=di.getDept_name()%>" <%=uiss!=null&&uiss.getUser_dept_name()!=null&&uiss.getUser_dept_name().equals(di.getDept_name())?"selected":""%>><%=di.getDept_name()%></option>
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
			    <option value="<%=ui.getUsertype_name()%>" <%=uiss!=null&&uiss.getUser_type()!=null&&uiss.getUser_type().equals(ui.getUsertype_name())?"selected":""%>><%=ui.getUsertype_name()%></option>
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
			    <option value="<%=xki.getXueke_name()%>" <%=uiss!=null&&uiss.getUser_xk_name()!=null&&uiss.getUser_xk_name().equals(xki.getXueke_name())?"selected":""%>><%=xki.getXueke_name()%></option>
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
		    	for (Iterator<Xuewei_Info> it = xws.iterator(); it.hasNext();)
		    	{
		    		Xuewei_Info xi = it.next();
		    %>
		    <option value="<%=xi.getXuewei_name() %>" <%=uiss!=null&&uiss.getUser_xw_name()!=null&&uiss.getUser_xw_name().equals(xi.getXuewei_name())?"selected":"" %>><%=xi.getXuewei_name() %></option>
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
		    	String birthday="";
		    	if(uiss!=null)
		    		  birthday=uiss.getUser_birthday();
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
		   	    <option value="<%=mon %>" <%=uiss!=null&&null!=birthdaymonth&&birthdaymonth.equals(mon)?"selected":"" %>><%=mon %></option>
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
			    	<option value="男" <%=uiss!=null&&uiss.getUser_sex()!=null&&uiss.getUser_sex().equals("男")?"selected":"" %>>男</option>
			    	<option value="女" <%=uiss!=null&&uiss.getUser_sex()!=null&&uiss.getUser_sex().equals("女")?"selected":"" %>>女</option>
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
			    <option value="<%=pi.getPos_name() %>" <%=uiss!=null&&uiss.getUser_pos_name()!=null&&uiss.getUser_pos_name().equals(pi.getPos_name())?"selected":"" %>><%=pi.getPos_name() %></option>
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
<%
	if(uislist!=null&&uislist.size()!=0)
	{
%>
<div>
	<br/>
	<form name="exportform" method="post" action="<%=path+"/UserServlet?action=export"%>">
		<input type="button" value="全选" onclick="checkSelAll()"/>
		<input type="button" value="全不选" onclick="checkSelNone()"/>
		<input type="button" value="删除选中" onclick="delSel()"/>
		<input type="submit" value="导出" />
	</form>
	<form name="form" method="post" action="#">
	        <table border="0" cellpadding="3" cellspacing="0" style="margin:0px auto;"  WIDTH=100% >
				<tr>
					<td colspan="5" align="left" nowrap="nowrap">
						当前第<%=pagebean.getPageNo() %>页						
					    [
						<a href="<%=path+"/UserServlet?action=pagesearch&pageNo="+(pagebean.getPageNo()-1)+"&countperpage="+pagebean.getPAGE_SIZE() %>">上一页</a> 
						|
						<select name="pageNo" onchange="javascript:checkdata('mid');" >
 						<%
 						for(int i=1;i<=pagebean.getTotalPages();i++)
 						{
 						%>
 						<option value="<%=i %>" <%=pagebean!=null&&pagebean.getPageNo()==i?"selected":"" %>><%=i %></option>
 						<%
 						}
 						%>
 						</select> 						
					    |
					    <a href="<%=path+"/UserServlet?action=pagesearch&pageNo="+(pagebean.getPageNo()+1)+"&countperpage="+pagebean.getPAGE_SIZE() %>">下一页</a>] 
 					共<%=pagebean.getTotalRecords() %>条记录/每页显示
 					<select name="countperpage" onchange="javascript:checkdata('mid');">
 					<%
 					for(int i=10;i<=10*10;i+=10)
 					{
 					%>
 					<option value="<%=i %>" <%=pagebean!=null&&pagebean.getPAGE_SIZE()==i?"selected":"" %>><%=i %></option>
 					<%
 					}
 					%>
 					</select>
 					记录					
 					</td>				
					<td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td >&nbsp;</td>
				    <td width="13%" >&nbsp;</td>
				    <td width="13%" >&nbsp;</td>
			</tr>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >				
				<tbody>
					<tr valign="top">
						<td>
							<div id="checkGroup" class="jive-thread-list">
								<div class="jive-table">
									<table summary="List of threads" cellpadding="0" cellspacing="0"  WIDTH=100% >
										<thead>
											<tr>
												<th class="jive-first" >
													选择												
												</th>
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
													所在部门												
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
													岗位类别										
												</th>
												<th width="1%" class="jive-first" >
													职称											
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
												<th width="1%" class="jive-first" >
													操作										
												</th>
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												lineNo=(pagebean.getPageNo()-1)*pagebean.getPAGE_SIZE()+1;
												for (Iterator<User_Info> it = uislist.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													User_Info ui = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">
												<td width="1%">
													<div class="render" align="center">
														<input type="checkbox"  value="<%=ui.getUser_id() %>"/> 														
													</div>
												</td>	
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
														<%=ui.getUser_gwlb() %>&nbsp;
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
										      <td width="1%">
													<div align="center">
														<a href="<%=path+"/UserServlet?action=delete&idarray="+ui.getUser_id()+"&pageNo="+pagebean.getPageNo()+"&countperpage="+pagebean.getPAGE_SIZE() %>" onclick="return confirm('确定要删除吗？')"><img border="0" alt="删除" src="<%=path+"/icons/delete.gif"%> "/></a>														
														<a href="<%=path+"/UserServlet?action=alterflat&userid="+ui.getUser_id()+"&pageNo="+pagebean.getPageNo()+"&countperpage="+pagebean.getPAGE_SIZE() %>"><img border="0" alt="修改" src="<%=path+"/icons/edit.gif"%> "/></a>
													</div>
											  </td>										
											</tr>	
											<%
												lineNo++;
												}
											%>
										</tbody>
								  </table>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>	
			<input type="button" value="全选" onClick="checkSelAll()"/>
			<input type="button" value="全不选" onClick="checkSelNone()"/>
			<input type="button" value="删除选中" onClick="delSel()"/>	
			<%
			}else
			if(uislist!=null&&uislist.size()==0)
			{%>
			<table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" >
			  <tr>
			  <td align="center">
				目前暂无相关记录！
			  </td>
			  </tr>	
			 </table>		
			<%
			}//=availheight
			%> 			
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