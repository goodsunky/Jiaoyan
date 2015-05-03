<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ page import="java.io.*,com.jspsmart.upload.*,java.util.*,java.text.* " %> 	
<%
	request.setCharacterEncoding("utf-8");
	session.removeAttribute("FileName");
	String action=(String)request.getParameter("action");
	String type=(String)request.getParameter("type");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>请选择上传的图片</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
	    <link href="../css/style.css" rel="stylesheet" type="text/css"/>	
		<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="../js/progress.js" charset="gb2312"></script>
		<script type="text/javascript">
			function checkpath()
			{
				var path=document.all.file;
				if(path.value=="")
				{
					alert("请选择要导入的Excel文件(2003版本)！");
					return false;
				}
			}
		</script>
	</head>
	<body leftmargin=0 topmargin="0" style="margin:0;padding:0;">
		<table border="0" align="left" cellpadding="0" cellspacing="0" width="100%" height="100px">
			<tr>
				<td align="left" valign="left">
					<form action="exportfile.jsp?action=import&type=<%=type %>" method="post" enctype="multipart/form-data" name="form1" onsubmit="return checkpath()">
						<input type="file" name="file" class="button2">
						<input type="submit" name="Submit" class="button2" value="导入">
					</form>
				</td>
			</tr>
			<%
				if(action!=null&&"import".equals(action))
				{
			%>
				<tr>
					<td valign="top" align="left">
						正在导入数据，请稍候……
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table align="left">
							<tr>
								<td align="center">
								     <div id="progressBar" style="padding:2px;border:solid grey 1px;visibility:hidden;" align="left">
									       <div style="width:150px;height:10px;">
									                <%
									                	for(int j=1;j<=50;j++)
									                	{
									                %>
									                	<span id="block<%=j %>" style="width:3px;height:12px;"></span>
									                <%
									                	}
									                %>
									        </div>
								      </div>
								 </td>
								 <td align="center" id="finish"></td>
							</tr>
							<tr>
								<td align="center" id="complete">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>


<%
	if(action!=null&&"import".equals(action))
	{
		SmartUpload su=new SmartUpload();
		long file_size_max=10000000;//10MB
		String fileName="",ext="";
		//初始化
		su.initialize(pageContext);  
		//只允许上载此类文件 
		try 
		{
			String AllowedExtName="";
			if(action!=null&&action.equals("import"))
				AllowedExtName="xls";
			else
			 	AllowedExtName="rar,xls,xlsx,doc,docx,zip";
			su.setAllowedFilesList(AllowedExtName);
			//此处的文件格式可以根据需要自己修改  
			//上载文件 
			su.upload();
		}catch (Exception e)
		{
			String msg="";
			if(action!=null&&action.equals("import"))
				msg="只允许导入xls类型文件!";
			else
				msg="只允许上传xls、xlsx\\nrar、zip、doc、docx\\n类型文件!";
			out.println("<SCRIPT language=javascript>alert('"+msg+"');history.go(-1);</script>");	
		}
		try
		{
		    com.jspsmart.upload.SmartFile sf = su.getFiles().getFile(0);  
		    if (sf.isMissing())
		    {
		    	out.println("<SCRIPT language=javascript>alert('请先选择要导入Excel文件');history.go(-1);</script>");
	        } 
			else
			{ 
			  fileName=sf.getFileName();//取得上载的文件的文件名		   
			  if(fileName!=null)
			  {
			  	 int i = fileName.lastIndexOf('.');
	        	 String temp = fileName.substring(0,i);
			  	 fileName=temp;
			  }
			  ext= sf.getFileExt();//取得后缀名   
			  int file_size=sf.getSize(); //取得文件的大小  		  
			  String saveurl="";  
		      if(file_size<file_size_max)
			  {  
				  saveurl=application.getRealPath("/")+"upload/";  
				  if(action!=null&&action.equals("import"))	
				  {
				  	 SimpleDateFormat ssdf=new SimpleDateFormat("yyyyMMddhhmmss");   
				 	 String date=ssdf.format(new java.util.Date());
				 	 fileName=date;
				  }
				  fileName=fileName+"."+ext;
				  saveurl+=fileName ;//保存路径	
				  //System.out.println(saveurl);
				  sf.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
				  session.removeAttribute("FileName");
				  session.setAttribute("FileName",fileName);	
				  String url="";
				  if(action!=null&&action.equals("import"))
				  {		  
				  	 //url="../ExcelServlet?type="+type;
				  	 out.println("<SCRIPT language=javascript>go('../ExcelServlet?type="+type+"','result.jsp');</script>");
				  }
				  else
				  {
				  	 url="fileupload.jsp";
				  	 out.println("<SCRIPT language=javascript>window.location='"+url+"';</script>");
				  }		 
			  }else
			  {
			  	out.println("<SCRIPT language=javascript>alert('文件大小不能超过10MB！');history.go(-1);</script>");
			  }  
			}//else 
	   }//try
	   catch (Exception e)
	   {  
	      out.print(e.toString());   
	   } 
	}
 %>

