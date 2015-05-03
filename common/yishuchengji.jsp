<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	if (jycji != null && jycji.getYsis() != null
			&& jycji.getYsis().size() != 0) {
%>
<fieldset>
	<legend style="font-weight: bold;">
		【艺术作品获奖和收藏】
	</legend>
	<table border="0" class="jive-table" cellpadding="0" cellspacing="0"
		style="margin: 0px auto;" WIDTH=100%>
		<thead>
			<tr>
				<th width="1%" class="jive-first" nowrap="nowrap">
					编号
				</th>
				<th width="5%" class="jive-first" nowrap="nowrap">
					作品名称
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
					获奖时间
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					获奖名称
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					获奖等级
				</th>
			</tr>
		</thead>
		<tbody>
			<%
				int lineNo = 1;
					for (Iterator<Yishu_Info> it = jycji.getYsis().iterator(); it.hasNext();) {
						/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
						Yishu_Info yshi = it.next();
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
						<%=yshi.getYsh_zpmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_dyzz()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_dept_name()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_smdw()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_dwpm()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_hjsj()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_hjmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=yshi.getYsh_hjdj()%>&nbsp;
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
