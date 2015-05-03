<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="common/getnecessaryinfo.jsp" %>
<HTML>
 <HEAD>
  <TITLE>景德镇陶瓷学院教研与科研综合绩效管理系统</TITLE>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script type="text/javascript" src="js/jquery/jquery.js"></script><!--Base Ajax Frame Work-->	
<STYLE TYPE="text/css">
	body{
		margin:0;
		background:url('images/bgnew.gif');
		text-align:center;
		vertical-align:middle;
		background-position :center center;
		position :absolute;
	}
	
	label{
		position :absolute;
		height:20;
		font-size:15px;
	}
	
	input{
		position :absolute;
		width:120;
		height:20;
	}
	select{
		position :absolute;
		width:120;
		height:20;
	}
	img{
		position :absolute;
		height:20;
	}
	span{
		position :absolute;
		color:#FF0000;
		font-size:9pt
	}
	}
</STYLE>

		<script  type="text/javascript">
			function checkusb(){
				try{
					rnd = Math.round(Math.random()*1000000000);
					//alert(rnd);
					login.rnd.value=rnd
					var returnstr = getUserPIN();
					if(returnstr != undefined){
						login.username.value= returnstr;
						//alert(tusername);
						//alert(tserial);
						var randomKey = getRandomKey(rnd)
						login.serial.value= randomKey;
						//alert(randomKey);
					}else{
						login.serial.value= '0';
					}
				}catch(err){
					login.serial.value= '0';
					login.username.value= '';
					return;
				}
			}
			function changeImg()
			{
				document.getElementById("valcode_img").src="common/image.jsp?"+Math.random();
			}
		</script>
		<OBJECT id=htactx name=htactx classid=clsid:FB4EE423-43A4-4AA9-BDE9-4335A6D3C74E codebase="HTActX.cab#version=1,0,0,1" style="HEIGHT: 0px; WIDTH: 0px"></OBJECT>
		<script language=VBScript>
			function getUserPIN()
				Dim vbsserial
				dim hCard
				hCard = 0
				on   error   resume   next
				hCard = htactx.OpenDevice(1)'打开设备
				If Err.number<>0 or hCard = 0 then
					'alert("请确认您已经正确地安装了驱动程序并插入了usb令牌")
					Exit function
				End if
				dim UserName
				on   error   resume   next
				UserName = htactx.GetUserName(hCard)'获取用户名
				If Err.number<>0 Then
					'alert("请确认您已经正确地安装了驱动程序并插入了usb令牌2")
					htactx.CloseDevice hCard
					Exit function
				End if

				vbsserial = UserName
				htactx.CloseDevice hCard
				getUserPIN = vbsserial
			End function

			function getRandomKey(randnum)
				dim hCard
				hCard = 0	
				hCard = htactx.OpenDevice(1)'打开设备
				If Err.number<>0 or hCard = 0 then
					'alert("请确认您已经正确地安装了驱动程序并插入了usb令牌4")
					Exit function
				End if
				dim Digest
				Digest = 0
				on error resume next
					Digest = htactx.HTSHA1(randnum, len(randnum))
				if err.number<>0 then
						htactx.CloseDevice hCard
						Exit function
				end if

				on error resume next
					Digest = Digest&"04040404"'对SHA1数据进行补码
				if err.number<>0 then
						htactx.CloseDevice hCard
						Exit function
				end if
				htactx.VerifyUserPin hCard, CStr(login.userpassword.value) '校验口令
				'alert HRESULT
				If Err.number<>0 Then
					'alert("HashToken compute")
					htactx.CloseDevice hCard
					Exit function
				End if
				dim EnData
				EnData = 0
				EnData = htactx.HTCrypt(hCard, 0, 0, Digest, len(Digest))'DES3加密SHA1后的数据
				If Err.number<>0 Then 
					'alert("HashToken compute")
					htactx.CloseDevice hCard
					Exit function
				End if
				htactx.CloseDevice hCard
				getRandomKey = EnData
				'alert "EnData = "&EnData
			End function

		</script>
		
 </HEAD>
 

 <BODY> 
	<form name='login' id='login' action="LoginServlet?action=login"  method="post"  onkeydown="if(event.keyCode == 13) doSubmit();"> 
		<INPUT type="hidden" id="serial" name="serial">
	    <INPUT type="hidden" id="username" name="username">
		<INPUT type="hidden" id="rnd" name="rnd" >
		<label id="usertype_name">类&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
		<select name='usertype' id='usertype'>
		<%
				int i=1;
			    for (Iterator<Usertype_Info> it = utis.iterator(); it.hasNext();)
				{
					Usertype_Info ui = it.next();							
		%>
			    <option value="<%=i %>"><%=ui.getUsertype_name() %></option>
		<%
			    i++;
			    }
		%>		  
		</select> 
		<label id="loginid_name">账&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
		<input id='loginid' name='loginid' >
		<label id="userpassword_name">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		<input  id='userpassword' name='userpassword' type='password'>
		<label id="valcode_name">验证码：</label>
		<input id="valcode" name="valcode" style="width: 64px !important; ">
		<img id="valcode_img" alt="刷新" src="common/image.jsp" width="54" onclick="javascript:changeImg();">
		<input type=hidden name="logintype" value="1">
	</form>
	<img id='submit' src="images/buttonnew.gif" style="height: 24px !important; " onmouseover="this.style.cursor='hand'"  onmouseleave="this.style.cursor='default' " onclick='doSubmit()'>
	<div style="margin:390px 400px 300px 500px;font-family: monospace; font-size: x-small;">
	<marquee direction="up" scrollamount="2">
	【登录须知】<br>
	初始密码和工号一致<br>
	建议使用IE8.0浏览器
	</marquee>	
	</div>	
 </BODY>
 <SCRIPT LANGUAGE="JavaScript">

function doResize(){
	var height=document.body.clientHeight;
	var width=document.body.clientWidth;
	var rootX=width/2;
	var rootY=height/2;
	document.getElementById("usertype_name").style.left = rootX+40
	document.getElementById("usertype_name").style.top = rootY-42
	document.getElementById("usertype").style.left=rootX+95	
	document.getElementById("usertype").style.top=rootY-45
	
	document.getElementById("loginid_name").style.left = rootX+40
	document.getElementById("loginid_name").style.top = rootY-17
	document.getElementById("loginid").style.left=rootX+95
	document.getElementById("loginid").style.top=rootY-20
	
	document.getElementById("userpassword_name").style.left = rootX+40
	document.getElementById("userpassword_name").style.top = rootY+6
	document.getElementById("userpassword").style.left=rootX+95
	document.getElementById("userpassword").style.top=rootY+3
	
	document.getElementById("valcode_name").style.left = rootX+40
	document.getElementById("valcode_name").style.top = rootY+29
	document.getElementById("valcode").style.left=rootX+95
	document.getElementById("valcode").style.top=rootY+26
	document.getElementById("valcode_img").style.left=rootX+160
	document.getElementById("valcode_img").style.top=rootY+26
	
	document.getElementById("submit").style.left=rootX+148
	document.getElementById("submit").style.top=rootY+55
}

doResize();


function doSubmit(){	
	checkusb();	
	var username=$("#loginid").val();
	var password=$("#userpassword").val();
	var valcode = $("#valcode").val();
	if($.trim(username)=="")
	{
		alert("请输入用户名！");		
		login.loginid.focus();
		return false;
	}else
		if($.trim(password)=="")
		{
			alert("请输入密码！");
			login.userpassword.focus();
			return false;
		}
		else
			if($.trim(valcode)=="")
			{
				alert("请输入验证码！");
				login.valcode.focus();
				return false;
			}
			else{
				login.submit();
	}
}

document.body.onresize =function(){
	doResize();
}
</SCRIPT>
</HTML>
