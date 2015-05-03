function checktext(text)
{
    allValid = true;
    for (i = 0;  i < text.length;  i++)
    {
      if (text.charAt(i) != " ")
      {
        allValid = false;
        break;
      }
    }
return allValid;
}

function gbcount(message,total,used,remain)
{
  var max;
  max = total.value;
  if (message.value.length > max) {
  message.value = message.value.substring(0,max);
  used.value = max;
  remain.value = 0;
  alert("不能超过"+total.value+"个字!");
  }
  else {
  used.value = message.value.length;
  remain.value = max - used.value;
  }
}