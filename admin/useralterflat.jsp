<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	String path=request.getContextPath();
	User_Info ui=(User_Info)request.getAttribute("uidetail");
	PageBean pb=(PageBean)request.getAttribute("pagebean");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户添加</title>
<link href="<%=path+"/css/style.css" %>" rel="stylesheet" type="text/css"/>	
<link href="<%=path+"/css/btn.css" %>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/remaincount.js"%>" charset="gb2312"></script>
<script type="text/javascript" src="<%=path+"/js/checkuserform.js"%>" charset="gb2312"></script>
<script type="text/javascript" src="<%=path+"/js/highslide-with-html.js"%>"></script>
<link rel="stylesheet" type="text/css" href="<%=path+"/css/highslide.css"%>" />

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="用户基本信息修改（带*号必填）">	
	<form name="form" method="post" action="<%=path+"/UserServlet?action=doalter&userid="+ui.getUser_id() %>" onSubmit="return checkdata()">
	<input type="hidden" name="pageNo" value="<%=pb.getPageNo() %>"/>
	<input type="hidden" name="countperpage" value="<%=pb.getPAGE_SIZE() %>"/>
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
		<td >&nbsp;</td>
	    <td  nowrap="nowrap">
		    <div align="right">工号*：		    </div>	    </td>
	    <td  nowrap="nowrap">
	        <input name="gh" type="text" size="10" maxlength="6" value="<%=ui!=null?ui.getUser_jiaogonghao():"" %>">	    </td>
	    <td  nowrap="nowrap">
		    <div align="right">密码*：		    </div>	    </td>
	    <td   nowrap="nowrap">
	        <input name="pwd" type="password" size="40" value="<%=ui!=null?ui.getUser_password():"" %>">	    </td>
		<td   nowrap="nowrap">
			<div align="right">姓名*：			</div>		</td>
		<td  nowrap="nowrap">
			<div align="left">
				<input name="name" type="text" size="10" value="<%=ui!=null?ui.getUser_name():"" %>">
			</div>		</td>		
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td nowrap="nowrap">
	   		 <div align="right">所在部门*：</div>	    </td>
	    <td nowrap="nowrap">
	    	<select name="dept">
	      		<option value="">--部门机构--</option>
	      		<%
			    for (Iterator<Department_Info> it = dis.iterator(); it.hasNext();)
				{
					Department_Info di = it.next();		
					if(!di.getDept_name().equals(""))
					{	
			    %>
			      <option value="<%=di.getDept_name() %>" <%=ui!=null&&ui.getUser_dept_name()!=null&&ui.getUser_dept_name().equals(di.getDept_name())?"selected":"" %>><%=di.getDept_name() %></option>
			      <%
			    }}
			    %>
	    	</select>	    </td>		
	    <td nowrap="nowrap">
	   		 <div align="right">用户类型*：</div>	    </td>
	    <td nowrap="nowrap">
	    	<select name='usertype' id='usertype'>
	    	<option value="">请选择</option>
			<%
			    for (Iterator<Usertype_Info> it = utis.iterator(); it.hasNext();)
				{
					Usertype_Info uti = it.next();							
			    %>
			    <option value="<%=uti.getUsertype_name() %>" <%=ui!=null&&ui.getUser_type()!=null&&ui.getUser_type().equals(uti.getUsertype_name())?"selected":"" %>><%=uti.getUsertype_name() %></option>
			    <%
			    }
			    %>		  
		</select>	
		<td nowrap="nowrap">
			<div align="right">所属学科：			</div>		</td>
	    <td nowrap="nowrap">
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
		    </select>		</td>        
	    
		</tr>
	    <tr>
		<td>&nbsp;	</td>
		<td nowrap="nowrap">
	    	<div align="right">出生年月：	    	</div>	    </td>
	    <td nowrap="nowrap">
		    <select name="year">
		    <option value="">请选择</option>
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
		   	    <option value="<%=mon %>" <%=ui!=null&&null!=birthdaymonth&&birthdaymonth.equals(mon)?"selected":"" %>><%=mon %></option>
		    <%
		    }
		    %>
		    </select>
	                     月    </td>
		 
	    <td nowrap="nowrap">
		    <div align="right">岗位类别：		    </div>	    </td>
	    <td nowrap="nowrap">
		    <select name="gwlb">
			    <option value="">--岗位类别--</option>
			    <%
			    	for (Iterator<Gangwei_Info> it = gws.iterator(); it.hasNext();)
					{
						Gangwei_Info gi = it.next();
			    %>
			    <option value="<%=gi.getGw_name()%>" <%=ui!=null&&ui.getUser_gwlb()!=null&&ui.getUser_gwlb().equals(gi.getGw_name())?"selected":"" %>><%=gi.getGw_name() %></option>
			    <%
			    	}
			    %>
		    </select>	    </td>
	    <td nowrap="nowrap">
		    <div align="right">专业技术资格：		    </div>	    </td>
	    <td nowrap="nowrap">
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
		    </select>	    </td>
	    
	    </tr>  	
	    <tr>
		<td>&nbsp;	</td>
		<td  nowrap="nowrap">	  
		    <div align="right">性别：		    </div>		</td>
		<td  nowrap="nowrap">
			<div align="left">
			   <select name="sex">
			    	<option value="">请选择</option>    
			    	<option value="男" <%=ui!=null&&ui.getUser_sex()!=null&&ui.getUser_sex().equals("男")?"selected":"" %>>男</option>
			    	<option value="女" <%=ui!=null&&ui.getUser_sex()!=null&&ui.getUser_sex().equals("女")?"selected":"" %>>女</option>
			    	</select>			</div>		</td>
		<td nowrap="nowrap">
		    <div align="right">联系电话：		    </div>	    </td>
	    <td nowrap="nowrap">
	    	<input name="phone" type="text" size="12" maxlength="12" value="<%=ui!=null?ui.getUser_phone():"" %>" >	    </td>
	    <td nowrap="nowrap">
		    <div align="right">最高学位：		    </div>	    </td>
	    <td nowrap="nowrap">
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
	    </select>	    </td>	    
	    
	    </tr>
	    <tr>
		<td>&nbsp;</td>
		<td nowrap="nowrap">
	    	<div align="right">电子邮箱：	    	</div>	    </td>
	    <td nowrap="nowrap">
	    	<input name="email" type="text" size="20" value="<%=ui!=null?ui.getUser_mail():"" %>">	    </td>
	    <td nowrap="nowrap">
	    	<div align="right">教研方向：	    	</div>	    </td>
	    <td nowrap="nowrap" colspan="5">
		    <input name="jyfx" type="text" value="<%=ui!=null?ui.getUser_jyfx():"" %>" size="45" maxlength="200" onKeyDown="gbcount(this.form.jyfx,this.form.jyfxtotal,this.form.jyfxused,this.form.jyfxremain);" onKeyUp="gbcount(this.form.jyfx,this.form.jyfxtotal,this.form.jyfxused,this.form.jyfxremain);"/>
		 	<p>最多字数：
			<input disabled maxLength="4" name="jyfxtotal" size="3" value="100" class="inputtext"/>
			已用字数：
			<input disabled maxLength="4" name="jyfxused" size="3" value="<%=ui!=null?(ui.getUser_jyfx().length()):"" %>" class="inputtext"/>
			剩余字数：
			<input disabled maxLength="4" name="jyfxremain" size="3" value="<%=ui!=null?(100-ui.getUser_jyfx().length()):"" %>" class="inputtext"/>
		</td>
		</tr> 
		<tr>
	    <td nowrap="nowrap">&nbsp;</td>
	    <td nowrap="nowrap">
	    	<div align="right">主讲课程：	    	</div>	    </td>
	    <td nowrap="nowrap" colspan="5">
	    	<input name="zjkc" type="text" value="<%=ui!=null?ui.getUser_zjkc():"" %>" size="45" maxlength="200" onKeyDown="gbcount(this.form.zjkc,this.form.zjkctotal,this.form.zjkcused,this.form.zjkcremain);" onKeyUp="gbcount(this.form.zjkc,this.form.zjkctotal,this.form.zjkcused,this.form.zjkcremain);"/>
		 	<p>最多字数：
			<input disabled maxLength="4" name="zjkctotal" size="3" value="120" class="inputtext"/>
			已用字数：
			<input disabled maxLength="4" name="zjkcused" size="3" value="<%=ui!=null?(ui.getUser_zjkc().length()):"" %>" class="inputtext"/>
			剩余字数：
			<input disabled maxLength="4" name="zjkcremain" size="3" value="<%=ui!=null?(120-ui.getUser_zjkc().length()):"" %>" class="inputtext"/>
		</td>
	    </tr>	    
	    <tr>
		<td>&nbsp;</td>
	    <td colspan="6">&nbsp;</td>
	    </tr>
	    <tr>
			<td>&nbsp;</td>
		    <td colspan="6" nowrap="nowrap">
			    <div align="center">
			    	<input name="save" type="submit" value="保存" class="button">
			    	<input name="cancel" type="reset" value="取消" class="button" onclick="javascript:window.location.href='<%=path+"/UserServlet?action=cancel" %>';">
		    </div></td>
	      </tr>
	    <tr>
		    <td colspan="7">&nbsp;		    </td>
	    </tr>
	    <tr>
		    <td colspan="7">&nbsp;		    </td>
	    </tr>
	    <tr>
		    <td colspan="7">&nbsp;		    </td>
	    </tr>
	     <tr>
		    <td colspan="7">&nbsp;		    </td>
	    </tr>		       
	</TABLE>		
	</form>
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