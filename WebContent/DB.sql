CREATE TABLE "TREEINFO" (
	"TREECODE"	NUMBER(3),
	"TREENAME"	VARCHAR2(100),
	"TREELIFE"	VARCHAR2(5)		NULL,
	"TREEAREA"	VARCHAR2(1000) 	NULL,
	"TREECLASS1"	VARCHAR2(200)	NULL,
	"TREECLASS2"	VARCHAR2(200)	NULL,
	"TREECLASS3"	VARCHAR2(200)	NULL,
	"TREECLASS4"	VARCHAR2(200)	NULL,
	"TREECLASS5"	VARCHAR2(200)	NULL,
	"TREECLASS6"	VARCHAR2(200)	NULL,
	"TREECLASS7"	VARCHAR2(200)	NULL,
	"TREEINTRO"	VARCHAR2(500)	NULL,
	"TREEPOINT"	VARCHAR2(2000)		NULL,
	"TREEPHOTO"	VARCHAR2(1000)		NULL,
	constraint treeinfo_pk primary key("TREECODE","TREENAME")
);
select * from treeinfo where treename = '개회나무'
select treename from treeinfo
select * from userinfo
CREATE TABLE "USERINFO" (
	"USERID"	VARCHAR2(50)		primary key,
	"USERPW"	VARCHAR2(30)		NULL,
	"USERNAME"	VARCHAR2(20)		NULL,
	"USERGENDER"	VARCHAR2(1)		NULL,
	"NICKNAME"	VARCHAR2(30)		NULL
);
CREATE TABLE "TREECORPORATION" (
	"CPNAME"	VARCHAR2(20)		NOT NULL,
	"CPURL"	VARCHAR2(500)		NULL,
	"CPINTRO"	VARCHAR2(2000)		NULL,
	"CPPHOTO"	VARCHAR2(1000)		NULL,
	"CPCALL"	VARCHAR2(15)		NULL,
	CONSTRAINT "PK_TREECORPORATION" PRIMARY KEY("CPNAME","CPURL")
);
select * from treecampaign
CREATE TABLE "TREECAMPAIGN" (
	"TCCODE"	NUMBER(3)		NOT NULL,
	"CPNAME"	VARCHAR2(50)	NULL,
	"CPURL"	VARCHAR2(500)		NULL,
	"TCNAME"	VARCHAR2(200)	NULL,
	"TCINTRO"	VARCHAR2(2000)		NULL,
	"TCURL"	VARCHAR2(500)		NULL,
	"TCCALL"	VARCHAR2(15)		NULL,
	"TCDATE"	DATE NULL,
	"TCSTATE"	VARCHAR2(2)		NULL,	/* 1 = 모집, -1 = 종료 */
	"TCPHOTO"	VARCHAR2(1000) NULL,
	CONSTRAINT "PK_TREECAMPAIN" PRIMARY KEY("TCCODE"),
	CONSTRAINT "FK_TP_TO_TC1" FOREIGN KEY ("CPNAME","CPURL") REFERENCES "TREECORPORATION"("CPNAME","CPURL")

);
select * from treecampaign order by tcdate asc
select * from treecorporation
/*TREEINFO 가값*/
INSERT INTO TREEINFO VALUES(1,'오민우나무','100','학생이다.','오민우.JPG');
INSERT INTO TREEINFO VALUES(2,'서준호나무','90','학생이다.','서준호.JPG');
/*USERINFO 가값*/
INSERT INTO USERINFO VALUES('abc123','1234','오민우','M','닝겐군단');
INSERT INTO USERINFO VALUES('ZZ','1','서준호','F','SLDRPSRNSEKS');

/*TREECORPORATION 가값*/
INSERT INTO TREECORPORATION VALUES('트리플래닛','https://treepla.net/','나무심는 기업','트리플래닛.JPG','02-512-2492');
select * from treeinfo
/*TREECAMPAIN 가값*/
INSERT INTO TREECAMPAIGN VALUES(001 ,'트리플래닛', 'https://treepla.net/', '강원 산불피해 복구 숲', '까맣게 타버린 강원의 숲, 까맣게 잊은 당신에게','https://treepla.net/forestfires','02-512-2492', '2021-06-12',1,'11.JPG');

insert into treecorporation values('환경교육센터','http://www.edutopia.or.kr/','환경교육센터는 생명, 평화, 참여, 나눔의 가치를 추구합니다.','11','02-735-8677');
select * from treecampaign

