function checkdata()
{
	if(form.xmmc.value=="")
	{
		alert('��������Ŀ���ƣ�');
		form.xmmc.focus();
		return false;
	}else
		if(form.shenbaoren.value=="")
		{
			alert('�������걨�ˣ�');
			form.shenbaoren.focus();
			return false;
		}else
			if(form.lxsjyear.value==""||(form.lxsjyear.value==""&&form.lxsjmonth.value!=""))
			{
				alert('��ѡ������ʱ�䣡');
				form.lxsjyear.focus();
				return false;
			}else
				if(form.dept.value=="")
				{
					alert('��ѡ�����ڲ��ţ�');
					form.dept.focus();
					return false;
				}else
						if(form.yjtsjyear.value==""&&form.yjtsjmonth.value!="")
						{
							alert("��ѡ��Ԥ����ʱ��!");
						    form.yjtsjyear.focus();
						    return false;
						}else
							if(form.jtsjyear.value==""&&form.jtsjmonth.value!="")
							{
								alert("��ѡ�����ʱ��!");
							    form.jtsjyear.focus();
							    return false;
							}
							else						
								if(validate(form.jxzf.value)=="no")
								{
									alert('��Ч�ֱܷ���Ϊ�Ǹ�������');
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