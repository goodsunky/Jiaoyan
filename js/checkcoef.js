function update(field)
{	
	var msg="ok";
	var ids="";
	$("#checkboxTable input[type=checkbox]").each(function(){
		var id=$(this).val();
		ids=ids+id+",";
		var num=document.getElementById("num"+id);
		var type=document.getElementById("type"+id);
		var t_coef=0.0;
		for(var i=1;i<=parseFloat(num.value);i++)
		{
			var coef=document.getElementById("coef"+new String(id)+"_"+new String(i));
			t_coef = t_coef + parseFloat(coef.value);
		}
		if(t_coef.toFixed(2)!=1)
		{
			alert(type.value+"类别中人数为"+num.value+"的积分系数之和不为1！");
			msg="no";
		}
	});
	document.getElementById("idarray").value=ids;
	if(msg=="no")
		return false;
}
