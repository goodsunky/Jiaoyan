<%@page import="com.jiaoyan.*,com.jiaoyan.expert.* ,com.jiaoyan.jiaogai.*,com.jiaoyan.multimedia.*,
com.jiaoyan.jiaocai.*,com.jiaoyan.huojiang.*,com.jiaoyan.zhuangye.*,com.jiaoyan.zhuoyue.*,
com.jiaoyan.huizong.*,com.jiaoyan.user.*,com.jiaoyan.jiaoyanchengji.*,com.jiaoyan.keyan.*,
com.jiaoyan.zhuangli.*,com.jiaoyan.lunwen.*,com.jiaoyan.yishu.*,com.jiaoyan.keyanxm.*,
com.jiaoyan.kecheng.*,com.jiaoyan.necessaryinfo.*,java.util.*,java.text.* " %>
<%
	request.setCharacterEncoding("utf-8");	
	ArrayList<Usertype_Info> utis = DB.getUsertypeDetailInfo("select *from usertype_info");
	ArrayList<Department_Info> dis = DB.getDeptDetailInfo("select *from department_info order by dept_name");
	ArrayList<Position_Info> pis = DB.getPosDetailInfo("select *from position_info");
	ArrayList<Xueke_Info> xks = DB.getXuekeDetailInfo("select *from xueke_info");
	ArrayList<Xuewei_Info> xws = DB.getXueweiDetailInfo("select *from xuewei_info");
	ArrayList<Gangwei_Info> gws = DB.getGangweiList("select *from gangwei_info");
	
	ArrayList<Jiaogaijifen_Info> jgjfis = DB.getJiaogaijifenDetailInfo("select *from jiaogaijifen_info");
	ArrayList<Kechengjifen_Info> kcjfis = DB.getKechengjifenDetailInfo("select *from kechengjifen_info");	
	ArrayList<Jiaocaijifen_Info> jcjfis = DB.getJiaocaijifenDetailInfo("select *from jiaocaijifen_info");	
	ArrayList<Zhuangyejifen_Info> zyjfis = DB.getZhuangyejifenDetailInfo("select *from zhuangyejifen_info");
	ArrayList<Zhuoyuejifen_Info> zyuejfis = DB.getZhuoyuejifenDetailInfo("select *from zhuoyuejifen_info");	
	ArrayList<Huojiangjifen_Info> hjjfis = DB.getHuojiangjifenDetailInfo("select *from huojiangjifen_info");
	ArrayList<Multimediajifen_Info> mmjfis = DB.getMultimediajifenDetailInfo("select *from multimediajifen_info");
	ArrayList<Keyanxmjifen_Info> kyxmjfis = DB.getKeyanxmjifenDetailInfo("select *from keyanxmjifen_info");
	ArrayList<Keyantdjifen_Info> kytdjfis = DB.getKeyantdjifenDetailInfo("select *from keyantdjifen_info");
	ArrayList<Lunwenjifen_Info> lwjfis = DB.getLunwenjifenDetailInfo("select *from lunwenjifen_info");
	ArrayList<Lunwenjifen_Info> lwlbjfis = DB.getLunwenleibieDetailInfo("select distinct lwjf_xmlb from lunwenjifen_info");
	ArrayList<Zhuanglijifen_Info> zhljfis = DB.getZhuanglijifenDetailInfo("select *from zhuanglijifen_info");
	ArrayList<Yishujifen_Info> yshjfis = DB.getYishujifenDetailInfo("select *from yishujifen_info");
	
	
	//ArrayList<Jiaoyan_Info> jyis = DB.getJiaoyanDetailInfo("select *from jiaoyan_info");
	ArrayList<Jiaoyan_Info> jytypeis = DB.getJiaoyanTypeInfo("select distinct jy_type from jiaoyan_info");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");   
	SimpleDateFormat sdfyear=new SimpleDateFormat("yyyy");
	SimpleDateFormat sdfdate=new SimpleDateFormat("yyyyMMdd");
	String todaydate=sdfdate.format(new java.util.Date());
	String rkdate=sdf.format(new java.util.Date());
	String birthyear=sdfyear.format(new java.util.Date());
	int count=DB.getCount("select count(*) from expert_info");
%>

