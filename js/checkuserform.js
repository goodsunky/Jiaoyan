function checkdata()
{
	if(form.gh.value=="")
	{
		alert('请输入工号！');
		form.gh.focus();
		return false;
	}else
		if(form.pwd.value=="")
		{
			alert('请输入密码！');
			form.pwd.focus();
			return false;
		}else
			if(form.name.value=="")
			{
				alert('请输入姓名！');
				form.name.focus();
				return false;
			}else
				if(form.dept.value=="")
				{
					alert('请选择所在部门！');
					form.dept.focus();
					return false;
				}else
					if(form.year.value!=""&&form.month.value==""||form.year.value==""&&form.month.value!="")
					{
						alert('请选择出生年月！');
						return false;
					}else
						if(form.usertype.value=="")
						{
							alert('请选择用户类型！');
							form.usertype.focus();
							return false;
						}
}