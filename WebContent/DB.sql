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
);ㅇ
insert into userinfo values(00001, '媛뺣룞�쁽','M','�닔吏�援�','媛뺣룄');
insert into userinfo values(00002, '媛뺤쓳李�','M','吏�援�','蹂��깭');
insert into userinfo values(00003, '�솉以��쁺','M','�슦二�','蹂��깭');
insert into userinfo values(00004, '�꽌以��샇','F','�깭�뼇怨�','蹂��깭');
insert into userinfo values(00005, '�삤誘쇱슦','M','�슦由ъ��븯','蹂��깭');

insert into treeinfo values(00001,'�뒓�떚�굹臾�','1000','�뒓�떚�굹臾대뒗 �뒓由낅굹臾닿낵�뿉 �냽�븯�뒗 �굺�뿽�겙�궎�굹臾댁씠�떎. �뒓由낅굹臾닿낵�뿉 �냽�븯�뒗 �굹臾댁쓽 �듅吏뺤� �옂�씠 �솑�옂�씠怨� 媛��옣�옄由� �넲�땲媛� 諛쒕떖�븯怨� �옂 �븘�옯遺�遺꾩� 醫뚯슦媛� 鍮꾨�移��쑝濡� 諛쒕떖�븯�뒗 吏앷턿�뫁�씠 �옂�쓣 媛�吏�怨� �굹臾대뱾�씠�떎.');
insert into treeinfo values(00002,'�궛�뵺�굹臾�','80','痢듭링�굹臾닿낵 痢듭링�굹臾댁냽�뿉 �냽�븯�뒗 �굺�뿽 �솢�뿽 援먮ぉ. 寃쎄린�룄 �씠�궓 吏��뿭�뿉 �옄�깮�븳�떎. �뱾留ㅻ굹臾�, 誘몄쁺苑껊굹臾�, 以��뵺�굹臾�, �냼由щ뵺�굹臾�, �븷湲곗궛�뵺�굹臾�, 援녹��궛�뵺�굹臾� �벑�쑝濡� �떎�뼇�븯寃� 遺덈┛�떎. �썝�궛吏��뒗 �븳援�怨� �씪蹂몄씠�떎.');
insert into treeinfo values(00003,'�냼�굹臾�','140','洹몃읆, 寃됱뵪�떇臾쇱쓽 ���몴�쟻 �떇臾쇱씤 �냼�굹臾댁쓽 �깮源��깉�� �듅吏뺤뿉 ���빐 �븣�븘蹂쇨퉴�슂. �냼�굹臾대뒗 以꾧린�뒗 �넂�씠 35m, 吏�由� 1.8m �젙�룄�씠硫� �닔�뵾�뒗 遺됱�鍮쏆쓣 �씍 媛덉깋�쓣 �쓣吏�留� 諛묐�遺꾩� 寃��� 媛덉깋�엯�땲�떎. �옂�� 諛붾뒛 紐⑥뼇�쓽 �옂�씠 2媛쒖뵫 萸됱퀜�굹硫�, 2�뀈�씠 吏��굹硫� 諛묐�遺꾩쓽 諛붾뒛�옂�씠 �뼥�뼱吏묐땲�떎.');
