<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% 
		if(jycji!=null&&jycji.getZhyis()!=null&&jycji.getZhyis().size()!=0)
		{
			%>
			<fieldset>
			<legend style="font-weight: bold; ">【专业与示范中心建设信息】</legend>	
			<table border="0" class="jive-table" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >
				<thead>
					<tr>
						<th width="1%"  nowrap="nowrap">
							编号												
						</th>						
						<th width="1%"  nowrap="nowrap">
							项目名称											
						</th>
						<th width="1%"  nowrap="nowrap">
							立项时间											
						</th>
						<th width="1%"  nowrap="nowrap">
							结题时间											
						</th>						
						<th width="1%"  nowrap="nowrap">
							项目类别
						</th>																							
						<th width="1%"  nowrap="nowrap">
							申报人												
						</th>	
						<th width="1%" nowrap="nowrap" >
							所在部门
						</th>					
			</tr>
			</thead>								
			<tbody>
			<%
					int lineNo=1;
					for (Iterator<Zhuangye_Info> it = jycji.getZhyis().iterator(); it.hasNext();)
					 {
						/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
						Zhuangye_Info zhyi = it.next();
						String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
					%>											
				<tr class="<%=classStr%>">	
					<td width="1%" >
						<div align="center">
							<%=lineNo %>													
						</div>											  
					</td>												
					<td width="1%">
						<div align="center">
							<%=zhyi.getZhy_xmmc() %>&nbsp;													
						</div>											  
					</td>
					<td width="1%">
						<div align="center">
							<%=zhyi.getZhy_lxsj() %>&nbsp;													
						</div>											  
					</td>							
					
					<td width="1%">
						<div align="center">
							<%=zhyi.getZhy_jtsj() %>&nbsp;													
						</div>											  
					</td>						
					<td width="1%" >
						<div align="center">
							<%=zhyi.getZhy_xmlb() %>&nbsp;													
						</div>											  
					</td>
					<td width="1%" >
						<div align="center">
							<%=zhyi.getZhy_shenbaoren() %>&nbsp;													
						</div>												
					</td>
					<td width="1%" >
						<div align="center">
							<%=zhyi.getZhy_dept_name() %>&nbsp;													
						</div>												
					</td>						
				</tr>	
				<%
					lineNo++;
					}
				%>
			</tbody>
			</table>	
			</fieldset>			
			<br/>
			<%
			}
			%>