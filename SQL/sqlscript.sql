use jiaoyan;
select distinct user_info.* from user_info 
where  user_jiaogonghao='011405' 
and user_info.user_type=(select usertype_name from usertype_info 
where usertype_info.usertype_id=4)
drop table user_info

#�û�����
create table usercolname_info
(
	usercolname_id int not null auto_increment,
	usercolname_name varchar(30),
	primary key(usercolname_id)
)

#�û���Ϣ
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
select * from user_info where user_dept_name='��ϢѧԺ';
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
insert into usertype_info values(null,'ϵͳ����Ա');
insert into usertype_info values(null,'���񴦹���Ա');
insert into usertype_info values(null,'Ժϵ����Ա');
insert into usertype_info values(null,'��ͨ��ʦ');


#������Ŀ
create table jiaoyan_info
(
	jy_id int not null auto_increment,
	jy_name varchar(20),
	primary key(jy_id)
)
drop table jiaoyan_info;
insert into jiaoyan_info value(null,'�̸���Ŀ');
insert into jiaoyan_info value(null,'�γ̽���');
insert into jiaoyan_info value(null,'��ý��μ�');
insert into jiaoyan_info value(null,'�̲�');
insert into jiaoyan_info value(null,'��ѧ��');
insert into jiaoyan_info value(null,'רҵ��ʾ������');


#����֪ͨ��Ϣ��
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
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-20',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-22',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-22',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-22',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-22',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-23',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-23',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-23',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-24',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-24',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-25',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-25',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-25',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-25',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-26',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-26',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-21',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-26',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-26',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-29',0,'');
insert into notice_info value(null,'��Ҫ����','רҵ��ʾ������','רҵ��ʾ������','����֪ͨ','2011-08-29',0,'');









#Ժϵ��Ϣ��
create table department_info
(
    dept_id int not null auto_increment,
    dept_name varchar(30) not null,
    primary key(dept_id)
)
drop table department_info
delete from department_info where dept_id=37
select *from department_info
insert into department_info values(null,'����ѧԺ');
insert into department_info values(null,'�մ�����ѧԺ');
insert into department_info values(null,'�������ѧԺ');
insert into department_info values(null,'����ѧԺ');
insert into department_info values(null,'����ѧԺ');
insert into department_info values(null,'��ϢѧԺ');
insert into department_info values(null,'�������ѧԺ');
insert into department_info values(null,'�Ƽ�����ѧԺ');
insert into department_info values(null,'˼����ѧ��');
insert into department_info values(null,'�ɽ�ѧԺ');
insert into department_info values(null,'����');
insert into department_info values(null,'����У����');
insert into department_info values(null,'�о�����');
insert into department_info values(null,'�滮��չ�о�����');
insert into department_info values(null,'ѧ�ƽ��跢չ�о�����');
insert into department_info values(null,'ͼ���');
insert into department_info values(null,'�ִ�������������');
insert into department_info values(null,'����Ժ����');
insert into department_info values(null,'���´�');
insert into department_info values(null,'��ί');
insert into department_info values(null,'ѧ����������');
insert into department_info values(null,'��֯������У��');
insert into department_info values(null,'������');
insert into department_info values(null,'ͳս��');
insert into department_info values(null,'�ƻ�����');
insert into department_info values(null,'�豸��');
insert into department_info values(null,'������');
insert into department_info values(null,'������ҵ��');
insert into department_info values(null,'����');
insert into department_info values(null,'������');
insert into department_info values(null,'У�쵼');
insert into department_info values(null,'У����');
insert into department_info values(null,'���½�����');
insert into department_info values(null,'');






#רҵ�����ʸ���Ϣ��
create table position_info
(
    pos_id int not null auto_increment,
    pos_name varchar(20) not null,
    primary key(pos_id)
)
drop table position_info
insert into position_info values(null,'����');
insert into position_info values(null,'������');
insert into position_info values(null,'��ʦ');
insert into position_info values(null,'�о�Ա');
insert into position_info values(null,'���о�Ա');
insert into position_info values(null,'�����о�Ա');
insert into position_info values(null,'�߼�����ʦ');
insert into position_info values(null,'����ʦ');
insert into position_info values(null,'�߼�ʵ��ʦ');
insert into position_info values(null,'ʵ��ʦ');
insert into position_info values(null,'У�쵼');
insert into position_info values(null,'У����');


#ѧ����Ϣ��
create table xueke_info
(
    xueke_id int not null auto_increment,
    xueke_name varchar(10) not null,
    primary key(xueke_id)
)
drop table xueke_info
insert into xueke_info values(null,'��');
insert into xueke_info values(null,'�Ŀ�');
insert into xueke_info values(null,'����');





#���ѧλ��Ϣ��
create table xuewei_info
(
    xuewei_id int not null auto_increment,
    xuewei_name varchar(10) not null,
    primary key(xuewei_id)
)
drop table xuewei_info
insert into xuewei_info values(null,'��ʿ��');
insert into xuewei_info values(null,'��ʿ');
insert into xuewei_info values(null,'˶ʿ');
insert into xuewei_info values(null,'ѧʿ');
insert into xuewei_info values(null,'��ר');

drop table expert_info

#�������
create table ketileibie_info
(
	ktlb_id int not null auto_increment,
	ktlb_name varchar(20) not null,
	primary key(ktlb_id)
)
drop table ketileibie_info
insert into ketileibie_info values(null,'�ص�����');
insert into ketileibie_info values(null,'һ������');
insert into ketileibie_info values(null,'�б���Ŀ');
insert into ketileibie_info values(null,'�����Գ�');
insert into ketileibie_info values(null,'');

#ר������
create table expertcolname_info
(
	expertcolname_id int not null auto_increment,
	expertcolname_name varchar(30),
	primary key(expertcolname_id)
)


#ר����Ϣ��
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


#�̸�����
create table jiaogaicolname_info
(
	jiaogaicolname_id int not null auto_increment,
	jiaogaicolname_name varchar(30),
	primary key(jiaogaicolname_id)
)


select *from jiaogai_info
#�̸Ŀ�����Ϣ��
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
select *from jiaogai_info where (jg_lxsj between '1995' and '2008.12' and jg_lxmember like '%�ܽ���%') or ((jg_jtsj between '1995' and '2008.12' and jg_jtmember like '%�ܽ���%'))


drop table jiaogaimemberjifen_info;
drop table jiaogai_info;

select distinct jiaogai_info.jg_fuzeren fuzeren,jiaogaimemberjifen_info.jgmjf_lxmjf,jiaogaimemberjifen_info.jgmjf_jtmjf 
from jiaogai_info,jiaogaimemberjifen_info 
where jiaogai_info.jg_id=jiaogaimemberjifen_info.jgmjf_jgid

select *from jiaogaimemberjifen_info
update jiaogai_info set jg_yjtsj='2007��07��' where jg_id=1
#�̸ĳ�Ա���ֱ�
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


#�γ�����
create table kechengcolname_info
(
	kechengcolname_id int not null auto_increment,
	kechengcolname_name varchar(30),
	primary key(kechengcolname_id)
)

#�γ���Ϣ��
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
where (kch_lxsj between '1994' and '2001.12'  and kch_lxmember like '%�ܽ���%') 
or (kch_zjsj between '1994' and '2001.12'  and kch_zjmember like '%�ܽ���%') 
or (kch_jtsj between '1994' and '2001.12'  and kch_jtmember like '%�ܽ���%' )

drop table kechengmemberjifen_info;
drop table kecheng_info;
select *from kecheng_info;
select *from kechengmemberjifen_info;

#�γ̳�Ա���ֱ�
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


#��ý��μ�����
create table multimediacolname_info
(
	multimediacolname_id int not null auto_increment,
	multimediacolname_name varchar(30),
	primary key(multimediacolname_id)
)

drop table multimedia_info
#��ý��μ���Ϣ��
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

#��ý���Ա���ֱ�
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
where  mm_kjmc='�����մɹ���ѧ' 
and Mm_fuzeren='ʯ��'  
and Mm_dept_name='����ѧԺ' 
and mm_hjjb='���Ҽ��μ�' 
and mm_sjsj='2007��12��' and mm_id!=1


#�̲�����
create table jiaocaicolname_info
(
	jiaocaicolname_id int not null auto_increment,
	jiaocaicolname_name varchar(30),
	primary key(jiaocaicolname_id)
)

drop table jiaocai_info
#�̲���Ϣ��
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


#��ѧ������
create table huojiangcolname_info
(
	huojiangcolname_id int not null auto_increment,
	huojiangcolname_name varchar(30),
	primary key(huojiangcolname_id)
)

drop table huojiang_info
#��ѧ����Ϣ��
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

#��ѧ�񽱳�Ա���ֱ�
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


#��ѧ������
create table zhuangyecolname_info
(
	zhuangyecolname_id int not null auto_increment,
	zhuangyecolname_name varchar(30),
	primary key(zhuangyecolname_id)
)

drop table zhuangye_info
#רҵ��ʾ�����Ľ�����Ϣ��
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

#רҵ��ʾ�����ĳ�Ա���ֱ�
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


#���м�����Ϣ��
create table jiaoyanjibie_info
(
	jyjb_id int not null auto_increment,
	jyjb_name varchar(10),
	primary key(jyjb_id)
)
drop table jiaoyanjibie_info;
insert into jiaoyanjibie_info values(null,'���Ҽ�');
insert into jiaoyanjibie_info values(null,'ʡ����');
insert into jiaoyanjibie_info values(null,'У��');

drop table jiaogaijifen_info
#�̸Ļ��ֱ�׼��Ϣ��
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
insert into jiaogaijifen_info values(null,'*���Ҽ��̸���Ŀ',2000,800,0,1200,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');
insert into jiaogaijifen_info values(null,'*ʡ���ص�����',500,200,0,300,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');
insert into jiaogaijifen_info values(null,'*ʡ���б���Ŀ',100,40,0,60,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');
insert into jiaogaijifen_info values(null,'*ʡ��һ������',300,120,0,180,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');
insert into jiaogaijifen_info values(null,'*ʡ�������Գ�',100,40,0,60,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');
insert into jiaogaijifen_info values(null,'У���ص�����',150,60,0,90,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');
insert into jiaogaijifen_info values(null,'У��һ������',80,32,0,48,'����40%��ͨ����������60%��ÿ����һ���¿۳�2%�Ĺ�������������30%��');


#�γ̽�����ֱ�׼��Ϣ��
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
insert into kechengjifen_info values(null,'*���Ҽ���Ʒ�γ�',1000,300,300,400,'�γ�Ⱥ����1.5-2��ϵ������ֵ�ڽ���������ƽ�����䣬У���ص㽨��γ���Ŀ����30%�����ڼ��30%������40%');
insert into kechengjifen_info values(null,'*ʡ����Ʒ�γ�',300,90,90,120,'�γ�Ⱥ����1.5-2��ϵ������ֵ�ڽ���������ƽ�����䣬У���ص㽨��γ���Ŀ����30%�����ڼ��30%������40%');
insert into kechengjifen_info values(null,'У����Ʒ�γ�',50,15,15,20,'�γ�Ⱥ����1.5-2��ϵ������ֵ�ڽ���������ƽ�����䣬У���ص㽨��γ���Ŀ����30%�����ڼ��30%������40%');
insert into kechengjifen_info values(null,'У���ص㽨��γ�',100,30,30,40,'�γ�Ⱥ����1.5-2��ϵ������ֵ�ڽ���������ƽ�����䣬У���ص㽨��γ���Ŀ����30%�����ڼ��30%������40%');
insert into kechengjifen_info values(null,'��Ժ���ص㽨��γ�',5,1.5,1.5,2,'һ���Է���');
insert into kechengjifen_info values(null,'˫���ѧ�γ�',5,1.5,1.5,2,'һ���Է���');
insert into kechengjifen_info values(null,'��������ѡ�޿�',5,1.5,1.5,2,'һ���Է���');


drop table multimediajifen_info
#��ý��μ����ֱ�׼��Ϣ��
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
insert into multimediajifen_info values(null,'���Ҽ���ý��μ�һ�Ƚ�',2000,0,0,0,'һ���Է���');
insert into multimediajifen_info values(null,'���Ҽ���ý��μ����Ƚ�',2000,0,0,0,'һ���Է���');
insert into multimediajifen_info values(null,'���Ҽ���ý��μ����Ƚ�',2000,0,0,0,'һ���Է���');
insert into multimediajifen_info values(null,'ʡ����ý��μ�һ�Ƚ�',500,0,0,0,'һ���Է���');
insert into multimediajifen_info values(null,'ʡ����ý��μ����Ƚ�',300,0,0,0,'һ���Է���');
insert into multimediajifen_info values(null,'ʡ����ý��μ����Ƚ�',100,0,0,0,'һ���Է���');
insert into multimediajifen_info values(null,'У����ý��μ��ص�����',150,60,0,90,'����40%������60%');
insert into multimediajifen_info values(null,'У����ý��μ�һ������',80,32,0,48,'����40%������60%');

select *from multimediajifen_info
select *from kechengjifen_info
#�̲Ļ��ֱ�׼��Ϣ��
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
insert into jiaocaijifen_info values(null,'���Ҽ��滮�̲�',300,150,90,10,'�ѳ��档��У����������50%��������30%���αࣺÿ��10��');
insert into jiaocaijifen_info values(null,'��������̲�',160,80,48,10,'�ѳ��档��У����������50%��������30%���αࣺÿ��10��');

#רҵ��ʾ�����Ļ��ֱ�׼��Ϣ��
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

insert into zhuangyejifen_info values(null,'*���Ҽ�Ʒ����ɫרҵ',1000,500,0,500,'����50%,ͨ����������50%');
insert into zhuangyejifen_info values(null,'*ʡ��Ʒ����ɫרҵ',300,150,0,150,'����50%,ͨ����������50%');
insert into zhuangyejifen_info values(null,'У��Ʒ����ɫרҵ',50,25,0,25,'����50%,ͨ����������50%');
insert into zhuangyejifen_info values(null,'��רҵ�걨�ɹ�������',100,50,30,10,'�ɹ��걨50�֣�רҵ������3�꣬��һ��30�֣��ڶ�������ÿ��10��');
insert into zhuangyejifen_info values(null,'���������ƻ�',20,0,0,0,'');
insert into zhuangyejifen_info values(null,'*���Ҽ�רҵ����',1000,0,0,0,'ͨ������');
insert into zhuangyejifen_info values(null,'*ʡ��רҵ����',300,0,0,0,'ͨ������');
insert into zhuangyejifen_info values(null,'*���Ҽ�ʵ���ѧʾ������',1000,500,0,500,'����50%,ͨ����������50%');
insert into zhuangyejifen_info values(null,'*ʡ��ʵ���ѧʾ������',300,150,0,150,'����50%,ͨ����������50%');
insert into zhuangyejifen_info values(null,'У��ʵ���ѧʾ������',50,25,0,25,'����50%,ͨ����������50%');
insert into zhuangyejifen_info values(null,'���ƽ�ѧ���',50,0,0,0,'һ���Է��Ż���');
insert into zhuangyejifen_info values(null,'����רҵ',50,25,0,25,'����50%,ͨ����������50%');

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
insert into huojiangjifen_info values(null,'*���Ҽ���ý��μ�һ�Ƚ�',2000,0,0,0,'һ���Է���');
insert into huojiangjifen_info values(null,'*���Ҽ���ý��μ����Ƚ�',2000,0,0,0,'һ���Է���');
insert into huojiangjifen_info values(null,'*���Ҽ���ý��μ����Ƚ�',2000,0,0,0,'һ���Է���');
insert into huojiangjifen_info values(null,'*ʡ����ý��μ�һ�Ƚ�',500,0,0,0,'һ���Է���');
insert into huojiangjifen_info values(null,'*ʡ����ý��μ����Ƚ�',300,0,0,0,'һ���Է���');
insert into huojiangjifen_info values(null,'*ʡ����ý��μ����Ƚ�',100,0,0,0,'һ���Է���');
insert into huojiangjifen_info values(null,'У����ý��μ��ص�����',150,60,0,90,'����40%������60%');
insert into huojiangjifen_info values(null,'У����ý��μ�һ������',80,32,0,48,'����40%������60%');
insert into huojiangjifen_info values(null,'*ʡ�������ҵ��ƣ����ģ�ָ����ʦ',60,0,0,0,'');
insert into huojiangjifen_info values(null,'У����������������ҵ��ƣ����ģ�ָ����ʦ',20,0,0,0,'');
insert into huojiangjifen_info values(null,'*���Ҽ���ѧ�Ŷ�',1500,450,450,600,'����30%�����ڼ��30%������40%');
insert into huojiangjifen_info values(null,'*ʡ����ѧ�Ŷ�',500,150,150,200,'����30%�����ڼ��30%������40%');
insert into huojiangjifen_info values(null,'У����ѧ�Ŷ�',200,60,60,80,'����30%�����ڼ��30%������40%');
insert into huojiangjifen_info values(null,'*ѧ�ƾ������ڶ����á�����������ȫ��һ�Ƚ�',60,0,0,0,'����ͬһ��ֻ������߽�');
insert into huojiangjifen_info values(null,'*ѧ�ƾ������ڶ����á�����������ȫ�����Ƚ�',50,0,0,0,'ͬ��');
insert into huojiangjifen_info values(null,'*ѧ�ƾ������ڶ����á�����������ȫ�����Ƚ�',40,0,0,0,'ͬ��');
insert into huojiangjifen_info values(null,'*ѧ�ƾ������ڶ����á�����������ȫʡһ�Ƚ�',30,0,0,0,'ͬ��');
insert into huojiangjifen_info values(null,'*ѧ�ƾ������ڶ����á�����������ȫʡ���Ƚ�',20,0,0,0,'ͬ��');
insert into huojiangjifen_info values(null,'*ѧ�ƾ������ڶ����á�����������ȫʡ���Ƚ�',10,0,0,0,'ͬ��');
insert into huojiangjifen_info values(null,'*���Ҽ���ѧ�ɹ�һ�Ƚ�',1600,0,0,0,'');
insert into huojiangjifen_info values(null,'*���Ҽ���ѧ�ɹ����Ƚ�',1000,0,0,0,'');
insert into huojiangjifen_info values(null,'*���Ҽ���ѧ�ɹ����Ƚ�',600,0,0,0,'');
insert into huojiangjifen_info values(null,'*ʡ������ѧ�ɹ�һ�Ƚ�',300,0,0,0,'');
insert into huojiangjifen_info values(null,'*ʡ������ѧ�ɹ����Ƚ�',200,0,0,0,'');
insert into huojiangjifen_info values(null,'*ʡ������ѧ�ɹ����Ƚ�',100,0,0,0,'');
insert into huojiangjifen_info values(null,'У����ѧ�ɹ�һ�Ƚ�',80,0,0,0,'');
insert into huojiangjifen_info values(null,'У����ѧ�ɹ����Ƚ�',50,0,0,0,'');
insert into huojiangjifen_info values(null,'У����ѧ�ɹ����Ƚ�',30,0,0,0,'');


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
select *from jiaogai_info where jg_fuzeren='ŷ����'
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
where ((jiaogaimemberjifen_info.jgmjf_lxmjf like '%�ܽ���%' 
and jiaogaimemberjifen_info.jgmjf_lxsj like '%1995%')  
or (jiaogaimemberjifen_info.jgmjf_jtmjf like '%�ܽ���%' 
and jiaogaimemberjifen_info.jgmjf_jtsj like '%1995%')) 
and jiaogai_info.jg_id=jiaogaimemberjifen_info.jgmjf_jgid
 

select * from notice_info
where not_type like '%%' 
and not_title like '%%' 
and not_issuedate between '2011-08-20' and '2011-08-21'
 
 
 
 
 
 