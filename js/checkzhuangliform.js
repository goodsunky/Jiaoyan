function checkdata()
{
	if(form.fmmc.value=="")
	{
		alert('请输入发明名称！');
		form.fmmc.focus();
		return false;
	}else
		if(form.dyfmr.value=="")
		{
			alert('请输入第一发明人！');
			form.dyfmr.focus();
			return false;
		}else
			if(form.smdw.value=="")
			{
				alert('请输入作者署名单位！');
				form.smdw.focus();
				return false;
			}else
				if(form.dwpm.value=="")
				{
					alert('请选择承担单位排名！');
					form.dwpm.focus();
					return false;
				}else
					if(form.dept.value=="")
					{
						alert('请选择所在部门！');
						form.dept.focus();
						return false;
					}else
						if(validate(form.jxzf.value)=="no")
						{
							alert('绩效总分必须为非负整数！');
							form.jxzf.focus();
							return false;
						}else
							if(form.sqryear.value=="")
							{
								alert('请选择授权日！');
								form.sqryear.focus();
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