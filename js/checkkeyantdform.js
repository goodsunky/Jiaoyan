function checkdata()
{
	if(form.tdmc.value=="")
	{
		alert('请输入团队名称！');
		form.tdmc.focus();
		return false;
	}
	else
	if(form.fuzeren.value=="")
	{
		alert('请输入负责人！');
		form.fuzeren.focus();
		return false;
	}else
		if(form.lxsjyear.value==""||(form.lxsjyear.value==""&&form.lxsjmonth.value!=""))
		{
			alert('请选择立项时间！');
			form.lxsjyear.focus();
			return false;
		}else
			if(form.dept.value=="")
			{
				alert('请选择所在部门！');
				form.dept.focus();
				return false;
			}else
				if(form.tdlb.value=="")
				{
					alert('请选择团队类别！');
					form.tdlb.focus();
					return false;
				}else
						if(validate(form.jxzf.value)=="no")
						{
							alert('绩效总分必须为非负整数！');
							form.jxzf.focus();
							return false;
						}else
								if(form.zjsjyear.value==""&&form.zjsjmonth.value!="")
								{
									alert('请选择中检时间！');
									form.zjsjyear.focus();
									return false;
								}else
									if(form.jtsjyear.value==""&&form.jtsjmonth.value!="")
									{
										alert('请选择结题时间！');
										form.jtsjyear.focus();
										return false;
									}
}

function validate(field)
{

	   var valid = ".0123456789";
	   var ok = "yes";
	   var temp;
	   for (var i=0; i<field.length; i++) {
	       temp = "" + field.substring(i, i+1);
	       if (valid.indexOf(temp) == "-1")
		      ok = "no";		     
	   }
	   if(field=="")
		   ok="no";
	   return ok;
}