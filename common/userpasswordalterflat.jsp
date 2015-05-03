<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="_SessionCheck.jsp" %>
<%@ include file="getnecessaryinfo.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户密码修改</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>	
<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript" src="../js/validatenumber.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/remaincount.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/checkexpertform.js" charset="gb2312"></script>
<SCRIPT language=JavaScript type="text/javascript" src="../js/ESONCalendar.js" charset="gb2312"></SCRIPT>
<script type="text/javascript" src="../js/highslide-with-html.js"></script>
<link rel="stylesheet" type="text/css" href="../css/filehighslide.css" />
		<script type="text/javascript">
		   function checkdata()
		   {
		     if(form.currentpassword.value=="")
		     {
		       alert("请输入原始密码！");
		       form.currentpassword.focus();
		       return false;
		     }else
		     	if(form.newpassword.value=="")
		     	{
		     	  alert("请输入新密码！");
		       	  form.newpassword.focus();
		       	  return false;
		     	}else
		     		if(form.confirmpassword.value=="")
		     		{
		     	  		alert("请再次输入新密码！");
		       	  		form.confirmpassword.focus();
		       	  		return false;
		     		}else
		     			if(form.confirmpassword.value!=form.newpassword.value)
		     			{
		     				alert("您两次输入的密码不相同，请重新输入！");
		       	  			form.confirmpassword.value="";
		       	  			form.newpassword.value="";
		       	  			form.newpassword.focus();
		       	  			return false;
		     			}
		   }
		</script>
		
	    <style type="text/css">
<!--
.STYLE1 {font-size: small}
-->
        </style>
</head>
<body style="margin:0px auto;">  
<div id="container">
<div id="content">
<div class="box2" panelTitle="用户密码修改">
		<form method="post" action="../UserServlet?action=alterpwd" name="form" onSubmit="return checkdata()">
		 <fieldset>
	    	<legend style="font-weight: bold;color: #0000FF ">更改您的密码</legend>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
				<tr>
					<td width="32%">
					  <div align="right"></div></td>
			        <td width="16%">&nbsp;&nbsp;&nbsp;键入您当前的密码：</td>
			        <td width="52%">&nbsp;</td>
			        <td width="0%">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">
					  <div align="center">
					    <input name="currentpassword" type="password"  size="60">
				        </div></td></tr>
				<tr>
					<td>
						<div align="right"></div></td>
			        <td>&nbsp;&nbsp;&nbsp;输入一个新密码：</td>
			        <td>&nbsp;</td>
			        <td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">
					  <div align="center">
					    <input name="newpassword" type="password" size="60">
				        </div></td></tr>
				<tr>
					<td>
						<div align="right"></div></td>
			        <td>&nbsp;&nbsp;&nbsp;再次输入密码以确认：</td>
			        <td>&nbsp;</td>
			        <td>&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="3">
				    <div align="center">
				       <input name="confirmpassword" type="password" size="60">
				    </div>				    </td>
				 </tr>
				<tr>
				  <td colspan="3"><div align="left"></div></td>
				</tr>
				<tr>
				  <td colspan="3"><div align="right">
				    <div align="right">
				      <div align="right"></div>
				    </div>
				  </div>
			      <div align="right"></div>
			      <div align="right"></div></td>
			    </tr>
				<tr>
				  <td colspan="3">
				    <div align="right"></div></td>
			    </tr>
				<tr>
				  <td colspan="3">	    
			        <div align="center">
			          <input name="alterbtn" type="submit"  value="更改" class="button">
			          <input type="reset" name="cancel" value="清空" class="button">
	                  </div>
	             </td>
			    </tr>				
			</table>
		  </fieldset>
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
</html>