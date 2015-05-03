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
			alert("立项时的总绩效分不能为空！");
			form.lxzongjifen.select();
			return false;
		}
		if(form.lxzongjifen.value!=""&&lxok=="no")
		{
				alert("立项时的总绩效分必须为非零数字！");
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
				alert("成员积分不能为空！");
				lxjifen.select();
				return false;
				break;
			}else
				if(ok=="no")
				{
					alert("成员积分必须为非零数字！");
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
			alert("立项时的绩效分分配不正确！");
			return false;
		}
	}
	
	if(jtzjf!=null)
	{
		assjf = 0.0;
		var jtok=validate(jtzjf);	
		if(form.jtzongjifen.value=="")
		{
			alert("结题时的总绩效分不能为空！");
			form.jtzongjifen.select();
			return false;
		}	
		if(form.jtzongjifen.value!=""&&jtok=="no")
		{
			alert("结题时的总绩效分必须为非零数字！");
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
				alert("成员积分不能为空！");
				jtjifen.select();
				return false;
				break;
			}else
				if(ok=="no")
				{
					alert("成员积分必须为非零数字！");
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
			alert("结题时的绩效分分配不正确！");
			return false;
		}
	}	
	if(lxzjf!=null&&jtzjf!=null&&asszjf.toFixed(2)!=parseFloat(zjf).toFixed(2))
	{
		alert("立项时绩效总分+结题时绩效总分不等于绩效总分！");
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
       alert("请输入立项时的绩效总分！");
       lxzjf.select();
       return false;
     }else
    	 if(ok=="no")
		 {
			alert("积分必须为非零数字！");
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
	       alert("请输入结题时的绩效总分！");
	       jtzjf.select();
	       return false;
	     }else
	    	 if(ok=="no")
			 {
				alert("积分必须为非零数字！");
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