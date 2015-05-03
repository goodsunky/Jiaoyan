<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String filename=(String)session.getAttribute("FileName");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>上传附件</title>
		<link href="../css/style.css" rel="stylesheet" type="text/css"/>
		<link href="../css/filelink.css" rel="stylesheet" type="text/css"/>
		<link href="../css/btn.css" rel="stylesheet" type="text/css"/>	
		<link href="../css/filestyle.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="../js/jquery/jquery.js"></script>
		<script type="text/javascript">
		function checkpath()
		{
			 var path=document.all.filepath.value;
     		 if(path=="")
      		 {
      		 	alert("请选择要上传的附件！");
      		 	return false;
      		 }else
				showProgress();   
		}
		</script>
	</head>
	<body leftmargin="0" rightmargin="0">		
		<form action="dofileupload.jsp" method="post" enctype="multipart/form-data" name="form1" target="fileframe" onsubmit="return checkpath()"> 
			<input type="file" class="button2" name="filepath">
			<input type="submit" name="Submit" class="button2" value="上传">
			<%
				if(filename!=null)
				{
			%>
			<a href="../upload/<%=filename %>" target="_blank">右击另存为下载</a>	
			<%
			}
			%>
		</form>			
	</body>
</html>
