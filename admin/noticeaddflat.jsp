<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>		
		<title>教研管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
		<link href="../skins/sky/import_skin.css" rel="stylesheet" type="text/css" />

		<!--框架必需start-->
		<script type="text/javascript" src="../js/jquery/jquery.js"></script>
	    <script type="text/javascript" src="../js/framework.js"></script>
		<!--框架必需end-->

		<!--富文本框必需start-->
		<link rel="stylesheet" type="text/css" href="../js/form/CLEditor/jquery.cleditor.css" />
		<script type="text/javascript" src="../js/form/CLEditor/jquery.cleditor.js"></script>
		<!--富文本框必需start-->
		
		<!--富文本框表格与表情图标插件start-->
		<script type="text/javascript" src="../js/form/CLEditor/jquery.cleditor.table.js"></script>
		<script type="text/javascript" src="../js/form/CLEditor/jquery.cleditor.icon.js"></script>
		<!--富文本框表格与表情图标插件end-->
		
		<script type="text/javascript">
			function checkdata()
			{
    			var content = document.getElementById("content").value;			
				if(form.title.value=="")
				{
					alert("请输入标题！");
					document.form.title.focus();
					return false;
				}else
					if (content.replace(/ <(?!img|input|object)[^>]*>|\s+/ig, "") == "") 
					{
	        			alert("内容不能为空！"); 
	        			document.form.content.focus();
	        			return false; 
    				}
			}
		</script>
	</head>
<body>  
<div id="scrollContent">
<div class="box2" panelTitle="信息发布" roller="true">
<TABLE WIDTH=100% height="40" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
	<td WIDTH="100%">		
 		<form action="../NoticeServlet?action=add" method="post" name="form" onSubmit="return checkdata()"> 
 			 <table border="0" cellpadding="0" cellspacing="0" width="100%">
  		     <tbody>   
		      <tr>
		      	<td nowrap="nowrap" width="3%">                 
		               	&nbsp;&nbsp;类别：
				</td>
				<td nowrap="nowrap">					
					<select name="noticetype">
						<option value="重要公告">重要公告</option>
						<option value="重要通知">重要通知</option>
					</select>		
				</td>        
			 </tr>	 
			 <tr>
			 	<td nowrap="nowrap">                 
		               	&nbsp;&nbsp;标题：
				</td>
				<td align="left">
					<input name="title" type="text" size="60" />
				</td>
		      </tr>
		      <tr>
		      	<td nowrap="nowrap">                 
		               	&nbsp;&nbsp;附件：
				</td>
		      	<td>  				
					<iframe  src="fileupload.jsp"  width="80%"  height="28px" frameborder="0" scrolling="no" name="fileframe"></iframe>
				</td>
		      </tr>
		      <tr>
		      	<td>
		      		&nbsp;&nbsp;内容：
		      	</td>
		      	<td>
		              	<textarea mode="full" name="content" id="content" editorWidth="800" editorHeight="320" class="rich"> </textarea>
		      	</td>
		      </tr>
		      <tr>
		      	<td>
		      		&nbsp;
		      	</td>
		      	<td>
		      		<input type="submit" class="button" size="40" value="提交"/>
		      	</td>
		      </tr>
    		 </tbody>
 			 </table>
		</form>
	</td>
</tr>
</TABLE>
</div>
</div>
</body>
</html>
