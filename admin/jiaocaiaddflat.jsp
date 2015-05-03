<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教材与论著信息录入</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkjiaocaiform.js" charset="gb2312"></script>
<SCRIPT language=JavaScript type="text/javascript" src="../js/ESONCalendar.js" charset="gb2312"></SCRIPT>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';
</script>

</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="教材与论著信息录入（带*号必填）">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>
			<td width="5%">
			   	 &nbsp;&nbsp;&nbsp;&nbsp;<a  href="exportfile.jsp?type=JiaocaiToMysql"  target="_blank" onClick="return hs.htmlExpand(this, { objectType: 'iframe' } )"><img alt="导入数据" border="0" src="../images/import.jpg"></a>
		    </td>
		    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="../upload/moban/jiaocaimoban.xls" target="_blank"><u>模版</u></a></td>
		</tr>
	</table>
	<br>
	<form name="form" method="post" action="../JiaocaiServlet?action=add" onSubmit="return checkdata()">
	<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<tr>		
	    <td width="7%" nowrap="nowrap">
		    <div align="right">档案号：		    </div>	    </td>
	    <td width="13%"  nowrap="nowrap">
	        <input name="danganhao" type="text" id="danganhao" size="10" >	    </td>
		<td width="8%"  nowrap="nowrap">
			<div align="right">教材名称*：			</div>		</td>
		<td width="23%" nowrap="nowrap">
			<div align="left">
				<input name="jcmc" type="text" id="jcmc" size="40">
			</div>		</td>
		<td width="7%" nowrap="nowrap">	  
		    <div align="right">主编*：		    </div>		</td>
		<td width="42%" nowrap="nowrap">
			<div align="left">
			  <input name="zhubian" type="text" id="zhubian" size="10" >
			</div>		</td>
	</tr>	
	<tr>		
		<td nowrap="nowrap"><div align="right">出版时间*：</div></td>
		<td nowrap="nowrap"><select name="cbsjyear">
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
  <select name="cbsjmonth">
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
    <option value="<%=mon %>"><%=mon %></option>
    <%
		    }
		    %>
  </select>
		  月</td>
		<td nowrap="nowrap"><div align="right">出版社名：</div></td>
	    <td nowrap="nowrap"><input name="cbsm" type="text" id="cbsm" size="20"></td>
	    <td nowrap="nowrap"><div align="right">图书编号：</div></td>
	    <td nowrap="nowrap"><input name="tsbh" type="text" id="tsbh" size="15" ></td>
	</tr>
	    <tr>		
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
            <option value="<%=di.getDept_name() %>"><%=di.getDept_name() %></option>
            <%}
			    }
			    %>
        </select></td>
	    <td nowrap="nowrap"><div align="right">绩效总分*：</div></td>
	    <td nowrap="nowrap"><input name="jxzf" type="text" id="jxzf" size="10" ></td>
	    <td nowrap="nowrap"><div align="right">教材类别：</div></td>
	    <td nowrap="nowrap">
		<select name="jclb">
          <option value="">--教材类别--</option>
          <%
			    for (Iterator<Jiaocaijifen_Info> it = jcjfis.iterator(); it.hasNext();)
				{
					Jiaocaijifen_Info jcjfi = it.next();		
					if(!jcjfi.getJcjf_khzb().equals(""))
					{
			    %>
          <option value="<%=jcjfi.getJcjf_khzb() %>" ><%=jcjfi.getJcjf_khzb() %></option>
          		<%}
			    }
			    %>
        </select>	

		</td>
	    </tr>  	
		  	
		 <tr>		
	    <td><div align="right">副主编：</div></td>
	    <td><input name="fuzhubian" type="text"  size="10" ></td>
	    <td><div align="right">参编人员1：</div></td>
	    <td><input name="member1" type="text"  size="5" ></td>
	    <td><div align="right">参编人员2：</div></td>
	    <td><input name="member2" type="text"  size="5" ></td>
		 </tr>
		 <tr>		
	    <td><div align="right">参编人员3：</div></td>
	    <td><input name="member3" type="text"  size="5" ></td>
	    <td><div align="right">参编人员4：</div></td>
	    <td><input name="member4" type="text"  size="5" ></td>
	    <td><div align="right">参编人员5：</div></td>
	    <td><input name="member5" type="text"  size="5" ></td>
		 </tr>
		   <tr>		
	    <td nowrap="nowrap"><div align="right">参编人员6：</div></td>
	    <td nowrap="nowrap" colspan="5"><input name="member6" type="text"  size="30" >（若有多个成员请用&隔开，如：张三&李四） </td>
	    </tr>
	    <tr>		
	    <td nowrap="nowrap">
	    	<div align="right">备注：	    	</div>	    </td>
	    <td colspan="5" nowrap="nowrap">
			<textarea name="remark" rows="10" wrap=PHYSICAL cols="70" onKeyDown="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);" onKeyUp="gbcount(this.form.remark,this.form.remarktotal,this.form.remarkused,this.form.remarkremain);"></textarea>
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
				<input name="cancel" type="reset" value="清空" class="button">			    	    
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