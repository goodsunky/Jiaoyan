<%@ include file="../common/_SessionCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="java.io.*,com.jspsmart.upload.*,java.util.*,java.text.* " %> 	
 
<html>
	<head>
		<title>正在导入数据...</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<!-- js文件和代码 -->
		<script type="text/javascript" src="../js/progress.js" charset="gb2312"></script>
	</head>
	<body id="go" style="top:200px;hight:800px">
		<div style="top:145px;width: expression(body.clientWidth);z-index: 100;border: none;">
			<table border="0" align="center" cellpadding="0" cellspacing="0">
				<br>
				<br>
				<tr>
					<td height="20" colspan="3" valign="top">
						<center><h2>数据正在处理中，请稍候……</h2></center>
					</td>
				</tr>
				<tr>
					<td colspan="3" valign="top">
						<table align="center">
							<tr>
								<td align="center">
								     <div id="progressBar" style="padding:2px;border:solid green 1px;visibility:hidden" align="left">
									       <div style="width:40px">
									                <%
									                	for(int j=1;j<=50;j++)
									                	{
									                %>
									                	<span id="block<%=j++ %>" style="width:2%;"></span>
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
			</table>   
		</div>
	</body>
</html>

<%
	request.setCharacterEncoding("utf-8");
	String action=(String)request.getParameter("action");
	String type=(String)request.getParameter("type");
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
			AllowedExtName="xls,xlsx";
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
			msg="只允许上传xls、xlsx类型文件!";
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
 %>
