function checkdata(lxcount,jtcount,zjf)
{
	var lxzjf=document.getElementById("lxzongjifen");
	var jtzjf=document.getElementById("jtzongjifen");
	var assjf = 0.0,asszjf = 0.0;
	if(lxzjf!=null)
	{
		assjf = 0.0;
		var lxok=validate(lxzjf);	
		if(form.lxzongjifen.value=="")
		{
			alert("����ʱ���ܼ�Ч�ֲ���Ϊ�գ�");
			form.lxzongjifen.select();
			return false;
		}
		if(form.lxzongjifen.value!=""&&lxok=="no")
		{
				alert("����ʱ���ܼ�Ч�ֱ���Ϊ�������֣�");
				form.lxzongjifen.select();
				return false;
		}
		asszjf = asszjf +parseFloat(lxzjf.value);
		for(var i=1;i<=lxcount;i++)
		{
			var lxjifen=document.getElementById("lxjifen"+i);
			var ok=validate(lxjifen);
			if(lxjifen.value=="")
			{
				alert("��Ա���ֲ���Ϊ�գ�");
				lxjifen.select();
				return false;
				break;
			}else
				if(ok=="no")
				{
					alert("��Ա���ֱ���Ϊ�������֣�");
					lxjifen.select();
					return false;
					break;
				}else
				{
					assjf = assjf + parseFloat(lxjifen.value);
				}
		}
		if(assjf.toFixed(2)!=parseFloat(lxzjf.value).toFixed(2))
		{
			alert("����ʱ�ļ�Ч�ַ��䲻��ȷ��");
			return false;
		}
	}
	
	if(jtzjf!=null)
	{
		assjf = 0.0;
		var jtok=validate(jtzjf);	
		if(form.jtzongjifen.value=="")
		{
			alert("����ʱ���ܼ�Ч�ֲ���Ϊ�գ�");
			form.jtzongjifen.select();
			return false;
		}	
		if(form.jtzongjifen.value!=""&&jtok=="no")
		{
			alert("����ʱ���ܼ�Ч�ֱ���Ϊ�������֣�");
			form.jtzongjifen.select();
			return false;
		}
		asszjf = asszjf +parseFloat(jtzjf.value);
		for(var i=1;i<=jtcount;i++)
		{
			var jtjifen=document.getElementById("jtjifen"+i);
			var ok=validate(jtjifen);
			if(jtjifen.value=="")
			{
				alert("��Ա���ֲ���Ϊ�գ�");
				jtjifen.select();
				return false;
				break;
			}else
				if(ok=="no")
				{
					alert("��Ա���ֱ���Ϊ�������֣�");
					jtjifen.select();
					return false;
					break;
				}else
					{
						assjf = assjf + parseFloat(jtjifen.value);
					}
		}
		if(assjf.toFixed(2)!=parseFloat(jtzjf.value).toFixed(2))
		{
			alert("����ʱ�ļ�Ч�ַ��䲻��ȷ��");
			return false;
		}
	}	
	if(lxzjf!=null&&jtzjf!=null&&asszjf.toFixed(2)!=parseFloat(zjf).toFixed(2))
	{
		alert("����ʱ��Ч�ܷ�+����ʱ��Ч�ֲܷ����ڼ�Ч�ܷ֣�");
		return false;
	}
}

function checkzjf(type)
{
  var lxzjf=document.getElementById("lxzongjifen");
  var jtzjf=document.getElementById("jtzongjifen"); 
  var id = document.getElementById("id").value;
  var url="../JiaogaiServlet?id="+id+"&action=autoassign";
  if(lxzjf!=null&&type=="1")
  {
	 var ok=validate(lxzjf);
     if(lxzjf.value=="")
     {
       alert("����������ʱ�ļ�Ч�ܷ֣�");
       lxzjf.select();
       return false;
     }else
    	 if(ok=="no")
		 {
			alert("���ֱ���Ϊ�������֣�");
			lxzjf.select();
			return false;
		 }
     url = url +"&autolxzongjifen="+lxzjf.value;
  }else
	  if(jtzjf!=null&&type=="3")
	  {
		 var ok=validate(jtzjf);
	     if(jtzjf.value=="")
	     {
	       alert("���������ʱ�ļ�Ч�ܷ֣�");
	       jtzjf.select();
	       return false;
	     }else
	    	 if(ok=="no")
			 {
				alert("���ֱ���Ϊ�������֣�");
				jtzjf.select();
				return false;
			 }
	     url = url +"&autojtzongjifen="+jtzjf.value;
	  }
  window.location.href=url;
}

function validate(field) 
{
   var valid = ".0123456789";
   var ok = "yes";
   var temp;
   for (var i=0; i<field.value.length; i++) {
       temp = "" + field.value.substring(i, i+1);
       if (valid.indexOf(temp) == "-1"||field.value<=0)
	      ok = "no";		     
   }		  
   return ok;
}