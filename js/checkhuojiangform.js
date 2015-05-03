function checkdata()
{
	if(form.jxmc.value=="")
	{
		alert('请输入奖项名称！');
		form.jxmc.focus();
		return false;
	}
	else
	if(form.shenbaoren.value=="")
	{
		alert('请输入申报人！');
		form.shenbaoren.focus();
		return false;
	}else
		if(form.hjsjyear.value==""||(form.hjsjyear.value==""&&form.hjsjmonth.value!=""))
		{
			alert('请选择获奖时间！');
			form.hjsjyear.focus();
			return false;
		}		
		else
			if(form.hjjb.value=="")
			{
				alert('请选择获奖级别！');
				form.hjjb.focus();
				return false;
			}else
				if(form.dept.value=="")
				{
					alert('请选择部门机构！');
					form.dept.focus();
					return false;
				}else
				if(validate(form.geshu.value)=="no")
				{
					alert('奖项个数必须为非负整数！');
					form.geshu.focus();
					return false;
				}					
				else					
					if(validate(form.jxzf.value)=="no")
					{
						alert('绩效总分必须为非负整数！');
						form.jxzf.focus();
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
