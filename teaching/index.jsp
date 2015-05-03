<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/_SessionCheck.jsp" %>
<%
String username=(String)session.getAttribute("username");
String jiaogonghao=(String)session.getAttribute("loginid");	
String dept=(String)session.getAttribute("department");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>景德镇陶瓷学院教研与科研综合绩效管理系统</title>
		<!--框架必需start-->
		<link href="../css/import_basic.css" rel="stylesheet" type="text/css" />
		<link href="../skins/sky/import_skin.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery/jquery.js"></script>
		<script type="text/javascript" src="../js/bsFormat.js"></script>
		<!--框架必需end-->

		<!--引入组件start-->
		<script type="text/javascript" src="../js/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="../js/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		
		<!--修正IE6支持透明png图片start-->
		<script type="text/javascript" src="../js/method/pngFix/supersleight.js"></script>
		<!--修正IE6支持透明png图片end-->
		<style type="text/css">
.imcm ul,.imcm li,.imcm div,.imcm span,.imcm a {
	text-align: left;
	vertical-align: top;
	padding: 0px;
	margin: 0;
	list-style: none outside none;
	border-style: none;
	background-image: none;
	clear: none;
	float: none;
	display: block;
	position: static;
	overflow: visible;
	line-height: normal;
}

.imcm li a img {
	display: inline;
	border-width: 0px;
}

.imcm span {
	display: inline;
}

.imcm .imclear,.imclear {
	clear: both;
	height: 0px;
	visibility: hidden;
	line-height: 0px;
	font-size: 1px;
}

.imcm .imsc {
	position: relative;
}

.imcm .imsubc {
	position: absolute;
	visibility: hidden;
}

.imcm li {
	list-style: none;
	font-size: 1px;
	float: left;
}

.imcm ul ul li {
	width: 100%;
	float: none !important;
}

.imcm a {
	display: block;
	position: relative;
}

.imcm ul .imsc,.imcm ul .imsubc {
	z-index: 10;
}

.imcm ul ul .imsc,.imcm ul ul .imsubc {
	z-index: 20;
}

.imcm ul ul ul .imsc,.imcm ul ul ul .imsubc {
	z-index: 30;
}

.imde ul li:hover .imsubc {
	visibility: visible;
}

.imde ul ul li:hover  .imsubc {
	visibility: visible;
}

.imde ul ul ul li:hover  .imsubc {
	visibility: visible;
}

.imde li:hover ul  .imsubc {
	visibility: hidden;
}

.imde li:hover ul ul .imsubc {
	visibility: hidden;
}

.imde li:hover ul ul ul  .imsubc {
	visibility: hidden;
}

.imcm .imea {
	display: block;
	position: relative;
	left: 0px;
	font-size: 1px;
	line-height: 1px;
	height: 0px;
	width: 1px;
	float: right;
}

.imcm .imea span {
	display: block;
	position: relative;
	font-size: 1px;
	line-height: 0px;
}

.dvs,.dvm {
	border-width: 0px
} /*\*/ /*/.imcm .imea{visibility:hidden;}/**/
</style>
		<!--[if IE]><style type="text/css">.imcm .imea span{position:absolute;}.imcm .imclear,.imclear{display:none;}.imcm{zoom:1;} .imcm li{curosr:hand;} .imcm ul{zoom:1}.imcm a{zoom:1;}</style><![endif]-->
		<!--[if gte IE 7]><style type="text/css">.imcm .imsubc{background-image:url(ie_css_fix);}</style><![endif]-->
		<!--end-->
<style>
a {
	behavior: url(../js/method/focus.htc)
}
</style>
<script type="text/javascript">
 	function loginoff()
 	{
 		if(confirm("您确定要退出系统吗？"))
 		{
 			window.parent.location='../LoginServlet?action=loginoff';
 		} 		
 	}
</script>
	</head>
	<body>
		<div id="floatPanel-1"></div>
		<div id="mainFrame">
			<!--头部与导航start-->
			<div id="hbox">
				<div id="bs_bannercenter">
					<div id="bs_bannerleft">
						<div id="bs_bannerright">
							<div class="bs_banner_logo"></div>
							<div class="bs_banner_title"></div>
							<div class="bs_nav">
								<div class="bs_navleft">
									<li>
										欢迎<%=username %>用户，今天是
										<script>
											var weekDayLabels = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
											var now = new Date();
										    var year=now.getFullYear();
											var month=now.getMonth()+1;
											var day=now.getDate()
										    var currentime = year+"年"+month+"月"+day+"日 "+weekDayLabels[now.getDay()];
											document.write(currentime);
										</script>
									</li>
									<div class="clear"></div>
								</div>
								<div class="bs_navright">
									<span class="icon_no hand" onclick="javascript:loginoff();">退出系统</span>
									<div class="clear"></div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--头部与导航end-->

			<table width="100%" cellpadding="0" cellspacing="0"
				class="table_border0">
				<tr>
					<!--左侧区域start-->
					<td id="hideCon" class="ver01 ali01">
						<div id="lbox">
							<div id="lbox_topcenter">
								<div id="lbox_topleft">
									<div id="lbox_topright">
										<div class="lbox_title">
											操作菜单
										</div>
									</div>
								</div>
							</div>
							<div id="lbox_middlecenter">
								<div id="lbox_middleleft">
									<div id="lbox_middleright">
										<div id="bs_left">
											<div class="padding_top10">
												<div class="imrcmain0 imgl imenus_v_main">
													<div class="imcm imde" id="imouter0" class="imouter_v">
														<ul id="imenus0" class="imenus_v">
															<li class="imatm" style="width: 100%;">
																<a href="../NoticeServlet?action=liulang" target="frmright">
																<span class="imea imeam_icon2"><span></span></span>
																公告通知</a>
															</li>


															<li class="imatm" style="width: 100%;">
																<a><span class="imea imeam"><span></span>
																</span><span class="imea imeam_icon6"><span></span>
																</span>专家库管理</a>

																<div class="imsc">
																	<div class="imsubc"
																		style="width: 156px; top: -30px; left: 159px;">
																		<div class="imunder"></div>
																		<div></div>
																		<ul style="">
																			<li>
																				<a href="../ExpertServlet?action=addflat" target="frmright">专家录入</a>
																			</li>
																			<li>
																				<a href="../ExpertServlet?action=searchflat" target="frmright">查询与修改</a>
																			</li>
																			<li>
																				<a href="../ExpertServlet?action=chouquflat" target="frmright">专家抽取</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</li>


															<li class="imatm" style="width: 100%;">
																<a><span class="imea imeam"><span></span>
																</span><span class="imea imeam_icon3"><span></span>
																</span>教研项目管理</a>
																<div class="imsc">
																	<div class="imsubc"
																		style="width: 156px; top: -130px; left: 159px;">
																		<div class="imunder"></div>
																		<div></div>
																		<ul style="">
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>教改课题</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/jiaogaiaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../JiaogaiServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>课程建设</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/kechengaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../KechengServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>多媒体课件</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/multimediaaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../MultimediaServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>教材</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/jiaocaiaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../JiaocaiServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>教学获奖</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/huojiangaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../HuojiangServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>专业与示范中心</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/zhuangyeaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../ZhuangyeServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			
																			<li>
																				<a><span class="imea imeas"><span></span>
																				</span>卓越工程师和专业综合</a>
																				<div class="imsc">
																					<div class="imsubc"
																						style="width: 150px; top: -65px; left: 138px;">
																						<div class="imunder"></div>
																						<div></div>
																						<ul style="">
																							<li>
																								<a href="../admin/zhuoyueaddflat.jsp" target="frmright">信息录入</a>
																							</li>
																							<li>
																								<a href="../ZhuoyueServlet?action=searchflat" target="frmright">查询与修改</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																			
																		</ul>
																	</div>
																</div>
															</li>

															

															<li class="imatm" style="width: 100%;">
																<a href="../JifenhuizongServlet?action=teachinghuizongflat&jylx=教研" target="frmright">
																<span class="imea imeam_icon1"><span></span></span>
																绩效分汇总</a>
															</li>



															<li class="imatm" style="width: 100%;">
																<a><span class="imea imeam"><span></span>
																</span><span class="imea imeam_icon7"><span></span>
																</span>积分量化和分配办法</a>

																<div class="imsc">
																	<div class="imsubc"
																		style="width: 156px; top: -30px; left: 159px;">
																		<div class="imunder"></div>
																		<div></div>
																		<ul style="">
																			<li>
																				<a href="../admin/jiaogaijifenflat.jsp" target="frmright">教改项目</a>
																			</li>
																			<li>
																				<a href="../admin/kechengjifenflat.jsp" target="frmright">课程建设</a>
																			</li>
																			<li>
																				<a href="../admin/multimediajifenflat.jsp" target="frmright">多媒体课件</a>
																			</li>
																			<li>
																				<a href="../admin/jiaocaijifenflat.jsp" target="frmright">教材</a>
																			</li>
																			<li>
																				<a href="../admin/huojiangjifenflat.jsp" target="frmright">教学获奖</a>
																			</li>
																			<li>
																				<a href="../admin/zhuangyejifenflat.jsp" target="frmright">专业与示范中心</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</li>
															
															<li class="imatm" style="width: 100%;">
																<a href="../teacher/personalinfo.jsp?gh=<%=jiaogonghao %>&dept=<%=dept %>" target="frmright">
																<span class="imea imeam_icon11"><span></span></span>
																个人信息</a>
															</li>

															<li class="imatm" style="width: 100%;">
																<a href="../common/userpasswordalterflat.jsp" target="frmright">
																<span class="imea imeam_icon10"><span></span></span>
																密码修改</a>
															</li>

														</ul>
														<div class="imclear">
															&nbsp;
														</div>
													</div>
												</div>

											</div>
										</div>
										<!--更改左侧栏的宽度需要修改id="bs_left"的样式-->
									</div>
								</div>
							</div>
							<div id="lbox_bottomcenter">
								<div id="lbox_bottomleft">
									<div id="lbox_bottomright">
										<div class="lbox_foot"></div>
									</div>
								</div>
							</div>
						</div>
					</td>
					<!--左侧区域end-->

					<!--中间栏区域start-->
					<td class="main_shutiao">
						<div class="bs_leftArr" id="bs_center" title="收缩面板"></div>
					</td>
					<!--中间栏区域end-->

					<!--右侧区域start-->
					<td class="ali01 ver01" width="100%">
						<div id="rbox">
							<!--
							<div id="rbox_topcenter">
								<div id="rbox_topleft">
									<div id="rbox_topright">
										<div class="rbox_title">
											操作内容
										</div>
									</div>
								</div>
							</div>
							-->
							<div id="rbox_middlecenter">
								<div id="rbox_middleleft">
									<div id="rbox_middleright">
										<div id="bs_right">
											<IFRAME scrolling="yes" width="100%" frameBorder=0 id=frmright
												name=frmright src="../common/open.jsp"
												allowTransparency="true"></IFRAME>
										</div>
									</div>
								</div>
							</div>
							<!--  
							<div id="rbox_bottomcenter">
								<div id="rbox_bottomleft">
									<div id="rbox_bottomright">

									</div>
								</div>
							</div>
							-->
						</div>
					</td>
					<!--右侧区域end-->
				</tr>
			</table>

			<!--尾部区域start-->
			<div id="fbox">
				<div id="bs_footcenter">
					<div id="bs_footleft">
						<div id="bs_footright">
							<%@ include file="../common/footer.jsp" %>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--尾部区域end-->

		<!--浏览器resize事件修正start-->
		<div id="resizeFix"></div>
		<!--浏览器resize事件修正end-->
		<!--载进度条start-->
		<div class="progressBg" id="progress" style="display:none;"><div class="progressBar"></div></div>
		<!--载进度条end-->
		<script language="JavaScript" src="../js/menu/ocscript_v.js" type="text/javascript"></script>
	</body>
</html>
