<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	if (jycji != null && jycji.getKyxmis() != null
			&& jycji.getKyxmis().size() != 0) {
%>
<fieldset>
	<legend style="font-weight: bold;">
		【科研项目】
	</legend>
	<table border="0" class="jive-table" cellpadding="0" cellspacing="0"
		style="margin: 0px auto;" WIDTH=100%>
		<thead>
			<tr>
				<th width="1%" class="jive-first" nowrap="nowrap">
					编号
				</th>
				<th width="5%" class="jive-first" nowrap="nowrap">
					项目名称
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					负责人
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					所在部门
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					承担单位排名
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					科研类型
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
				<th width="1%" nowrap="nowrap" class="jive-first">
					经费（万元）
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					经费到账时间
				</th>
			</tr>
		</thead>
		<tbody>
			<%
				int lineNo = 1;
				for (Iterator<Keyanxm_Info> it = jycji.getKyxmis().iterator(); it
						.hasNext();) {
					/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
					Keyanxm_Info kyxmi = it.next();
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
						<%=kyxmi.getKy_xmmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_fuzeren()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_dept_name()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_dwpm()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_kylx()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_lxsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_zjsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_jtsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_kyjf()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=kyxmi.getKy_dzsj()%>&nbsp;
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
