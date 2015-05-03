function checkdata()
{
	var ok = validatemobile(form.mobilephone);
	if(form.gh.value=="")
	{
		alert('请输入工号！');
		form.gh.focus();
		return false;
	}
	if(form.name.value=="")
	{
		alert('请输入姓名！');
		form.name.focus();
		return false;
	}else
		if(form.xueke.value=="")
		{
		alert('请选择所属学科！');
		form.xueke.focus();
		return false;
		}else
			if(form.dept.value=="")
		{
		alert('请选择所在部门！');
		form.dept.focus();
		return false;
	}else
		if(form.position.value=="")
	{
		alert('请选择专业技术资格！');
		form.position.focus();
		return false;
	}else
		if(form.mobilephone.value=="")
		{
			alert('请输入移动电话！');
			form.mobilephone.focus();
			return false;
		}else
			if(ok=="no")
			{
			 alert("请填写11位的手机号码,不能含非法数字!");
			 form.mobilephone.focus();
		     return false; 
			}else	
				if(form.jyfx.value=="")
				{
					alert('请输入教研方向！');
					form.jyfx.focus();
					return false;
				}else
					if(form.year.value==""&&form.month.value!="")
					{
						alert('请出生年月！');
						form.year.focus();
						return false;
					}
}