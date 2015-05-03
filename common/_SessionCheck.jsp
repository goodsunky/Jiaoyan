<%
int screenWidth = ((int)java.awt.Toolkit.getDefaultToolkit().getScreenSize().width);
int screenHeight = ((int)java.awt.Toolkit.getDefaultToolkit().getScreenSize().height);	
int availwidth=screenWidth-(int)(screenWidth*0.18);
int availheight=screenHeight-(int)(screenHeight*0.49);
String islogined=(String)session.getAttribute("loginid");
String loginurl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/login.jsp";
if(islogined==null)
{
	
	out.print("<script>window.top.location='"+loginurl+"'</script>");
	//response.sendRedirect(url);
}
%>