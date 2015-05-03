use jiaoyan;
select distinct user_info.* from user_info 
where  user_jiaogonghao='011405' 
and user_info.user_type=(select usertype_name from usertype_info 
where usertype_info.usertype_id=4)
drop table user_info

#用户列名
create table usercolname_info
(
	usercolname_id int not null auto_increment,
	usercolname_name varchar(30),
	primary key(usercolname_id)
)

#用户信息
create table user_info
(
	user_id int not null auto_increment,
	user_jiaogonghao varchar(6) not null,
	user_password varchar(32) not null,
	user_name varchar(15),
	user_dept_name varchar(30),
	user_type varchar(10),
	user_xk_name varchar(10),
	user_sex varchar(1),
	user_birthday varchar(12),
	user_pos_name varchar(20),
	user_phone varchar(11),
	user_xw_name varchar(10),
	user_mail varchar(30),
	user_jyfx varchar(100),
	user_zjkc varchar(12),
	primary key(user_id)	
)
select * from user_info where user_dept_name='信息学院';
drop table user_info
select count(*) from user_info
delete from user_info


create table usertype_info
(
	usertype_id int not null auto_increment,
	usertype_name varchar(10),
	primary key(usertype_id)
)
select *from usertype_info
insert into usertype_info values(null,'系统管理员');
insert into usertype_info values(null,'教务处管理员');
insert into usertype_info values(null,'院系教务员');
insert into usertype_info values(null,'普通教师');


#教研项目
create table jiaoyan_info
(
	jy_id int not null auto_increment,
	jy_name varchar(20),
	primary key(jy_id)
)
drop table jiaoyan_info;
insert into jiaoyan_info value(null,'教改项目');
insert into jiaoyan_info value(null,'课程建设');
insert into jiaoyan_info value(null,'多媒体课件');
insert into jiaoyan_info value(null,'教材');
insert into jiaoyan_info value(null,'教学获奖');
insert into jiaoyan_info value(null,'专业与示范中心');


#公告通知信息表
create table notice_info
(
	not_id int not null auto_increment,
	not_type varchar(10),
	not_title varchar(100) not null,
	not_content text,
	not_source varchar(10),
	not_issuedate date,
	not_hits int,
	not_enclosure varchar(100),
	primary key(not_id)
)
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-20',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-22',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-22',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-22',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-22',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-23',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-23',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-23',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-24',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-24',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-25',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-25',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-25',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-25',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-26',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-26',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-21',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-26',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-26',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-29',0,'');
insert into notice_info value(null,'重要公告','专业与示范中心','专业与示范中心','教务通知','2011-08-29',0,'');









#院系信息表
create table department_info
(
    dept_id int not null auto_increment,
    dept_name varchar(30) not null,
    primary key(dept_id)
)
drop table department_info
delete from department_info where dept_id=37
select *from department_info
insert into department_info values(null,'材料学院');
insert into department_info values(null,'陶瓷美术学院');
insert into department_info values(null,'设计艺术学院');
insert into department_info values(null,'机电学院');
insert into department_info values(null,'工商学院');
insert into department_info values(null,'信息学院');
insert into department_info values(null,'人文社科学院');
insert into department_info values(null,'科技艺术学院');
insert into department_info values(null,'思政教学部');
insert into department_info values(null,'成教学院');
insert into department_info values(null,'教务处');
insert into department_info values(null,'科研校产处');
insert into department_info values(null,'研究生处');
insert into department_info values(null,'规划发展研究中心');
insert into department_info values(null,'学科建设发展研究中心');
insert into department_info values(null,'图书馆');
insert into department_info values(null,'现代教育技术中心');
insert into department_info values(null,'党（院）办');
insert into department_info values(null,'人事处');
insert into department_info values(null,'团委');
insert into department_info values(null,'学工部（处）');
insert into department_info values(null,'组织部（党校）');
insert into department_info values(null,'宣传部');
insert into department_info values(null,'统战部');
insert into department_info values(null,'计划财务处');
insert into department_info values(null,'设备处');
insert into department_info values(null,'保卫处');
insert into department_info values(null,'招生就业处');
insert into department_info values(null,'工会');
insert into department_info values(null,'陶研所');
insert into department_info values(null,'校领导');
insert into department_info values(null,'校督导');
insert into department_info values(null,'军事教研室');
insert into department_info values(null,'');






#专业技术资格信息表
create table position_info
(
    pos_id int not null auto_increment,
    pos_name varchar(20) not null,
    primary key(pos_id)
)
drop table position_info
insert into position_info values(null,'教授');
insert into position_info values(null,'副教授');
insert into position_info values(null,'讲师');
insert into position_info values(null,'研究员');
insert into position_info values(null,'副研究员');
insert into position_info values(null,'助理研究员');
insert into position_info values(null,'高级工程师');
insert into position_info values(null,'工程师');
insert into position_info values(null,'高级实验师');
insert into position_info values(null,'实验师');
insert into position_info values(null,'校领导');
insert into position_info values(null,'校督导');


#学科信息表
create table xueke_info
(
    xueke_id int not null auto_increment,
    xueke_name varchar(10) not null,
    primary key(xueke_id)
)
drop table xueke_info
insert into xueke_info values(null,'理工');
insert into xueke_info values(null,'文科');
insert into xueke_info values(null,'艺术');





#最高学位信息表
create table xuewei_info
(
    xuewei_id int not null auto_increment,
    xuewei_name varchar(10) not null,
    primary key(xuewei_id)
)
drop table xuewei_info
insert into xuewei_info values(null,'博士后');
insert into xuewei_info values(null,'博士');
insert into xuewei_info values(null,'硕士');
insert into xuewei_info values(null,'学士');
insert into xuewei_info values(null,'大专');

drop table expert_info

#课题类别
create table ketileibie_info
(
	ktlb_id int not null auto_increment,
	ktlb_name varchar(20) not null,
	primary key(ktlb_id)
)
drop table ketileibie_info
insert into ketileibie_info values(null,'重点资助');
insert into ketileibie_info values(null,'一般资助');
insert into ketileibie_info values(null,'招标项目');
insert into ketileibie_info values(null,'经费自筹');
insert into ketileibie_info values(null,'');

#专家列名
create table expertcolname_info
(
	expertcolname_id int not null auto_increment,
	expertcolname_name varchar(30),
	primary key(expertcolname_id)
)


#专家信息表
create table expert_info
(
	expt_id int not null auto_increment,
	expt_gh varchar(6) not null,
	expt_name varchar(10) not null,
	expt_xk_name varchar(10) not null,
	expt_rksj varchar(12),
	expt_dept_name varchar(30) not null,
	expt_sex varchar(1) not null,
	expt_birthday varchar(12),
	expt_pos_name varchar(20) not null,
	expt_mphone varchar(11) not null,
	expt_ophone varchar(12),
	expt_xw_name varchar(10),
	expt_mail varchar(30),
	expt_hphone varchar(12),
	expt_jyfx varchar(100) not null,
	expt_zjkc varchar(120),
	expt_rktj text,
	expt_jycj text,
	expt_cksj varchar(12),
	primary key(expt_id)
	/*foreign key(expt_xk_id) references xueke_info(xueke_id),
	foreign key(expt_dept_id) references department_info(dept_id),
	foreign key(expt_pos_id) references position_info(pos_id)*/
)

drop table expert_info


#教改列名
create table jiaogaicolname_info
(
	jiaogaicolname_id int not null auto_increment,
	jiaogaicolname_name varchar(30),
	primary key(jiaogaicolname_id)
)


select *from jiaogai_info
#教改课题信息表
create table jiaogai_info
(
   jg_id int not null auto_increment,
   jg_danganhao varchar(20),
   jg_ktmc varchar(50) not null,
   jg_fuzeren varchar(20) not null,
   jg_lxsj varchar(12),
   jg_dept_name varchar(30),
   jg_ktlb_name varchar(20),
   jg_cost float,
   jg_lxmember varchar(100),
   jg_jtmember varchar(100),
   jg_jtsj varchar(12),
   jg_yjtsj varchar(12),
   jg_jxzf int,
   jg_lxzj varchar(50),
   jg_jtzj varchar(50),
   jg_lxwh varchar(100),
   jg_jtwh varchar(100),
   jg_remark text, 
   primary key(jg_id)
)
select *from jiaogai_info where (jg_lxsj between '1995' and '2008.12' and jg_lxmember like '%周健儿%') or ((jg_jtsj between '1995' and '2008.12' and jg_jtmember like '%周健儿%'))


drop table jiaogaimemberjifen_info;
drop table jiaogai_info;

select distinct jiaogai_info.jg_fuzeren fuzeren,jiaogaimemberjifen_info.jgmjf_lxmjf,jiaogaimemberjifen_info.jgmjf_jtmjf 
from jiaogai_info,jiaogaimemberjifen_info 
where jiaogai_info.jg_id=jiaogaimemberjifen_info.jgmjf_jgid

select *from jiaogaimemberjifen_info
update jiaogai_info set jg_yjtsj='2007年07月' where jg_id=1
#教改成员积分表
create table jiaogaimemberjifen_info
(
	jgmjf_id int not null auto_increment,
	jgmjf_jgid int,
	jgmjf_zongjifen int,
	jgmjf_lxzongjifen float,
	jgmjf_jtzongjifen float,
	jgmjf_lxsj varchar(12),
	jgmjf_lxmjf varchar(300),
	jgmjf_jtsj varchar(12),
	jgmjf_jtmjf varchar(300),
	primary key(jgmjf_id),
	foreign key(jgmjf_jgid) references jiaogai_info(jg_id)
)


#课程列名
create table kechengcolname_info
(
	kechengcolname_id int not null auto_increment,
	kechengcolname_name varchar(30),
	primary key(kechengcolname_id)
)

#课程信息表
create table kecheng_info
(
	kch_id int not null auto_increment,
	kch_danganhao varchar(20),
	kch_lxsj varchar(12),
	kch_kcmc varchar(50) not null,
	kch_fuzeren varchar(20) not null,
	kch_dept_name varchar(30),
	kch_kcjb varchar(30),
	kch_sjsj varchar(24),
	kch_jtqk varchar(12),
	kch_jtsj varchar(12),
	kch_yjtsj varchar(12),
	kch_lxzj varchar(50),
	kch_lxwh varchar(100),
	kch_zjqk varchar(100),	
	kch_zjsj varchar(12),
	kch_zjzj varchar(50),
	kch_zjyj varchar(100),
	kch_jtzj varchar(50),
	kch_jtyj varchar(100),
	kch_jtwh varchar(100),
	kch_jxzf int,
	kch_lxmember varchar(100),
	kch_zjmember varchar(100),
	kch_jtmember varchar(100),
	kch_remark text,
	primary key(kch_id)
   /*foreign key(kch_dept_id) references department_info(dept_id)*/
)
select *from  kecheng_info 
where (kch_lxsj between '1994' and '2001.12'  and kch_lxmember like '%周健儿%') 
or (kch_zjsj between '1994' and '2001.12'  and kch_zjmember like '%周健儿%') 
or (kch_jtsj between '1994' and '2001.12'  and kch_jtmember like '%周健儿%' )

drop table kechengmemberjifen_info;
drop table kecheng_info;
select *from kecheng_info;
select *from kechengmemberjifen_info;

#课程成员积分表
create table kechengmemberjifen_info
(
	kchmjf_id int not null auto_increment,
	kchmjf_kchid int,
	kchmjf_zongjifen int,
	kchmjf_lxzongjifen float,
	kchmjf_zjzongjifen float,
	kchmjf_jtzongjifen float,
	kchmjf_lxsj varchar(12),
	kchmjf_lxmjf varchar(300),
	kchmjf_zjsj varchar(12),
	kchmjf_zjmjf varchar(300),
	kchmjf_jtsj varchar(12),
	kchmjf_jtmjf varchar(300),
	primary key(kchmjf_id),
	foreign key(kchmjf_kchid) references kecheng_info(kch_id)
)


#多媒体课件列名
create table multimediacolname_info
(
	multimediacolname_id int not null auto_increment,
	multimediacolname_name varchar(30),
	primary key(multimediacolname_id)
)

drop table multimedia_info
#多媒体课件信息表
create table multimedia_info
(
	mm_id int not null auto_increment,
	mm_danganhao varchar(20),
	mm_kjmc varchar(50) not null,
	mm_fuzeren varchar(20) not null,
	mm_dept_name varchar(30),
	mm_lxsj varchar(12),
	mm_jtqk varchar(12),
	mm_jtsj varchar(12),
	mm_yjtsj varchar(12),
	mm_hjjb varchar(50),
	mm_sjsj varchar(24),
	mm_cost varchar(10),
	mm_jxzf int,
	mm_lxmember varchar(100),
	mm_jtmember varchar(100),
	mm_lxzj varchar(50),
	mm_lxwh varchar(100),
	mm_zjqk varchar(100),
	mm_zjzj varchar(50),
	mm_jtzj varchar(50),
	mm_jtwh varchar(100),
	mm_remark text,	
	primary key(mm_id)
)

drop table multimediamemberjifen_info;
drop table multimedia_info;
select *from multimedia_info;
select *from multimediamemberjifen_info;

#多媒体成员积分表
create table multimediamemberjifen_info
(
	mmmjf_id int not null auto_increment,
	mmmjf_mmid int,
	mmmjf_zongjifen int,
	mmmjf_lxzongjifen float,
	mmmjf_jtzongjifen float,
	mmmjf_lxsj varchar(12),
	mmmjf_lxmjf varchar(300),
	mmmjf_jtsj varchar(12),
	mmmjf_jtmjf varchar(300),
	primary key(mmmjf_id),
	foreign key(mmmjf_mmid) references multimedia_info(mm_id)
)


select *from Multimedia_info 
where  mm_kjmc='建筑陶瓷工艺学' 
and Mm_fuzeren='石棋'  
and Mm_dept_name='材料学院' 
and mm_hjjb='国家级课件' 
and mm_sjsj='2007年12月' and mm_id!=1


#教材列名
create table jiaocaicolname_info
(
	jiaocaicolname_id int not null auto_increment,
	jiaocaicolname_name varchar(30),
	primary key(jiaocaicolname_id)
)

drop table jiaocai_info
#教材信息表
create table jiaocai_info
(	
	jc_id int not null auto_increment,
	jc_danganhao varchar(20),
	jc_jcmc varchar(50) not null,
	jc_zhubian varchar(20) not null,
	jc_fuzhubian varchar(20) not null,
	jc_cbsj varchar(12),
	jc_cbsm varchar(50),
	jc_tsbh varchar(25),
	jc_dept_name varchar(30),
	jc_jclb varchar(30),
	jc_member varchar(50),
	jc_jxzf int,
	jc_remark text,
	primary key(jc_id)
)
drop table jiaocaimemberjifen_info;
drop table jiaocai_info;
select *from jiaocai_info;
select *from jiaocaimemberjifen_info;
create table jiaocaimemberjifen_info
(
	jcmjf_id int not null auto_increment,
	jcmjf_jcid int,
	jcmjf_zongjifen int,
	jcmjf_cbsj varchar(12),
	jcmjf_zbmjf varchar(300),
	jcmjf_fbmjf varchar(300),
	jcmjf_cbmjf varchar(300),
	primary key(jcmjf_id),
	foreign key(jcmjf_jcid) references jiaocai_info(jc_id)
)


#教学获奖列名
create table huojiangcolname_info
(
	huojiangcolname_id int not null auto_increment,
	huojiangcolname_name varchar(30),
	primary key(huojiangcolname_id)
)

drop table huojiang_info
#教学获奖信息表
create table huojiang_info
(
	hj_id int not null auto_increment,
	hj_danganhao varchar(20),
	hj_jxmc varchar(50) not null,
	hj_hjjb varchar(50),
	hj_geshu int,
	hj_shenbaoren varchar(20) not null,
	hj_dept_name varchar(30),
	hj_hjsj varchar(12),
	hj_member varchar(100),
	hj_jxzf int,
	hj_remark text,
	primary key(hj_id)
)
drop table huojiangmemberjifen_info;
drop table huojiang_info;
select *from huojiang_info;
select *from huojiangmemberjifen_info;

#教学获奖成员积分表
create table huojiangmemberjifen_info
(
	hjmjf_id int not null auto_increment,
	hjmjf_hjid int,
	hjmjf_zongjifen int,
	hjmjf_sjsj varchar(12),
	hjmjf_sjmjf varchar(300),
	primary key(hjmjf_id),
	foreign key(hjmjf_hjid) references huojiang_info(hj_id)
)


#教学获奖列名
create table zhuangyecolname_info
(
	zhuangyecolname_id int not null auto_increment,
	zhuangyecolname_name varchar(30),
	primary key(zhuangyecolname_id)
)

drop table zhuangye_info
#专业与示范中心建设信息表
create table zhuangye_info
(
	zhy_id int not null auto_increment,
	zhy_danganhao varchar(20),
	zhy_xmmc varchar(50) not null,
	zhy_xmlb varchar(50) not null,
	zhy_shenbaoren varchar(20) not null,
	zhy_lxsj varchar(12),
	zhy_jtsj varchar(12),
	zhy_yjtsj varchar(12),
	zhy_dept_name varchar(30),
	zhy_jxzf int ,
	zhy_lxmember varchar(100),
	zhy_jtmember varchar(100),	
	zhy_remark text,
	primary key(zhy_id)
)

drop table zhuangyememberjifen_info;
drop table zhuangye_info;
select *from zhuangye_info;
select *from zhuangyememberjifen_info;

#专业与示范中心成员积分表
create table zhuangyememberjifen_info
(
	zhymjf_id int not null auto_increment,
	zhymjf_zhyid int,
	zhymjf_zongjifen int,
	zhymjf_lxzongjifen float,
	zhymjf_jtzongjifen float,
	zhymjf_lxsj varchar(12),
	zhymjf_lxmjf varchar(300),
	zhymjf_jtsj varchar(12),
	zhymjf_jtmjf varchar(300),	
	primary key(zhymjf_id),
	foreign key(zhymjf_zhyid) references zhuangye_info(zhy_id)
)


#教研级别信息表
create table jiaoyanjibie_info
(
	jyjb_id int not null auto_increment,
	jyjb_name varchar(10),
	primary key(jyjb_id)
)
drop table jiaoyanjibie_info;
insert into jiaoyanjibie_info values(null,'国家级');
insert into jiaoyanjibie_info values(null,'省部级');
insert into jiaoyanjibie_info values(null,'校级');

drop table jiaogaijifen_info
#教改积分标准信息表
create table jiaogaijifen_info
(
	jgjf_id int not null auto_increment,
	jgjf_khzb varchar(50),
	jgjf_zongjifen int not null,
	jgjf_lxjifen float not null,
	jgjf_zqjifen float not null,
	jgjf_jtjifen float not null,
	jgjf_remark text,
	primary key(jgjf_id)
)
select *from jiaogaijifen_info
insert into jiaogaijifen_info values(null,'*国家级教改项目',2000,800,0,1200,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');
insert into jiaogaijifen_info values(null,'*省级重点资助',500,200,0,300,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');
insert into jiaogaijifen_info values(null,'*省级招标项目',100,40,0,60,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');
insert into jiaogaijifen_info values(null,'*省级一般资助',300,120,0,180,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');
insert into jiaogaijifen_info values(null,'*省级经费自筹',100,40,0,60,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');
insert into jiaogaijifen_info values(null,'校级重点资助',150,60,0,90,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');
insert into jiaogaijifen_info values(null,'校级一般资助',80,32,0,48,'立项40%，通过结题验收60%。每延期一个月扣除2%的工作量，（最多扣30%）');


#课程建设积分标准信息表
create table kechengjifen_info
(
	kcjf_id int not null auto_increment,
	kcjf_khzb varchar(20) not null,
	kcjf_zongjifen int not null,
	kcjf_lxjifen float not null,
	kcjf_zqjifen float not null,
	kcjf_jtjifen float not null,
	kcjf_remark text,
	primary key(kcjf_id)
)
drop table kechengjifen_info
insert into kechengjifen_info values(null,'*国家级精品课程',1000,300,300,400,'课程群乘以1.5-2的系数，分值在建设周期内平均分配，校级重点建设课程项目立项30%，中期检查30%，结题40%');
insert into kechengjifen_info values(null,'*省级精品课程',300,90,90,120,'课程群乘以1.5-2的系数，分值在建设周期内平均分配，校级重点建设课程项目立项30%，中期检查30%，结题40%');
insert into kechengjifen_info values(null,'校级精品课程',50,15,15,20,'课程群乘以1.5-2的系数，分值在建设周期内平均分配，校级重点建设课程项目立项30%，中期检查30%，结题40%');
insert into kechengjifen_info values(null,'校级重点建设课程',100,30,30,40,'课程群乘以1.5-2的系数，分值在建设周期内平均分配，校级重点建设课程项目立项30%，中期检查30%，结题40%');
insert into kechengjifen_info values(null,'分院级重点建设课程',5,1.5,1.5,2,'一次性发放');
insert into kechengjifen_info values(null,'双语教学课程',5,1.5,1.5,2,'一次性发放');
insert into kechengjifen_info values(null,'人文素质选修课',5,1.5,1.5,2,'一次性发放');


drop table multimediajifen_info
#多媒体课件积分标准信息表
create table multimediajifen_info
(
	mmjf_id int not null auto_increment,
	mmjf_khzb varchar(50),
	mmjf_zongjifen int not null,
	mmjf_lxjifen float not null,
	mmjf_hjjifen float not null,
	mmjf_jtjifen float not null,
	mmjf_remark text,
	primary key(mmjf_id)
)
insert into multimediajifen_info values(null,'国家级多媒体课件一等奖',2000,0,0,0,'一次性发放');
insert into multimediajifen_info values(null,'国家级多媒体课件二等奖',2000,0,0,0,'一次性发放');
insert into multimediajifen_info values(null,'国家级多媒体课件三等奖',2000,0,0,0,'一次性发放');
insert into multimediajifen_info values(null,'省级多媒体课件一等奖',500,0,0,0,'一次性发放');
insert into multimediajifen_info values(null,'省级多媒体课件二等奖',300,0,0,0,'一次性发放');
insert into multimediajifen_info values(null,'省级多媒体课件三等奖',100,0,0,0,'一次性发放');
insert into multimediajifen_info values(null,'校级多媒体课件重点资助',150,60,0,90,'立项40%，结题60%');
insert into multimediajifen_info values(null,'校级多媒体课件一般资助',80,32,0,48,'立项40%，结题60%');

select *from multimediajifen_info
select *from kechengjifen_info
#教材积分标准信息表
create table jiaocaijifen_info
(
	jcjf_id int not null auto_increment,
	jcjf_khzb varchar(20) not null,
	jcjf_zongjifen int not null,
	jcjf_zbjifen float not null,
	jcjf_fbjifen float not null,
	jcjf_qtjifen float not null,
	jcjf_remark text,
	primary key(jcjf_id)
)
drop table jiaocaijifen_info
select *from jiaocaijifen_info
insert into jiaocaijifen_info values(null,'国家级规划教材',300,150,90,10,'已出版。多校合作；主编50%，副主编30%；参编：每章10分');
insert into jiaocaijifen_info values(null,'公开出版教材',160,80,48,10,'已出版。多校合作；主编50%，副主编30%；参编：每章10分');

#专业与示范中心积分标准信息表
create table zhuangyejifen_info
(
	zyjf_id int not null auto_increment,
	zyjf_khzb varchar(20) not null,
	zyjf_zongjifen int not null,
	zyjf_lxjifen float not null,
	zyjf_zqjifen float not null,
	zyjf_jtjifen float not null,	
	zyjf_remark text,
	primary key(zyjf_id)
)
select *from zhuangyejifen_info

drop table zhuangyejifen_info

insert into zhuangyejifen_info values(null,'*国家级品牌特色专业',1000,500,0,500,'立项50%,通过结题验收50%');
insert into zhuangyejifen_info values(null,'*省级品牌特色专业',300,150,0,150,'立项50%,通过结题验收50%');
insert into zhuangyejifen_info values(null,'校级品牌特色专业',50,25,0,25,'立项50%,通过结题验收50%');
insert into zhuangyejifen_info values(null,'新专业申报成功及建设',100,50,30,10,'成功申报50分；专业建设期3年，第一年30分，第二第三年每年10分');
insert into zhuangyejifen_info values(null,'编制培养计划',20,0,0,0,'');
insert into zhuangyejifen_info values(null,'*国家级专业评估',1000,0,0,0,'通过评估');
insert into zhuangyejifen_info values(null,'*省级专业评估',300,0,0,0,'通过评估');
insert into zhuangyejifen_info values(null,'*国家级实验教学示范中心',1000,500,0,500,'立项50%,通过结题验收50%');
insert into zhuangyejifen_info values(null,'*省级实验教学示范中心',300,150,0,150,'立项50%,通过结题验收50%');
insert into zhuangyejifen_info values(null,'校级实验教学示范中心',50,25,0,25,'立项50%,通过结题验收50%');
insert into zhuangyejifen_info values(null,'编制教学大纲',50,0,0,0,'一次性发放积分');
insert into zhuangyejifen_info values(null,'辅修专业',50,25,0,25,'立项50%,通过结题验收50%');

create table huojiangjifen_info
(
	hjjf_id int not null auto_increment,
	hjjf_khzb varchar(50) not null,
	hjjf_zongjifen int not null,
	hjjf_lxjifen float not null,
	hjjf_zqjifen float not null,
	hjjf_jtjifen float not null,
	hjjf_remark text,
	primary key(hjjf_id)
)
drop table huojiangjifen_info
insert into huojiangjifen_info values(null,'*国家级多媒体课件一等奖',2000,0,0,0,'一次性发放');
insert into huojiangjifen_info values(null,'*国家级多媒体课件二等奖',2000,0,0,0,'一次性发放');
insert into huojiangjifen_info values(null,'*国家级多媒体课件三等奖',2000,0,0,0,'一次性发放');
insert into huojiangjifen_info values(null,'*省级多媒体课件一等奖',500,0,0,0,'一次性发放');
insert into huojiangjifen_info values(null,'*省级多媒体课件二等奖',300,0,0,0,'一次性发放');
insert into huojiangjifen_info values(null,'*省级多媒体课件三等奖',100,0,0,0,'一次性发放');
insert into huojiangjifen_info values(null,'校级多媒体课件重点资助',150,60,0,90,'立项40%，结题60%');
insert into huojiangjifen_info values(null,'校级多媒体课件一般资助',80,32,0,48,'立项40%，结题60%');
insert into huojiangjifen_info values(null,'*省级优秀毕业设计（论文）指导教师',60,0,0,0,'');
insert into huojiangjifen_info values(null,'校级或随机抽样优秀毕业设计（论文）指导教师',20,0,0,0,'');
insert into huojiangjifen_info values(null,'*国家级教学团队',1500,450,450,600,'立项30%，中期检查30%，结题40%');
insert into huojiangjifen_info values(null,'*省级教学团队',500,150,150,200,'立项30%，中期检查30%，结题40%');
insert into huojiangjifen_info values(null,'校级教学团队',200,60,60,80,'立项30%，中期检查30%，结题40%');
insert into huojiangjifen_info values(null,'*学科竞赛、第二课堂、体育竞赛等全国一等奖',60,0,0,0,'对于同一个只计算最高奖');
insert into huojiangjifen_info values(null,'*学科竞赛、第二课堂、体育竞赛等全国二等奖',50,0,0,0,'同上');
insert into huojiangjifen_info values(null,'*学科竞赛、第二课堂、体育竞赛等全国三等奖',40,0,0,0,'同上');
insert into huojiangjifen_info values(null,'*学科竞赛、第二课堂、体育竞赛等全省一等奖',30,0,0,0,'同上');
insert into huojiangjifen_info values(null,'*学科竞赛、第二课堂、体育竞赛等全省二等奖',20,0,0,0,'同上');
insert into huojiangjifen_info values(null,'*学科竞赛、第二课堂、体育竞赛等全省三等奖',10,0,0,0,'同上');
insert into huojiangjifen_info values(null,'*国家级教学成果一等奖',1600,0,0,0,'');
insert into huojiangjifen_info values(null,'*国家级教学成果二等奖',1000,0,0,0,'');
insert into huojiangjifen_info values(null,'*国家级教学成果三等奖',600,0,0,0,'');
insert into huojiangjifen_info values(null,'*省部级教学成果一等奖',300,0,0,0,'');
insert into huojiangjifen_info values(null,'*省部级教学成果二等奖',200,0,0,0,'');
insert into huojiangjifen_info values(null,'*省部级教学成果三等奖',100,0,0,0,'');
insert into huojiangjifen_info values(null,'校级教学成果一等奖',80,0,0,0,'');
insert into huojiangjifen_info values(null,'校级教学成果二等奖',50,0,0,0,'');
insert into huojiangjifen_info values(null,'校级教学成果三等奖',30,0,0,0,'');


select *from huojiangjifen_info
select *from zhuangyejifen_info
select *from jiaogaijifen_info
select *from zhuangye_info
select *from huojiang_info
drop table multimedia_info
select *from jiaocai_info
select *from expert_info
select *from multimedia_info
drop table kecheng_info
select *from jiaogai_info where jg_fuzeren='欧阳春'
select * from kecheng_info

select  distinct expert_info.*,department_info.*,position_info.*,xueke_info.* 
from expert_info,department_info,position_info,xueke_info  
where expert_info.expt_xk_id=xueke_info.xueke_id
and expert_info.expt_dept_id=department_info.dept_id  
and expert_info.expt_pos_id=position_info.pos_id   
and expt_sex like '%%'  
order by expt_id  limit 0,18

select  distinct kecheng_info.*,department_info.*  
from kecheng_info,department_info  
where kecheng_info.kch_dept_id=department_info.dept_id  
and kch_kcmc like '%%' 
and kch_fuzeren like '%%' 
and kch_lxsj like '%%' 
and kch_sjsj like '%%' 
order by kch_id  limit 0,18


select  distinct multimedia_info.*,department_info.*  
from multimedia_info,department_info  
where multimedia_info.mm_dept_id=department_info.dept_id  
and Mm_kjmc like '%null%' and Mm_fuzeren like '%%' and Mm_lxsj like '%%' and Mm_jtsj like '%%' order by Mm_id  limit 0,18




select *from notice_info order by not_id desc
select *from notice_info where not_id=20


select *from jiaogaimemberjifen_info;
select *from kechengmemberjifen_info;
select *from multimediamemberjifen_info;
select *from jiaocaimemberjifen_info;
select *from huojiangmemberjifen_info;
select *from zhuangyememberjifen_info;

delete from expert_info;
delete from notice_info;
delete from jiaogaimemberjifen_info;
delete from jiaogai_info;
delete from kechengmemberjifen_info;
delete from kecheng_info;
delete from multimediamemberjifen_info;
delete from multimedia_info;
delete from jiaocaimemberjifen_info;
delete from jiaocai_info;
delete from huojiangmemberjifen_info;
delete from huojiang_info;
delete from zhuangyememberjifen_info;
delete from zhuangye_info;
select *from jiaogai_info
select *from multimediamemberjifen_info;
select *from jiaogaimemberjifen_info;
select *from kechengmemberjifen_info;


select distinct jiaogai_info.jg_fuzeren fuzeren,jiaogaimemberjifen_info.*  
from jiaogai_info,jiaogaimemberjifen_info 
where ((jiaogaimemberjifen_info.jgmjf_lxmjf like '%周健儿%' 
and jiaogaimemberjifen_info.jgmjf_lxsj like '%1995%')  
or (jiaogaimemberjifen_info.jgmjf_jtmjf like '%周健儿%' 
and jiaogaimemberjifen_info.jgmjf_jtsj like '%1995%')) 
and jiaogai_info.jg_id=jiaogaimemberjifen_info.jgmjf_jgid
 

select * from notice_info
where not_type like '%%' 
and not_title like '%%' 
and not_issuedate between '2011-08-20' and '2011-08-21'
 
 
 
 
 
 