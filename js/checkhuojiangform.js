function checkdata()
{
	if(form.jxmc.value=="")
	{
		alert('�����뽱�����ƣ�');
		form.jxmc.focus();
		return false;
	}
	else
	if(form.shenbaoren.value=="")
	{
		alert('�������걨�ˣ�');
		form.shenbaoren.focus();
		return false;
	}else
		if(form.hjsjyear.value==""||(form.hjsjyear.value==""&&form.hjsjmonth.value!=""))
		{
			alert('��ѡ���ʱ�䣡');
			form.hjsjyear.focus();
			return false;
		}		
		else
			if(form.hjjb.value=="")
			{
				alert('��ѡ��񽱼���');
				form.hjjb.focus();
				return false;
			}else
				if(form.dept.value=="")
				{
					alert('��ѡ���Ż�����');
					form.dept.focus();
					return false;
				}else
				if(validate(form.geshu.value)=="no")
				{
					alert('�����������Ϊ�Ǹ�������');
					form.geshu.focus();
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
