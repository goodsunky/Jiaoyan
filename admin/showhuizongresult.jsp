<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%@ include file="../common/getnecessaryinfo.jsp" %>
<%
	request.setCharacterEncoding("utf-8");	
	ArrayList<Jifenhuizong_Info> jfhzis=(ArrayList<Jifenhuizong_Info>)request.getAttribute("jifenhuizongresult");	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>教研积分汇总报表</title>
	<link href="<%=request.getServletPath() %>/css/style.css" rel="stylesheet" type="text/css"/>	
	<link href="../css/btn.css" rel="stylesheet" type="text/css"/>
	<link href="../css/resultstyle.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery/jquery.js"></script>
	<script type="text/javascript" src="../js/highslide-with-html.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/highslide.css" />
<script type="text/javascript">
		hs.graphicsDir = '../graphics/';
		hs.outlineType = 'rounded-white';
		hs.wrapperClassName = 'draggable-header';
</script>
</head>
<body style="margin:0px auto;">
 <table border="0" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >
				<tbody>
					<tr valign="top">
						<td >
							<div id="checkGroup" class="jive-thread-list">
								<div class="jive-table">
									<table summary="List of threads" cellpadding="0" cellspacing="0"  WIDTH=100% >
										<thead>
											<tr>																																		</th>
												<th width="1%" class="jive-first" nowrap="nowrap">
													编号												</th>
												<th width="2%" class="jive-first" nowrap="nowrap">
													姓名												</th>												
											</tr>
										</thead>										
										<tbody>
										<%
												int lineNo=1;
												for (Iterator<Jifenhuizong_Info> it = jfhzis.iterator(); it.hasNext();)
												 {
													/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
													Jifenhuizong_Info ji = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
												%>											
											<tr class="<%=classStr%>">												
												<td width="1%" nowrap="nowrap">
													<div align="center">
														<%=lineNo %>
													</div>
											  </td>												
												<td width="2%" nowrap="nowrap">
													<div align="center">
														<%=ji.getName()[lineNo] %>&nbsp;
													</div>
											  </td>													
											</tr>	
											<%
												lineNo++;
												}
											%>
										</tbody>
								  </table>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>		
</body>
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
<!--代码高亮end-->
</html>