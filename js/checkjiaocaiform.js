function checkdata()
{
	if(form.jcmc.value=="")
	{
		alert('请输入教材名称！');
		form.jcmc.focus();
		return false;
	}
	else
	if(form.zhubian.value=="")
	{
		alert('请输入主编！');
		form.zhubian.focus();
		return false;
	}
	else
		if(form.cbsjyear.value==""||(form.cbsjyear.value==""&&form.cbsjmonth.value!=""))
		{
			alert('请选择出版时间！');
			form.cbsjyear.focus();
			return false;
		}
	else
		if(form.dept.value=="")
		{
			alert('请选择部门机构！');
			form.dept.focus();
			return false;
		}else
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