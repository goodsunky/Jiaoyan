<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="_SessionCheck.jsp" %>
<%
	request.setCharacterEncoding("gbk");
	String backurl=(String)request.getParameter("backurl");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>景德镇陶瓷学院教研与科研综合绩效管理系统</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>		
</head>
<body>
<br/>
<br/>
<div align="center">
	<span id="time" >5</span>秒后自动跳转，如果不跳转，请点击下面链接<br>
	<script language="JavaScript1.2" type="text/javascript">
	function delayURL(url) {
	    var delay=document.getElementById("time").innerHTML;
	    if(delay>=1)
	    {
	      delay--;
	      document.getElementById("time").innerHTML=delay;      
	    }
	    else
	    {
	       window.location.href=url;
	    }
	    setTimeout("delayURL('"+url+"')",1000);
	}
	</script>
	<a href="<%=backurl %>"  target=mainFrame onClick="delayURL('<%=backurl %>')">返回继续操作</a>
	<script type="text/javascript">
  		delayURL("<%=backurl%>");
	</script>
</div>
</body>
</html>