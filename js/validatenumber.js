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
		   if (ok == "no") {
		      alert("����д��������!");
		       field.focus();
		       return false;
		   }else
			   if(field.value=="")
			   {
				   alert("��Ч�ֲ���Ϊ��!");
			       field.focus();
			       return false;
			   }
		}
function validatemobile(field) 
{
   var valid = "0123456789";
   var ok = "yes";
   var temp;
   for (var i=0; i<field.value.length; i++) {
       temp = "" + field.value.substring(i, i+1);
       if (valid.indexOf(temp) == "-1")
	      ok = "no";		     
   }
   if(field.value.length!=11)
	   ok="no";
   return ok;
}