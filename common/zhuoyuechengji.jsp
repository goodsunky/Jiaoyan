<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<% 
		if(jycji!=null&&jycji.getZhyueis()!=null&&jycji.getZhyueis().size()!=0)
		{
			%>
<fieldset>
	<legend style="font-weight: bold;">
		【卓越工程师与专业综合】
	</legend>
	<table border="0" class="jive-table" cellpadding="0" cellspacing="0"
		style="margin: 0px auto;" WIDTH=100%>
		<thead>
			<tr>
				<th width="1%" class="jive-first" nowrap="nowrap">
					编号
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					专业名称
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					立项时间
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					结题时间
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					负责人
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					所在部门
				</th>
			</tr>
		</thead>
		<tbody>
			<%
		int lineNo=1;
		for (Iterator<Zhuoyue_Info> it = jycji.getZhyueis().iterator(); it.hasNext();)
		 {
			/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
			Zhuoyue_Info zhyi = it.next();
			String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";															
		%>
			<tr class="<%=classStr%>">
				<td width="1%">
					<div align="center">
						<%=lineNo %>
					</div>
				</td>
				<td width="1%">
					<div align="center">
						<%=zhyi.getZhy_zymc() %>&nbsp;
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
				<td width="1%">
					<div align="center">
						<%=zhyi.getZhy_fuzeren() %>&nbsp;
					</div>
				</td>
				<td width="1%">
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
