<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>

<%
	Expert_Info ei=(Expert_Info)session.getAttribute("eidetail");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>专家信息修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkexpertform.js" charset="gb2312"></script>
<SCRIPT language=JavaScript type="text/javascript" src="../js/ESONCalendar.js" charset="gb2312"  ></SCRIPT>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="专家信息修改(带*号必填)">
<form name="form" method="post" action="../ExpertServlet?action=doalter" onSubmit="return checkdata()">
<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
	<td width="0%" >&nbsp;	</td>
    <td width="8%" nowrap="nowrap"><div align="right">工号*：</div></td>
    <td width="13%"  nowrap="nowrap">
      <input name="gh" type="text" size="10" maxlength="6" value="<%=ei.getExpt_gh() %>">     </td>
	<td width="5%"  nowrap="nowrap"><div align="right">姓名*：</div></td>
	<td width="19%" nowrap="nowrap"><input name="name" type="text" size="10" value="<%=ei.getExpt_name() %>"></td>
	<td width="6%" nowrap="nowrap">	  
	    <div align="right">性别*：</div></td>
	<td width="49%" nowrap="nowrap">
		<div align="left">
		 <input type="radio" name="sex" value="男" <%=null!=ei.getExpt_sex()&&ei.getExpt_sex().equals("男")?"checked":"" %>>男
   		 <input type="radio" name="sex" value="女" <%=null!=ei.getExpt_sex()&&ei.getExpt_sex().equals("女")?"checked":"" %>>女   
		 </div>
    </td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	 <td nowrap="nowrap"><div align="right">所属学科*：</div></td>
    <td nowrap="nowrap">
    <select name="xueke">
    <option value="">--学科类别--</option>
    <%
    for (Iterator<Xueke_Info> it = xks.iterator(); it.hasNext();)
	{
		Xueke_Info xki = it.next();		
    %>
    <option value="<%=xki.getXueke_name() %>" <%=null!=ei.getExpt_xk_name()&&xki.getXueke_name().equals(ei.getExpt_xk_name())?"selected":"" %>><%=xki.getXueke_name() %>
    </option>
    <%
    }
    %>
    </select>    </td>        
    <td nowrap="nowrap"><div align="right">出生年月：</div></td>
    <td nowrap="nowrap">
    <select name="year">
    <option value="">请选择</option>
    <%
    	String birthday=ei.getExpt_birthday();
    	int yindex=0,year=0;
    	String stryear="",month="";
    	if(birthday!=null&&!birthday.equals("")&&birthday.indexOf(".")>=0)//有年和月
    	{ 
    		yindex=birthday.indexOf(".");    	
    		stryear=birthday.substring(0,yindex);
    		month=birthday.substring(yindex+1,yindex+3);
    		year=Integer.parseInt(stryear);
    	}else
    		if(birthday!=null&&!birthday.equals("")&&birthday.length()<5)//无月
    		{
    			year=Integer.parseInt(birthday);
    		}
    	int maxyear=Integer.parseInt(birthyear);
		for(int y=1900;y<=maxyear;y++)
    	{
    %>
    <option value="<%=y %>" <%=year==y?"selected":"" %>><%=y %></option>
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
    <option value="<%=mon %>" <%=null!=month&&month.equals(mon)?"selected":"" %>><%=mon %></option>
    <%
    }
    %>
    </select>
         月
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
       <option value="<%=di.getDept_name() %>" <%=null!=ei.getExpt_dept_name()&&di.getDept_name().equals(ei.getExpt_dept_name())?"selected":"" %>><%=di.getDept_name() %>
       </option>
      <%
    }}
    %>
    </select></td>
	</tr>
    <tr>
	<td>&nbsp;	</td>
    <td nowrap="nowrap"><div align="right">专业技术资格*：</div></td>
    <td nowrap="nowrap"><select name="position">
    <option value="">--职称名称--</option>
    <%
    for (Iterator<Position_Info> it = pis.iterator(); it.hasNext();)
	{
		Position_Info pi = it.next();		
    %>
     <option value="<%=pi.getPos_name() %>" <%=null!=ei.getExpt_pos_name()&&ei.getExpt_pos_name().equals(pi.getPos_name())?"selected":"" %>><%=pi.getPos_name() %>
     </option>
    <%
    }
    %>
    </select></td>
    <td nowrap="nowrap"><div align="right">移动电话*：</div></td>
    <td nowrap="nowrap"><input name="mobilephone" type="text" size="12" maxlength="11" value="<%=ei.getExpt_mphone() %>"></td>
    <td nowrap="nowrap"><div align="right">办公电话：</div></td>
    <td nowrap="nowrap"><input name="officephone" type="text" size="12" value="<%=ei.getExpt_ophone() %>"></td>
    </tr>  	
    <tr>
	<td>&nbsp;	</td>
    <td nowrap="nowrap"><div align="right">最高学位：</div></td>
    <td nowrap="nowrap"><select name="xuewei">    
    <option value="">--学位类别--</option>
    <%
    for (Iterator<Xuewei_Info> it = xws.iterator(); it.hasNext();)
	{
		Xuewei_Info xi = it.next();		
    %>
    <option value="<%=xi.getXuewei_name() %>" <%=null!=ei.getExpt_xw_name()&&ei.getExpt_xw_name().equals(xi.getXuewei_name())?"selected":"" %>><%=xi.getXuewei_name() %>
    </option>
    <%
    }
    %>
    </select></td>
    <td nowrap="nowrap"><div align="right">住宅电话：</div></td>
    <td nowrap="nowrap"><input name="homephone" type="text" size="12" value="<%=ei.getExpt_hphone() %>"></td>
    <td nowrap="nowrap"><div align="right">电子邮箱：</div></td>
    <td nowrap="nowrap"><input name="email" type="text" size="20" value="<%=ei.getExpt_mail() %>"></td>
    </tr>
     <tr>
	<td>&nbsp;</td>
    <td nowrap="nowrap"><div align="right">教研方向*：</div></td>
    <td colspan="3" nowrap="nowrap">
    <input name="jyfx" type="text" value="<%=ei.getExpt_jyfx() %>" size="44" maxlength="200" onKeyDown="gbcount(this.form.jyfx,this.form.jyfxtotal,this.form.jyfxused,this.form.jyfxremain);" onKeyUp="gbcount(this.form.jyfx,this.form.jyfxtotal,this.form.jyfxused,this.form.jyfxremain);">
 	<p>最多字数：
	<input disabled maxLength="4" name="jyfxtotal" size="3" value="100" class="inputtext">
	已用字数：
	<input disabled maxLength="4" name="jyfxused" size="3" value="<%=ei.getExpt_jyfx().length() %>" class="inputtext">
	剩余字数：
	<input disabled maxLength="4" name="jyfxremain" size="3" value="<%=100-ei.getExpt_jyfx().length() %>" class="inputtext">
	</td> 
    <td nowrap="nowrap"><div align="right">主讲课程：</div></td>
    <td nowrap="nowrap">
    <input name="zjkc" type="text" value="<%=ei.getExpt_zjkc() %>" size="42" maxlength="200" onKeyDown="gbcount(this.form.zjkc,this.form.zjkctotal,this.form.zjkcused,this.form.zjkcremain);" onKeyUp="gbcount(this.form.zjkc,this.form.zjkctotal,this.form.zjkcused,this.form.zjkcremain);">
 	<p>最多字数：
	<input disabled maxLength="4" name="zjkctotal" size="1" value="120" class="inputtext">
	已用字数：
	<input disabled maxLength="4" name="zjkcused" size="1" value="<%=ei.getExpt_zjkc().length() %>" class="inputtext">
	剩余字数：
	<input disabled maxLength="4" name="zjkcremain" size="1" value="<%=120-ei.getExpt_zjkc().length() %>" class="inputtext">
	</td>
    </tr>
    <tr>
	<td height="151">&nbsp;</td>
    <td nowrap="nowrap"><div align="right">入库条件：</div></td>
    <td colspan="3" nowrap="nowrap">
		<textarea name="rktj" rows="10" wrap=PHYSICAL cols="35" onKeyDown="gbcount(this.form.rktj,this.form.rktjtotal,this.form.rktjused,this.form.rktjremain);" onKeyUp="gbcount(this.form.rktj,this.form.rktjtotal,this.form.rktjused,this.form.rktjremain);"><%=ei.getExpt_rktj() %></textarea>
		<p>最多字数：
		<input disabled maxLength="4" name="rktjtotal" size="2" value="500" class="inputtext">
		已用字数：
		<input disabled maxLength="4" name="rktjused" size="2" value="<%=ei.getExpt_rktj().length() %>" class="inputtext">
		剩余字数：
		<input disabled maxLength="4" name="rktjremain" size="2" value="<%=500-ei.getExpt_rktj().length() %>" class="inputtext">
	</td>
    <td nowrap="nowrap"><div align="right">主要教研成绩：</div></td>
    <td nowrap="nowrap">
	     <textarea name="jycj" rows="10" wrap=PHYSICAL cols="35" onKeyDown="gbcount(this.form.jycj,this.form.jycjtotal,this.form.jycjused,this.form.jycjremain);" onKeyUp="gbcount(this.form.jycj,this.form.jycjtotal,this.form.jycjused,this.form.jycjremain);"><%=ei.getExpt_jycj() %></textarea>
		<p>最多字数：
		<input disabled maxLength="4" name="jycjtotal" size="1" value="500" class="inputtext">
		已用字数：
		<input disabled maxLength="4" name="jycjused" size="1" value="<%=ei.getExpt_jycj().length() %>" class="inputtext">
		剩余字数：
		<input disabled maxLength="4" name="jycjremain" size="1" value="<%=500-ei.getExpt_jycj().length() %>" class="inputtext">
	</td>
    </tr>
    <tr>
	<td>&nbsp;</td>
    <td nowrap="nowrap"><div align="right">入库时间：</div></td>
    <td colspan="3" nowrap="nowrap">
	    <input name="rksj" type="text" size="12" maxlength="11" id="rksj" value="<%=ei.getExpt_rksj() %>">
		(填写格式，"YYYY-MM-DD")		
	</td>
    <td nowrap="nowrap"><div align="right">出库时间：</div></td>
    <td nowrap="nowrap">
    	<input name="cksj" type="text" size="12" id="cksj" value="<%=ei.getExpt_cksj() %>">
		(仅专家出库时才填写)
		
	</td>
    </tr>
    <tr>
	<td>&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td colspan="2" nowrap="nowrap"><div align="right"></div>      </td>
    </tr>
    <tr>
	<td>&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td nowrap="nowrap">&nbsp;</td>
    <td nowrap="nowrap"><div align="right"><input name="save" type="submit" value="保存" class="button"></div></td>
    <td colspan="2" nowrap="nowrap"><div align="left">&nbsp;&nbsp;<input name="cancel" type="reset" value="取消" class="button" onclick="javascript:window.location.href='../ExpertServlet?action=cancel';"></div></td>
    </tr>
    <tr>
		    <td colspan="7">
		     &nbsp;
		    </td>
	    </tr>
	    <tr>
		    <td colspan="7">
		     &nbsp;
		    </td>
	    </tr>
	    <tr>
		    <td colspan="7">
		     &nbsp;
		    </td>
	    </tr>	
	    <tr>
		    <td colspan="7">
		     &nbsp;
		    </td>
	    </tr>
	    <tr>
		    <td colspan="7">
		     &nbsp;
		    </td>
	    </tr>
	    <tr>
		    <td colspan="7">
		     &nbsp;
		    </td>
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
</script>
<script type="text/javascript"> 
	ESONCalendar.bind("rksj");
</script>
<!--代码高亮end-->
</html>