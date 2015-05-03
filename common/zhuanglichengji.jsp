<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	if (jycji != null && jycji.getZhlis() != null
			&& jycji.getZhlis().size() != 0) {
%>
<fieldset>
	<legend style="font-weight: bold;">
		【专利】
	</legend>
	<table border="0" class="jive-table" cellpadding="0" cellspacing="0"
		style="margin: 0px auto;" WIDTH=100%>
		<thead>
			<tr>
				<th width="1%" class="jive-first" nowrap="nowrap">
					编号
				</th>
				<th width="5%" class="jive-first" nowrap="nowrap">
					发明名称
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					第一发明人
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
					发明类型
				</th>
				<th width="1%" class="jive-first" nowrap="nowrap">
					授权日
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					专利权人
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					专利号
				</th>
				<th width="1%" nowrap="nowrap" class="jive-first">
					证书号
				</th>
			</tr>
		</thead>
		<tbody>
			<%
				int lineNo = 1;
					for (Iterator<Zhuangli_Info> it = jycji.getZhlis().iterator(); it
							.hasNext();) {
						/*iterator()返回以正确顺序在列表的元素上进行迭代的迭代器*/
						Zhuangli_Info zi = it.next();
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
						<%=zi.getZhl_fmmc()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_dyfmr()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_dept_name()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_smdw()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_dwpm()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_fmlx()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_sqr()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_zlqr()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_zlh()%>&nbsp;
					</div>
				</td>
				<td width="1%" nowrap="nowrap">
					<div align="center">
						<%=zi.getZhl_zsh()%>&nbsp;
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
