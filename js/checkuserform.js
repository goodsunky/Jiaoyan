function checkdata()
{
	if(form.gh.value=="")
	{
		alert('�����빤�ţ�');
		form.gh.focus();
		return false;
	}else
		if(form.pwd.value=="")
		{
			alert('���������룡');
			form.pwd.focus();
			return false;
		}else
			if(form.name.value=="")
			{
				alert('������������');
				form.name.focus();
				return false;
			}else
				if(form.dept.value=="")
				{
					alert('��ѡ�����ڲ��ţ�');
					form.dept.focus();
					return false;
				}else
					if(form.year.value!=""&&form.month.value==""||form.year.value==""&&form.month.value!="")
					{
						alert('��ѡ��������£�');
						return false;
					}else
						if(form.usertype.value=="")
						{
							alert('��ѡ���û����ͣ�');
							form.usertype.focus();
							return false;
						}
}