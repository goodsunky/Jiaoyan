<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.jiaoyan.notice.*,java.util.* " %>
<%@ include file="_SessionCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");	
	//Notice_Info ni=(Notice_Info)session.getAttribute("nidetail");
	Notice_Info ni=(Notice_Info)request.getAttribute("nidetail");	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<Meta http-equiv="Content-Type" Content="text/html; Charset=utf-8">
	<title><%=ni.getNot_title() %> | 景德镇陶瓷学院教研与科研网</title>	
	<link href="css/pop.css" rel="stylesheet" type="text/css"/>
	<link href="css/filelink.css" rel="stylesheet" type="text/css"/>
	<script language="javascript" src="js/common.js"></script>
	<script language="javascript">FixSize(796, 615);</script>
	<script type="text/javascript">
 	function exitwindow()
 	{
 		if(confirm("您是否确定关闭此窗口？"))
 		{
 			window.parent.window.close();
 			window.parent.location = "about:blank";
 		}
 	} 	
	</script>
	
</head>
<body style="overflow:auto;overflow-x:hidden">
    <div class="pop">
        <div class="t">
            <div class="title"><%=ni.getNot_type() %></div>
        </div>
        <div class="b">
            <div class="bb">
                <div class="article">
                     <div class="atitle"><b><%=ni.getNot_title() %></b></div>
                     <div class="ainfo">发布时间： <%=ni.getNot_issuedate() %>&nbsp;来源：<%=ni.getNot_source() %>&nbsp;访问次数：<%=ni.getNot_hits() %></div>
                     <div class="acontent">
                    	<%=ni.getNot_content() %>
                    </div>
                    	<%
                    		if(ni.getNot_enclosure()!=null)
                    		{
                    		int index=ni.getNot_enclosure().lastIndexOf(".");
	    					String extName=ni.getNot_enclosure().substring(index + 1);
	    					if(extName!=null&&extName.equalsIgnoreCase("kdh")||extName.equalsIgnoreCase("caj")||extName.equalsIgnoreCase("pdf"))
	    						extName="pdf";
	    					if(extName!=null&&extName.equalsIgnoreCase("doc")||extName.equalsIgnoreCase("docx"))
	    						extName="doc";
	    					if(extName!=null&&extName.equalsIgnoreCase("xls")||extName.equalsIgnoreCase("xlsx"))
	    						extName="xls";
	    					if(extName!=null&&extName.equalsIgnoreCase("rar")||extName.equalsIgnoreCase("zip")||extName.equalsIgnoreCase("7-zip"))
	    						extName="rar";
	    					if(extName!=null&&extName.equalsIgnoreCase("txt"))
	    						extName="txt";
	    					String icon=extName+".gif";
                    	%>
                    	<div class="attachment" align="left">
                    	【附件】：
                    	<a href="upload/<%=ni.getNot_enclosure() %>" target="_blank"><img alt="" border="0" src="images/<%=icon %>" /><%=ni.getNot_enclosure() %></a>
                    	<p>
                    	请点击鼠标右键用“目标另存为” 方式下载                 	
					 	</div>    
					 <%
                    	}
                    	%>             
                <div class="button"><input name="button" type="button" class="button" onClick="javascript:exitwindow()" value="关闭窗口"/></div>
            </div>
         </div>
        <div class="f"></div>
    </div>
    </div>
</body>
</html>