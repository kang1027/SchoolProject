create table USERINFO(
	usercode	number(5)	primary key,
	username	varchar2(20) not null,
	usergender	varchar2(1)	not null,
	useraddress	varchar2(30) not null,
	usernickname	varchar2(10) not null
);
create table TREEINFO(
	treecode	number(5),
	treename	varchar2(20),
	treelife	varchar2(5),
	treepoint	varchar2(1000),
	constraint treeinfo_pk	primary key(treecode, treename)
);
insert into userinfo values(00001, '강동현','M','수지구','강도');
insert into userinfo values(00002, '강응찬','M','지구','변태');
insert into userinfo values(00003, '홍준혁','M','우주','변태');
insert into userinfo values(00004, '서준호','F','태양계','변태');
insert into userinfo values(00005, '오민우','M','우리은하','변태');

insert into treeinfo values(00001,'느티나무','1000','느티나무는 느릅나무과에 속하는 낙엽큰키나무이다. 느릅나무과에 속하는 나무의 특징은 잎이 홑잎이고 가장자리 톱니가 발달하고 잎 아랫부분은 좌우가 비대칭으로 발달하는 짝궁둥이 잎을 가지고 나무들이다.');
insert into treeinfo values(00002,'산딸나무','80','층층나무과 층층나무속에 속하는 낙엽 활엽 교목. 경기도 이남 지역에 자생한다. 들매나무, 미영꽃나무, 준딸나무, 소리딸나무, 애기산딸나무, 굳은산딸나무 등으로 다양하게 불린다. 원산지는 한국과 일본이다.');
insert into treeinfo values(00003,'소나무','140','그럼, 겉씨식물의 대표적 식물인 소나무의 생김새와 특징에 대해 알아볼까요. 소나무는 줄기는 높이 35m, 지름 1.8m 정도이며 수피는 붉은빛을 띤 갈색을 띄지만 밑부분은 검은 갈색입니다. 잎은 바늘 모양의 잎이 2개씩 뭉쳐나며, 2년이 지나면 밑부분의 바늘잎이 떨어집니다.');
