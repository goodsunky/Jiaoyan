<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	if (jycji != null && jycji.getLwis() != null
			&& jycji.getLwis().size() != 0) {
%>
<fieldset>
	<legend style="font-weight: bold;">
		【论文、论著、标准和画册】
	</legend>
	<table border="0" class="jive-table" cellpadding="0" cellspacing="0"
		style="margin: 0px auto;" WIDTH=100%>
		<thead>
			<tr>
				<th width="1%" class="jive-first" nowrap="nowrap">
					编号
				</th>
				<th width="5%" class="jive-first" nowrap="nowrap">
					名称
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					第一作者
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					所在部门
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					作者署名单位
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					承担单位排名
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					出版或发表时间
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					刊物或学术会议名称
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					收录情况
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					类别
				</th>
			</tr>
		</thead>
		<tbody>
			<%
				int lineNo = 1;
					for (Iterator<Lunwen_Info> it = jycji.getLwis().iterator(); it.hasNext();) {
						/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
						Lunwen_Info lwi = it.next();
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
						<%=lwi.getLw_lwmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_dyzz()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_dept_name()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_smdw()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_dwpm()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_cbsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_kwmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_slqk()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=lwi.getLw_lwlb()%>&nbsp;
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
