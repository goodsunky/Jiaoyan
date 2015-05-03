<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jiaoyan.notice.*,java.util.*,com.jiaoyan.*" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%
	String path=request.getContextPath();
	Notice_Info ni=(Notice_Info)request.getAttribute("nidetail");
	PageBean pb=(PageBean)request.getAttribute("pagebean");
	String fname=ni.getNot_enclosure();
	session.removeAttribute("FileName");
	session.setAttribute("FileName",fname);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>		
		<title>教研管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
		<link href="<%=path+"/css/import_basic.css" %>" rel="stylesheet" type="text/css" />
		<link href="<%=path+"/skins/sky/import_skin.css" %>" rel="stylesheet" type="text/css" />
		<!--框架必需start-->		
		<script type="text/javascript" src="<%=path+"/js/jquery/jquery.js" %>"></script>
	    <script type="text/javascript" src="<%=path+"/js/framework.js" %>"></script>
		<!--框架必需end-->

		<!--富文本框必需start-->
		<link rel="stylesheet" type="text/css" href="<%=path+"/js/form/CLEditor/jquery.cleditor.css" %>" />
		<script type="text/javascript" src="<%=path+"/js/form/CLEditor/jquery.cleditor.js" %>"></script>
		<!--富文本框必需start-->
		
		<script type="text/javascript">
			function checkdata()
			{
				var fck = FCKeditorAPI.GetInstance("content"); 
    			var content = fck.GetXHTML(true); 			
				if(form.title.value=="")
				{
					alert("请输入标题！");
					document.form.title.focus();
					return false;
				}else
					if (content.replace(/ <(?!img|input|object)[^>]*>|\s+/ig, "") == "") 
					{ 
	        			alert("内容不能为空！"); 
	        			fck.Focus(); 
	        			return false; 
    				}
			}
			function checkcancel(id,pageno,countperpage)
			{
				var url="NoticeServlet?action=cancel&pageNo="+pageno+"&countperpage="+countperpage+"&notid="+id;
				window.location.href=url;
			}
		</script>
	</head>
<body>  
<div id="scrollContent">
<div class="box2" panelTitle="信息修改">
<TABLE WIDTH=100% height="40" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
	<td WIDTH="100%">		
 		<form action="NoticeServlet?action=doalter" method="post" name="form" onSubmit="return checkdata()"> 
 		<input type="hidden" name="pageNo" value="<%=pb.getPageNo() %>"/>
 		<input type="hidden" name="notid" value="<%=ni.getNot_id() %>"/>
 		<input type="hidden" name="countperpage" value="<%=pb.getNotice_Page_Size() %>"/>
 			 <table border="0" cellpadding="0" cellspacing="0" width="100%">
  		     <tbody>   
		      <tr>
		      	<td nowrap="nowrap" width="3%">                 
		               	&nbsp;&nbsp;类别：
				</td>
				<td nowrap="nowrap">					
					<select name="noticetype">
						<option value="重要公告" <%=ni!=null&&ni.getNot_type()!=null&&ni.getNot_type().equals("重要公告")?"selected":"" %>>重要公告</option>
						<option value="重要通知" <%=ni!=null&&ni.getNot_type()!=null&&ni.getNot_type().equals("重要通知")?"selected":"" %>>重要通知</option>
					</select>		
				</td>        
			 </tr>	 
			 <tr>
			 	<td nowrap="nowrap">                 
		               	&nbsp;&nbsp;标题：
				</td>
				<td align="left">
					<input name="title" type="text" size="60" value="<%=ni!=null&&ni.getNot_title()!=null?ni.getNot_title():"" %>"/>
				</td>
		      </tr>
		      <tr>
		      	<td nowrap="nowrap">                 
		               	&nbsp;&nbsp;附件：
				</td>
		      	<td>  				
					<iframe  src="admin/fileupload.jsp"  width="80%"  height="28px" frameborder="0" scrolling="no" name="fileframe"></iframe>
				</td>
		      </tr>
		      <tr>
		      	<td>
		      		&nbsp;&nbsp;内容：
		      	</td>
		      	<td>
		              	<textarea name="content" id="content" editorWidth="800" editorHeight="320" class="rich"><%=ni!=null&&ni.getNot_content()!=null?ni.getNot_content():"" %></textarea>
		      	</td>
		      </tr>
		      <tr>
		      	<td>&nbsp;&nbsp;</td>
		      	<td align="center">
		      		<input type="submit" class="button" value="提交"/>
		      		<input type="button" class="button" value="取消" onclick="javascript:checkcancel(<%=ni.getNot_id() %>,<%=pb.getPageNo() %>,<%=pb.getNotice_Page_Size() %>)"/>
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
