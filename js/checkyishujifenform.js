function checkdata(count,zjf)
{
	var memzjf=document.getElementById("zongjifen");
	var assjf = 0.0,asszjf = 0.0;
	//assjfΪ�����ÿ����Ա���������ܻ���,asszjfΪ������ܻ���
	if(memzjf!=null)
	{
		assjf = 0.0;
		var lxok=validate(memzjf);	
		if(form.zongjifen.value=="")
		{
			alert("�ܼ�Ч�ֲ���Ϊ�գ�");
			form.zongjifen.select();
			return false;
		}
		if(form.zongjifen.value!=""&&lxok=="no")
		{
				alert("�ܼ�Ч�ֱ���Ϊ�������֣�");
				form.zongjifen.select();
				return false;
		}
		asszjf = asszjf +parseFloat(memzjf.value);
		for(var i=1;i<=count;i++)
		{
			var jifen=document.getElementById("jifen"+i);
			var ok=validate(jifen);
			if(jifen.value=="")
			{
				alert("��Ա���ֲ���Ϊ�գ�");
				jifen.select();
				return false;
				break;
			}else
				if(ok=="no")
				{
					alert("��Ա���ֱ���Ϊ�������֣�");
					jifen.select();
					return false;
					break;
				}else
				{
					assjf = assjf + parseFloat(jifen.value);
				}
		}
		if(assjf.toFixed(2)!=parseFloat(memzjf.value).toFixed(2))
		{
			alert("��Ч�ַ��䲻��ȷ��");
			return false;
		}
	}

	if(memzjf!=null&&asszjf.toFixed(2)!=parseFloat(zjf).toFixed(2))
	{
		alert("����ļ�Ч�ֲܷ�����"+zjf+"��");
		return false;
	}
}

function checkzjf(type)
{
  var memzjf=document.getElementById("zongjifen");
  var id = document.getElementById("id").value;
  var url="../YishuServlet?id="+id+"&action=autoassign";
  if(memzjf!=null&&type=="1")
  {
	 var ok=validate(memzjf);
     if(memzjf.value=="")
     {
       alert("�����뼨Ч�ܷ֣�");
       memzjf.select();
       return false;
     }else
    	 if(ok=="no")
		 {
			alert("���ֱ���Ϊ�������֣�");
			memzjf.select();
			return false;
		 }
     url = url +"&autozongjifen="+memzjf.value;
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