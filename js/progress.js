//ȫ�ֱ���
var xmlHttp;//XMLHttpRequest����							
var bar_color = '#6A6AFF';//������������ɫ
var no_color="";//���������������õ�����ɫ����
var clear = "";//��ձ�����ɫ�õı���
var server_url = "";//��������ַ
var result_url = "";//����֮��ĵ�ַ
		
function go(initial_url,rs_url)
{
    createXMLHttpRequest();//����XMLHttpRequest
    checkDiv();//���processBar����div
    server_url = initial_url;
    result_url = rs_url;
    var urlfirst = initial_url+"&task=first";//��ʾ����Ҫ���������������ٴ˴����
    xmlHttp.open("GET", urlfirst, true);
    xmlHttp.onreadystatechange = goCallback;//���ûص�����
    xmlHttp.send(null);
}

//����XMLHttpRequest
function createXMLHttpRequest() 
{
    if (window.ActiveXObject) 
    {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else 
    	if (window.XMLHttpRequest) 
	    {
	        xmlHttp = new XMLHttpRequest(); 
	        clear =  "&nbsp;" 
	        //�����������Ĭ�����õ�1��block�������IE�ں��������������ʾ������
	        var elem = document.getElementById("block1");
	        elem.innerHTML = clear;					
	        elem.style.backgroundColor = no_color; 
	    }
}

//�ص�����
function goCallback() 
{
//    if (xmlHttp.readyState == 2) 
//    {
//        if (xmlHttp.status == 200) 
//        {
            setTimeout("pollServer()", 1000);
//        }
//    }
}
        
function pollServer() 
{
    createXMLHttpRequest();
    var urlpoll = server_url+"&task=poll";
    xmlHttp.open("GET", urlpoll, true);
    xmlHttp.onreadystatechange = pollCallback;//���ûص�����
    xmlHttp.send(null);
}
        
function pollCallback() 
{
    if (xmlHttp.readyState == 4) 
    {
        if (xmlHttp.status == 200) 
        {
        	//�õ���ǰ���Ȱٷֱ�
            var  response = xmlHttp.responseText;
            var arr = response.split("$");
            var percent_complete = arr[0];
            result_url = arr[1];
            var msg = arr[2];
            var index = percent_complete / 2;//100���ٷֵ㣬��ʾ��50��block��
            for (var i = 1; i <= index; i++)
            {
                var elem = document.getElementById("block" + i);
                elem.innerHTML = clear;//������innerHTML���ԣ���IE�ں������������ʾ����
                elem.style.backgroundColor = bar_color;//Ϊblock���ñ�����ɫ
                document.getElementById("finish").innerHTML = "<font style='font-weight:bold;color:"+bar_color+"'>"+percent_complete + "%</font>";
            }
            //ֻҪ����С��100%����ÿ��1000�������һ��pollServer()
            if (percent_complete < 100) 
            {
                setTimeout("pollServer()",1000);
            }
            else 
            	if(percent_complete == 100)
            	{
                    alert(msg);
                    var redirectResultView=result_url; //Ҫ��ת��ҳ����Դ�servlet�д�����
					var urlInfo = "���û����ת���<a href=";
					urlInfo += redirectResultView;
					urlInfo += "><font color='red'>����</font></a>";
					document.getElementById("complete").innerHTML = urlInfo;
					window.parent.location = redirectResultView;
            }
            //����percent����100��Ĵ�����Ϣ
//            else
//            {
//            	alert("������̳��ִ���");
//            }
        }
    }
}    	

//���processBar����div���������Ƿ���ʾ
function checkDiv() 
{	
    var progress_bar = document.getElementById("progressBar");
    if (progress_bar.style.visibility == "visible") 
    {
        clearBar();
        document.getElementById("complete").innerHTML = "";
    }else 
    {
        progress_bar.style.visibility = "visible";
    }
}

//���processBar����div
function clearBar() 
{
    for (var i = 1; i < 10; i++) 
    {
        var elem = document.getElementById("block" + i);
        elem.innerHTML = clear;
    }
}