<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<% 
		if(jycji!=null&&jycji.getJcis()!=null&&jycji.getJcis().size()!=0)
		{
			%>
			<fieldset>
			<legend style="font-weight: bold; ">【教材信息】</legend>	
			<table border="0" class="jive-table" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >
				<thead>
					<tr>					
						<th width="1%"  nowrap="nowrap">
							编号												
						</th>						
						<th width="5%"  nowrap="nowrap">
							教材名称											
						</th>
						<th width="1%"  nowrap="nowrap">
							主编
						</th>
						<th width="1%" nowrap="nowrap" >
							所在部门										
						</th>												
						<th width="1%"  nowrap="nowrap">
							出版时间												
						</th>	
						<th width="1%" nowrap="nowrap" >
							出版社名
						</th>																						
						<th width="1%" nowrap="nowrap" >
							图书编号												
						</th>	
						<th width="1%" nowrap="nowrap" >
							教材类别												
						</th>

			</tr>
			</thead>								
			<tbody>
			<%
					int lineNo=1;
					for (Iterator<Jiaocai_Info> it = jycji.getJcis().iterator(); it.hasNext();)
					 {
						/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
						Jiaocai_Info jci = it.next();
						String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
					%>											
				<tr class="<%=classStr%>">
					<td width="1%" >
						<div align="center">
							<%=lineNo %>													
					</div>											 
				    </td>												
					<td width="5%">
						<div align="center">
							<%=jci.getJc_jcmc() %>&nbsp;													
						</div>											  
					</td>
					<td width="1%" >
						<div align="center">
							<%=CommonUtil.getMembers(jci.getJc_zhubian()) %>&nbsp;													
						</div>											  
					</td>
					<td width="1%" >
						<div align="center">
							<%=jci.getJc_dept_name() %>&nbsp;												
						</div>												
					</td>
					  <td width="1%" >
						<div align="center">
							<%=jci.getJc_cbsj() %>&nbsp;													
						</div>												
					</td>
					<td width="1%" >
						<div align="center">
							<%=jci.getJc_cbsm() %>&nbsp;													
						</div>												
					</td>	
					<td width="1%" >
						<div align="center">
							<%=jci.getJc_tsbh() %>&nbsp;		
						</div>												
					</td>
					<td width="1%" >
						<div align="center">
							<%=jci.getJc_jclb() %>&nbsp;		
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