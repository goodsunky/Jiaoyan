<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	if (jycji != null && jycji.getKytdis() != null
			&& jycji.getKytdis().size() != 0) {
%>
<fieldset>
	<legend style="font-weight: bold;">
		【科研团队建设】
	</legend>
	<table border="0" class="jive-table" cellpadding="0" cellspacing="0"
		style="margin: 0px auto;" WIDTH=100%>
		<thead>
			<tr>
				<th width="1%" class="jive-first" nowrap="nowrap">
					编号
				</th>
				<th width="5%" class="jive-first" nowrap="nowrap">
					团队名称
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					负责人
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					所在部门
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					团队类别
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					立项时间
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					中检时间
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					结题时间
				</th>
			</tr>
		</thead>
		<tbody>
			<%
				int lineNo = 1;
					for (Iterator<Keyan_Info> it =  jycji.getKytdis().iterator(); it.hasNext();) {
						/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
						Keyan_Info ki = it.next();
						String classStr = lineNo % 2 == 0 ? "jive-even"
								: "jive-odd";
			%>
			<tr class="<%=classStr%>">
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lineNo%>
					</div>
				</td>
				<td width="5%">
					<div align="center">
						<%=ki.getKy_tdmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=ki.getKy_fuzeren()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=ki.getKy_dept_name()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=ki.getKy_tdlb()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=ki.getKy_lxsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=ki.getKy_zjsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=ki.getKy_jtsj()%>&nbsp;
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
