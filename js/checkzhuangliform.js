function checkdata()
{
	if(form.fmmc.value=="")
	{
		alert('�����뷢�����ƣ�');
		form.fmmc.focus();
		return false;
	}else
		if(form.dyfmr.value=="")
		{
			alert('�������һ�����ˣ�');
			form.dyfmr.focus();
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
							if(form.sqryear.value=="")
							{
								alert('��ѡ����Ȩ�գ�');
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