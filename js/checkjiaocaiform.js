function checkdata()
{
	if(form.jcmc.value=="")
	{
		alert('������̲����ƣ�');
		form.jcmc.focus();
		return false;
	}
	else
	if(form.zhubian.value=="")
	{
		alert('���������࣡');
		form.zhubian.focus();
		return false;
	}
	else
		if(form.cbsjyear.value==""||(form.cbsjyear.value==""&&form.cbsjmonth.value!=""))
		{
			alert('��ѡ�����ʱ�䣡');
			form.cbsjyear.focus();
			return false;
		}
	else
		if(form.dept.value=="")
		{
			alert('��ѡ���Ż�����');
			form.dept.focus();
			return false;
		}else
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