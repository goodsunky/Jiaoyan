function checkdata()
{
	if(form.dyzz.value=="")
	{
		alert('�������һ���ߣ�');
		form.dyzz.focus();
		return false;
	}else
		if(form.zpmc.value=="")
		{
			alert('��������Ʒ���ƣ�');
			form.zpmc.focus();
			return false;
		}else
			if(form.smdw.value=="")
			{
				alert('����������������λ��');
				form.smdw.focus();
				return false;
			}else
				if(form.dwpm.value=="")
				{
					alert('��ѡ��е���λ������');
					form.dwpm.focus();
					return false;
				}else
					if(form.dept.value=="")
					{
						alert('��ѡ�����ڲ��ţ�');
						form.dept.focus();
						return false;
					}else
						if(validate(form.jxzf.value)=="no")
						{
							alert('��Ч�ֱܷ���Ϊ�Ǹ�������');
							form.jxzf.focus();
							return false;
						}else
							if(form.hjsjyear.value=="")
							{
								alert('��ѡ��ʱ�䣡');
								form.hjsjyear.focus();
								return false;
							}else
								if(form.hjdj.value=="")
								{
									alert('��ѡ��񽱵ȼ���');
									form.hjdj.focus();
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