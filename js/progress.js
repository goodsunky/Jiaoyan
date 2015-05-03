//全局变量
var xmlHttp;//XMLHttpRequest对象							
var bar_color = '#6A6AFF';//进度条背景颜色
var no_color="";//解决浏览器兼容设置的无颜色变量
var clear = "";//清空背景颜色用的变量
var server_url = "";//服务器地址
var result_url = "";//处理之后的地址
		
function go(initial_url,rs_url)
{
    createXMLHttpRequest();//创建XMLHttpRequest
    checkDiv();//检查processBar所在div
    server_url = initial_url;
    result_url = rs_url;
    var urlfirst = initial_url+"&task=first";//提示：需要其他参数，可以再此处添加
    xmlHttp.open("GET", urlfirst, true);
    xmlHttp.onreadystatechange = goCallback;//设置回调函数
    xmlHttp.send(null);
}

//创建XMLHttpRequest
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
	        //进入进度条，默认设置第1个block，否则非IE内核浏览器进度条显示不正常
	        var elem = document.getElementById("block1");
	        elem.innerHTML = clear;					
	        elem.style.backgroundColor = no_color; 
	    }
}

//回调函数
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
    xmlHttp.onreadystatechange = pollCallback;//设置回调函数
    xmlHttp.send(null);
}
        
function pollCallback() 
{
    if (xmlHttp.readyState == 4) 
    {
        if (xmlHttp.status == 200) 
        {
        	//得到当前进度百分比
            var  response = xmlHttp.responseText;
            var arr = response.split("$");
            var percent_complete = arr[0];
            result_url = arr[1];
            var msg = arr[2];
            var index = percent_complete / 2;//100个百分点，显示在50个block上
            for (var i = 1; i <= index; i++)
            {
                var elem = document.getElementById("block" + i);
                elem.innerHTML = clear;//不设置innerHTML属性，非IE内核浏览器不会显示进度
                elem.style.backgroundColor = bar_color;//为block设置背景颜色
                document.getElementById("finish").innerHTML = "<font style='font-weight:bold;color:"+bar_color+"'>"+percent_complete + "%</font>";
            }
            //只要进度小于100%继续每隔1000毫秒调用一次pollServer()
            if (percent_complete < 100) 
            {
                setTimeout("pollServer()",1000);
            }
            else 
            	if(percent_complete == 100)
            	{
                    alert(msg);
                    var redirectResultView=result_url; //要跳转的页面可以从servlet中传过来
					var urlInfo = "如果没有跳转请点<a href=";
					urlInfo += redirectResultView;
					urlInfo += "><font color='red'>这里</font></a>";
					document.getElementById("complete").innerHTML = urlInfo;
					window.parent.location = redirectResultView;
            }
            //定义percent超过100后的错误信息
//            else
//            {
//            	alert("处理过程出现错误！");
//            }
        }
    }
}    	

//检查processBar所在div，设置其是否显示
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

//清空processBar所在div
function clearBar() 
{
    for (var i = 1; i < 10; i++) 
    {
        var elem = document.getElementById("block" + i);
        elem.innerHTML = clear;
    }
}