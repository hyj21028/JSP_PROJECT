drop table tblMemberInfo;

-- 멤버 정보
CREATE TABLE tblMemberInfo(
mail VARCHAR2(30) NOT NULL PRIMARY KEY,
pwd VARCHAR2(30) NOT NULL,
gender VARCHAR2(1) NOT NULL,
favorite VARCHAR2(300) NOT NULL,
content VARCHAR2(1000) default NULL,
loc VARCHAR(500) default NULL
);

-- 전체 관심사 목록
CREATE TABLE TBLFAVORITELIST 
(
  FAVORITE VARCHAR2(256 BYTE) NOT NULL 
);
commit;

INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('패션');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('뷰티');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('출산/유아동');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('식품');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('주방용품');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('생활용품');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('홈/인테리어');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('가전/디지털');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('스포츠/레저');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('자동차/용품');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('도서/DVD음반');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('완구/취미');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('문구/오피스');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('반려용품');
INSERT INTO "PROJECT"."TBLFAVORITELIST" (FAVORITE) VALUES ('헬스/건강식품');

-- 멤버 기본정보 : 테스트용도
insert into tblMemberInfo(mail, pwd, gender, favorite) 
values(
        'yeobi27@gmail.com', 
        '1234',
        '1', 
        '패션,뷰티,출산/유아동');
commit;

select * from tblMemberInfo;
SELECT mail, pwd, gender, favorite FROM tblMemberInfo WHERE mail='yeobi27@gmail.com';

drop table tblItem;

-- 아이템 목록
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

-- 유저별 관심사 목록
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

--		"title": "반스 올드스쿨 <b>스니커즈</b> VN000D3HY28 블랙",
--		"link": "https://search.shopping.naver.com/gate.nhn?id=11642661041",
--		"image": "https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg",
--		"lprice": "20570",
--		"hprice": "160000",
--		"mallName": "네이버",
--		"productId": "11642661041",
--		"productType": "1"

insert into tblItem(bno, title, link, image, lprice, hprice, mallname, productid, producttype, count) 
values(tblItem_seq.nextval, 
        '반스 올드스쿨 <b>스니커즈</b> VN000D3HY28 블랙', 
        'https://search.shopping.naver.com/gate.nhn?id=11642661041'
        ,'https://shopping-phinf.pstatic.net/main_1164266/11642661041.20170614110340.jpg', 
        '20570', 
        '160000', 
        '네이버', 
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