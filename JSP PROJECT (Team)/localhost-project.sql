drop table tblMemberInfo;

-- ��� ����
CREATE TABLE tblMemberInfo(
mail VARCHAR2(30) NOT NULL PRIMARY KEY,
pwd VARCHAR2(30) NOT NULL,
gender VARCHAR2(1) NOT NULL,
favorite VARCHAR2(300) NOT NULL,
content VARCHAR2(1000) default NULL,
loc VARCHAR(500) default NULL
);

-- ��ü ���ɻ� ���
CREATE TABLE TBLFAVORITELIST 
(
  FAVORITE VARCHAR2(256 BYTE) NOT NULL 
);
commit;

INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('�м�');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('��Ƽ');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('���/���Ƶ�');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('��ǰ');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('�ֹ��ǰ');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('��Ȱ��ǰ');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('Ȩ/���׸���');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('����/������');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('������/����');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('�ڵ���/��ǰ');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('����/DVD����');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('�ϱ�/���');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('����/���ǽ�');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('�ݷ���ǰ');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('�ｺ/�ǰ���ǰ');

-- ��� �⺻���� : �׽�Ʈ�뵵
insert into tblMemberInfo(mail, pwd, gender, favorite) 
values(
        'yeobi27@gmail.com', 
        '1234',
        '1', 
        '�м�,��Ƽ,���/���Ƶ�');
commit;

select * from tblMemberInfo;
SELECT mail, pwd, gender, favorite FROM tblMemberInfo WHERE mail='yeobi27@gmail.com';

drop table tblItem;

-- ������ ���
CREATE TABLE tblItem(
bno NUMBER not null primary key,
title VARCHAR2(400) not null,
link VARCHAR2(300) not null,
image VARCHAR2(300) not null,
lprice VARCHAR2(100) not null,
hprice VARCHAR2(100) not null,
mallname VARCHAR2(300) not null,
productid NUMBER(30) not null,
producttype NUMBER(2) not null,
count NUMBER default 0);

drop SEQUENCE tblItem_seq;
create SEQUENCE tblItem_seq;

-- ������ ���ɻ� ���
CREATE table tblMemberFavorite(
bno number not null primary key,
mail VARCHAR2(30) not null,
favorite VARCHAR2(300) not null,
title VARCHAR2(400) not null,
link VARCHAR2(300) not null,
image VARCHAR2(300) not null,
lprice VARCHAR2(100) not null,
hprice VARCHAR2(100) not null,
mallname VARCHAR2(300) not null,
productid NUMBER(30) not null,
producttype NUMBER(2) not null
);

drop SEQUENCE tblMemberFavorite_seq;
create SEQUENCE tblMemberFavorite_seq;

commit;

select * from tblMemberFavorite;
delete from tblMemberFavorite where bno=670;
commit;

--		"title": "�ݽ� �õ彺�� <b>����Ŀ��</b> VN000D3HY28 ��",
--		"link": "https://search.shopping.naver.com/gate.nhn?id=11642661041",
--		"image": "https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg",
--		"lprice": "20570",
--		"hprice": "160000",
--		"mallName": "���̹�",
--		"productId": "11642661041",
--		"productType": "1"

insert into tblItem(bno, title, link, image, lprice, hprice, mallname, productid, producttype, count) 
values(tblItem_seq.nextval, 
        '�ݽ� �õ彺�� <b>����Ŀ��</b> VN000D3HY28 ��', 
        'https://search.shopping.naver.com/gate.nhn?id=11642661041'
        ,'https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg', 
        '20570', 
        '160000', 
        '���̹�', 
        11642661041, 
        '1',
         5 );

commit;        
        
select * from tblItem;

--drop table tblItem;
--drop table tblMember;

select productid from tblItem;

select * from 
				(select /*+index_desc(BOARD_BNO_IDX)*/ count as cnt,
				a.*
				from (select * from tblitem order by bno desc) a
				where rownum <= 20) b
				where b.rn >= ?;
                
select a.*
from (select * from tblitem order by bno desc) a
where rownum <= 20;     

commit;

select * from 
				(select /*+index_desc(BOARD_BNO_IDX)*/ rownum as rn,
				a.*
				from (select * from tblitem order by bno desc) a
				where rownum <= 20) b
				where b.rn >= 10;