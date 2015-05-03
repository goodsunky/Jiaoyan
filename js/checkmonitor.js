function update(field)
{	
	var msg="ok";
	var ids="";
	$("#checkboxTable input[type=checkbox]").each(function(){
		var id=$(this).val();
		ids=ids+id+",";
		var row=document.getElementById("row"+id);
		var score=document.getElementById("score"+id);
		if(validate(row)!="yes"||validate(score)!="yes")
			msg="no";
	});
	document.getElementById("idarray").value=ids;
	if(msg!="ok")
	{
		alert("行号和积分阈值必须为非负整数！");
		return false;
	}
}


function validate(field) 
{
   var valid = "0123456789";
   var ok = "yes";
   var temp;
   for (var i=0; i<field.value.length; i++) {
       temp = "" + field.value.substring(i, i+1);
       if (valid.indexOf(temp) == "-1")
	      ok = "no";		     
   }		  
   return ok;
}