function checkdata()
{
	var ok = validatemobile(form.mobilephone);
	if(form.gh.value=="")
	{
		alert('�����빤�ţ�');
		form.gh.focus();
		return false;
	}
	if(form.name.value=="")
	{
		alert('������������');
		form.name.focus();
		return false;
	}else
		if(form.xueke.value=="")
		{
		alert('��ѡ������ѧ�ƣ�');
		form.xueke.focus();
		return false;
		}else
			if(form.dept.value=="")
		{
		alert('��ѡ�����ڲ��ţ�');
		form.dept.focus();
		return false;
	}else
		if(form.position.value=="")
	{
		alert('��ѡ��רҵ�����ʸ�');
		form.position.focus();
		return false;
	}else
		if(form.mobilephone.value=="")
		{
			alert('�������ƶ��绰��');
			form.mobilephone.focus();
			return false;
		}else
			if(ok=="no")
			{
			 alert("����д11λ���ֻ�����,���ܺ��Ƿ�����!");
			 form.mobilephone.focus();
		     return false; 
			}else	
				if(form.jyfx.value=="")
				{
					alert('��������з���');
					form.jyfx.focus();
					return false;
				}else
					if(form.year.value==""&&form.month.value!="")
					{
						alert('��������£�');
						form.year.focus();
						return false;
					}
}