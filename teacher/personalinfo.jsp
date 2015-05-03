<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp"%>
<%@ include file="../common/getnecessaryinfo.jsp"%>
<%
	String action=(String)request.getParameter("action");
	String gh=(String)request.getParameter("gh");
	String dept=(String)request.getParameter("dept");
	String sql="select *from user_info where user_jiaogonghao='"+gh+"' and user_dept_name='"+dept+"'";
	User_Info ui=new User_Info();
	ui=DB.getUserInfo(sql);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>个人基本信息</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css" />
		<link href="../css/btn.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery/jquery.js"></script>
		<SCRIPT language=JavaScript type="text/javascript"
			src="../js/ESONCalendar.js" charset="gb2312"></SCRIPT>
		<script type="text/javascript" src="../js/highslide-with-html.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
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
		function validate(field) {
		   var valid = "_-0123456789";
		   var ok = "yes";
		   var temp;
		   for (var i=0; i<field.value.length; i++) {
		       temp = "" + field.value.substring(i, i+1);
		       if (valid.indexOf(temp) == "-1")
			      ok = "no";
		   }
		   if (ok == "no") {
		       alert("请填写数字!");
		       field.focus();
		       field.select();
		   }
		}
		</script>
		<style type="text/css">
<!--
.STYLE1 {
	font-size: small
}
-->
</style>
	</head>
	<body style="margin: 0px auto;">
		<div id="container">
			<div id="content">
				<div class="box2" panelTitle="查看个人基本信息">
					<fieldset>
						<legend style="font-weight: bold; color: #0000FF">
							个人基本信息
						</legend>
						<table width="95%" border="0" align="center" cellpadding="5"
							cellspacing="0" bgcolor="#000000">
							<tr bgcolor="#99ccff">
								<td align="right" width="50%">
									<strong>【基本信息】 </strong>
								</td>
								<td>
								<a href="personalinfo.jsp?action=alter&gh=<%=gh %>&dept=<%=dept %>"><img border="0" alt="修改" src="../icons/edit.gif"/></a>
								</td>
							</tr>
						</table>
						<%
								if(action!=null&&action.equals("alter"))
								{
								%>
						<form method="post" action="../UserServlet?action=alter"	name="form" onsubmit="return checkdata()">
							<input type='hidden' name='userid' value='<%=ui.getUser_id() %>'>
							<input type='hidden' name='gh' value='<%=ui.getUser_jiaogonghao() %>'>
							<input type='hidden' name='name' value='<%=ui.getUser_name() %>'>
							<input type='hidden' name='dept' value='<%=ui.getUser_dept_name() %>'>
							<input type='hidden' name='pwd'	value='<%=ui.getUser_password() %>'>
							<input type='hidden' name='usertype' value='<%=ui.getUser_type() %>'>
							<input type='hidden' name='gwlb' value='<%=ui.getUser_gwlb() %>'>
							<input type='hidden' name='url' value='teacher/personalinfo.jsp?gh=<%=ui.getUser_jiaogonghao() %>&dept=<%=ui.getUser_dept_name() %>'>
							<table width="95%" border="0" align="center" cellpadding="5" 
								cellspacing="1" bgcolor="#000000">
								<tr bgcolor="#FFFFFF">
									<td>
										教工号
									</td>
									<td>
										<input disabled="disabled" type=text value='<%=ui.getUser_jiaogonghao() %>'>
									</td>
									<td>
										姓名
									</td>
									<td>
										<input disabled="disabled" type=text value='<%=ui.getUser_name() %>'>
									</td>
									<td>
										所在部门
									</td>
									<td>
										<input disabled="disabled" type=text value='<%=ui.getUser_dept_name() %>'>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td>
										用户类型
									</td>
									<td>
										<input disabled="disabled" type=text value='<%=ui.getUser_type() %>'>
									</td>
									<td>
										岗位类别
									</td>
									<td>
										<input disabled="disabled" type=text value='<%=ui.getUser_gwlb() %>'>
									</td>
									<td>
										性别
									</td>
									<td>
										<input type="radio" name="sex" value="男" <%=null!=ui.getUser_sex()&&ui.getUser_sex().equals("男")?"checked":"" %>>
										男
										<input type="radio" name="sex" value="女" <%=null!=ui.getUser_sex()&&ui.getUser_sex().equals("女")?"checked":"" %>>
										女
									</td>
									
									
									
								</tr>
								<tr bgcolor="#FFFFFF">
									<td>
										出生年月
									</td>
									<td>
										<select name="year">
											<option value="">
												请选择
											</option>
											<%
		    	String birthday="";
		    	if(ui!=null)
		    		  birthday=ui.getUser_birthday();
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
											<option value="">
												请选择
											</option>
											<%
		    	String mon="";
		    	for(int m=1;m<=12;m++)
		    	{
		    	if(m<10)
		    		mon="0"+m;
		    	else
		    		mon=String.valueOf(m);
		    %>
											<option value="<%=mon %>"
												<%=ui!=null&&null!=birthdaymonth&&birthdaymonth.equals(mon)?"selected":"" %>><%=mon %></option>
											<%
		    }
		    %>
										</select>
										月
									</td>
									<td>
										专业技术资格
									</td>
									<td>
										<select name="position">
									    <option value="">--职称名称--</option>
									    <%
									    for (Iterator<Position_Info> it = pis.iterator(); it.hasNext();)
										{
											Position_Info pi = it.next();		
									    %>
									    <option value="<%=pi.getPos_name() %>" <%=ui!=null&&ui.getUser_pos_name()!=null&&ui.getUser_pos_name().equals(pi.getPos_name())?"selected":"" %>><%=pi.getPos_name() %></option>
									    <%
									    }
									    %>
								    </select>
									</td>
									
									<td>
										所属学科
									</td>
									<td>
								<select name="xueke">
								    <option value="">--学科类别--</option>
								    <%
								    for (Iterator<Xueke_Info> it = xks.iterator(); it.hasNext();)
									{
										Xueke_Info xki = it.next();		
								    %>
								    <option value="<%=xki.getXueke_name() %>" <%=ui!=null&&ui.getUser_xk_name()!=null&&ui.getUser_xk_name().equals(xki.getXueke_name())?"selected":"" %>><%=xki.getXueke_name() %></option>
								    <%
								    }
								    %>
							    </select>		
									</td>									
								</tr>
								<tr bgcolor="#FFFFFF">
									<td>
										最高学位
									</td>
									<td>
										 <select name="xuewei">    
										    <option value="">--学位类别--</option>
										    <%
										    for (Iterator<Xuewei_Info> it = xws.iterator(); it.hasNext();)
											{
												Xuewei_Info xi = it.next();		
										    %>
										    <option value="<%=xi.getXuewei_name() %>" <%=ui!=null&&ui.getUser_xw_name()!=null&&ui.getUser_xw_name().equals(xi.getXuewei_name())?"selected":"" %>><%=xi.getXuewei_name() %></option>
										    <%
										    }
										    %>
									    </select>
									</td>
									<td>
										联系电话
									</td>
									<td>
										<input name="phone" type="text"   value="<%=ui!=null?ui.getUser_phone():"" %>" onblur="validate(this)" >
									</td>
									<td>
										电子邮箱
									</td>
									<td>
										<input name="email" type="text" value="<%=ui!=null?ui.getUser_mail():"" %>">
									</td>									
								</tr>
								<tr bgcolor="#FFFFFF">
									<td>
										教研方向
									</td>
									<td>
										<input type=text name='jyfx' value="<%=ui!=null?ui.getUser_jyfx():"" %>">
									</td>
									<td>
										主讲课程
									</td>
									<td>
										<input type=text name='zjkc' value="<%=ui!=null?ui.getUser_zjkc():"" %>">
									</td>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td colspan="6" align="center">
										<input type="submit" name="save" value="保存">
										<input type="button" name="cancel" value="取消"	onclick="javascript: history.go(-1);">
									</td>
								</tr>
							</table>
						</form>
						<%
								}else
								{
								%>
						<table width="95%" border="0" align="center" cellpadding="5"
							cellspacing="1" bgcolor="#000000">
							<tr bgcolor="#FFFFFF">
								<td>
									教工号
								</td>
								<td>
									<%=ui.getUser_jiaogonghao() %>
								</td>
								<td>
									姓名
								</td>
								<td>
									<%=ui.getUser_name() %>
								</td>
								<td>
									所在部门
								</td>
								<td>
									<%=ui.getUser_dept_name() %>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td>
									用户类型
								</td>
								<td>
									<%=ui.getUser_type() %>
								</td>
								<td>
									岗位类别
								</td>
								<td>
									<%=ui.getUser_gwlb() %>
								</td>
								<td>
									性别
								</td>
								<td>
									<%=ui.getUser_sex() %>
								</td>								
							</tr>
							<tr bgcolor="#FFFFFF">
								<td>
									出生年月
								</td>
								<td>
									<%=ui.getUser_birthday() %>
								</td>
								<td>
									专业技术资格
								</td>
								<td>
									<%=ui.getUser_pos_name() %>
								</td>
								<td>
									所属学科
								</td>
								<td>
									<%=ui.getUser_xk_name() %>
								</td>								
							</tr>
							<tr bgcolor="#FFFFFF">
								<td>
									最高学位
								</td>
								<td>
									<%=ui.getUser_xw_name() %>
								</td>
								<td>
									联系电话
								</td>
								<td>
									<%=ui.getUser_phone() %>
								</td>
								<td>
									电子邮箱
								</td>
								<td>
									<%=ui.getUser_mail() %>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td>
									教研方向
								</td>
								<td>
									<%=ui.getUser_jyfx() %>
								</td>
								<td>
									主讲课程
								</td>
								<td>
									<%=ui.getUser_zjkc() %>
								</td>
								<td>
										&nbsp;
								</td>
								<td>
										&nbsp;
								</td>
							</tr>
						</table>
						<%
								}
								%>
					</fieldset>
				</div>
			</div>
		</div>
	</body>
	<!--代码高亮start-->
	<script type="text/javascript" src="../highlight/highlight.js"></script>
	<script type="text/javascript" src="../highlight/lang-xml.js"></script>
	<script type="text/javascript" src="../highlight/lang-html.js"></script>
	<link href="../highlight/mainstyle.css" rel="stylesheet"
		type="text/css" />
	<script>
	$(function() {
		showCode()
	})
	function showCode() {
		$(".code").each(
				function() {
					var code = $(this).val()
					var hl = new DlHighlight( {
						lang : "html",
						lineNumbers : false
					});
					var formatted = hl.doItNow(code);
					$(this).next().addClass("DlHighlight").html(
							"<pre>" + formatted + "</pre>")
				})
	}
</script>
</html>