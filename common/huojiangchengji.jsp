<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% 
		if(jycji!=null&&jycji.getHjis()!=null&&jycji.getHjis().size()!=0)
		{
			%>
			<fieldset>
			<legend style="font-weight: bold; ">【教学获奖信息】</legend>	
			<table border="0" class="jive-table" cellpadding="0" cellspacing="0" style="margin:0px auto;" WIDTH=100% >
				<thead>
					<tr>
					<th width="1%"  nowrap="nowrap">
						编号												
					</th>
					<th width="5%"  nowrap="nowrap">
						奖项名称											
					</th>
					<th width="1%"  nowrap="nowrap">
						获奖级别
					</th>
					<th width="1%" nowrap="nowrap" >
						获奖时间									
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
				for (Iterator<Huojiang_Info> it = jycji.getHjis().iterator(); it.hasNext();)
				 {
					/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
					Huojiang_Info hji = it.next();
					String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
				%>											
			<tr class="<%=classStr%>">
				<td width="1%" >
					<div align="center">
						<%=lineNo %>													
					</div>											  
				</td>												
				<td>
					<div align="center">
						<%=hji.getHj_jxmc() %>&nbsp;													
					</div>											  
				</td>
				<td width="1%" >
					<div align="center">
						<%=hji.getHj_hjjb() %>&nbsp;													
					</div>											  
				</td>
				<td width="1%" >
					<div align="center">
						<%=hji.getHj_hjsj() %>&nbsp;													
					</div>												
				</td>
				  <td width="1%" >
					<div align="center">
						<%=hji.getHj_shenbaoren() %>&nbsp;													
					</div>												
				</td>
				<td width="1%" >
					<div align="center">
						<%=hji.getHj_dept_name() %>&nbsp;													
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
			<%
			}
			%>