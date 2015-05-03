<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% 
		if(jycji!=null&&jycji.getKchis()!=null&&jycji.getKchis().size()!=0)
		{
			%>
			<fieldset>
			<legend style="font-weight: bold; ">【课程建设信息】</legend>	
			<table border="0" class="jive-table" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >
				<thead>
							<tr>
								<th width="1%"  nowrap="nowrap">
									编号												
								</th>
								<th width="1%"  nowrap="nowrap">
									课程名称											
								</th>
								<th width="1%"  nowrap="nowrap">
									负责人												
								</th>
								<th width="1%" nowrap="nowrap" >
									所在部门										
								</th>
								<th width="1%"  nowrap="nowrap">
									课程级别												
								</th>
								<th width="1%"  nowrap="nowrap">
									立项时间												
								</th>	
								<th width="1%" nowrap="nowrap" >
									中检时间												
								</th>																						
								<th width="1%" nowrap="nowrap" >
									结题时间												
								</th>	

							</tr>
						</thead>								
						<tbody>
						<%
						int lineNo=1;
						for (Iterator<Kecheng_Info> it = jycji.getKchis().iterator(); it.hasNext();)
						 {
							/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
							Kecheng_Info ki = it.next();
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
								<%=ki.getKch_kcmc() %>&nbsp;
							</div>
					  </td>
						<td width="1%" >
							<div align="center">
								<%=ki.getKch_fuzeren() %>&nbsp;
							</div>
					  </td>
						<td width="1%" >
							<div align="center">
								<%=ki.getKch_dept_name() %>&nbsp;
							</div>
						</td>
						  <td width="1%" >
							<div align="center">
								<%=ki.getKch_kcjb() %>&nbsp;
							</div>
						</td>
						<td width="1%" >
							<div align="center">
								<%=ki.getKch_lxsj() %>&nbsp;
							</div>
						</td>	
						<td width="1%" >
							<div align="center">
								<%=ki.getKch_zjsj() %>&nbsp;
							</div>
						</td>
						<td width="1%" >
							<div align="center">
								<%=ki.getKch_jtsj() %>&nbsp;
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