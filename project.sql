-- 회원
--1.  user 테이블
create table member (
    userid varchar2(50) not null, -- 아이디(pk)
    password varchar2(100) not null, -- 비밀번호
    nickname varchar2(50) not null, -- 닉네임
    email varchar2(50) not null, -- 이메일
    phone varchar2(50) not null, -- 휴대전화
    mytown varchar2(50) not null, -- 내 동네
    enabled char(1) default '1', -- 계정 사용 정보
    regdate DATE default sysdate, -- 가입일
    CONSTRAINT pk_member PRIMARY KEY (userid) -- pk
);
ALTER TABLE member MODIFY  password varchar2(100);
ALTER TABLE member  ADD  enabled char(1) default '1';
-- 가입날짜 컬럼 추가(기존 테이블이 있는 경우에 사용)
ALTER TABLE member  ADD  regdate DATE default sysdate;

-- 2. 프로필 이미지 테이블
create table profileimg (
	pfuuid varchar2(50) not null, -- uuid(pk)
	userid varchar2(50) not null, -- 아이디
	profileloadPath varchar2(50) not null, -- 프로필 업로드 경로
 	profileimgname varchar2(50) not null, -- 프로필 이미지 이름
	CONSTRAINT pk_profileImg PRIMARY KEY (pfuuid) -- pk
);

-- 3. 유저 권한 테이블
create table sp_member_authority(
	userid varchar2(50) not null,
	authority varchar2(50) not null
);
-- 외래키 제약 조건 생성
alter table sp_member_authority add constraint fk_sp_member_authority
foreign key(userid) references member(userid) ON DELETE CASCADE;





-- 동네생활
-- 4. 게시판(동네생활) 테이블
create table myPlace (
	mno number(10) not null, -- 글번호(pk)
	mcategory varchar2(20) not null, -- 카테고리
	nickname varchar2(50) not null, --닉네임
	userid varchar2(50) not null, -- 아이디
	mytown varchar2(50) not null, --내 동네
	title varchar2(100) not null, -- 제목
	content varchar2(4000) not null, -- 내용
	regdate DATE default sysdate, -- 작성날짜
	updatedate DATE default sysdate, -- 수정날짜
	mcount number(10) default 0, -- 조회수
	curious number(10) default 0, -- 궁금해요/공감해요 갯수
	CONSTRAINT pk_myPlace PRIMARY KEY (mno) -- pk
);
-- 동네생활 테이블 글번호 시퀀스
CREATE SEQUENCE myPlace_seq INCREMENT BY 1 START WITH 1;

-- 5. 게시판(동네생활) 댓글 테이블
create table myPlaceReply (
	mrno number(10) not null, -- 댓글번호(pk)
	mno number(10) not null, -- 동네생활 글번호
	userid varchar2(50) not null, -- 아이디
	nickname varchar2(50) not null, --닉네임
	mytown varchar2(50) not null, -- 내동네
	content varchar2(5000) not null, -- 댓글 내용
	regdate DATE default sysdate, -- 작성날짜
	updatedate DATE default sysdate, -- 수정날짜
	good number(10) default 0, -- 좋아요 갯수
	CONSTRAINT pk_myPlaceReply PRIMARY KEY (mrno) -- pk
);


-- 동네생활 댓글 테이블 글번호 시퀀스
CREATE SEQUENCE myPlaceReply_seq INCREMENT BY 1 START WITH 1;

-- 6. 게시판(동네생활) 이미지 테이블
create table myPlaceImg (
	muuid varchar2(50) not null, -- uuid(pk)
	mno number(10) not null, -- 동네생활 글번호
	muploadPath varchar2(50) not null, -- 동네생활 파일 업로드 경로
	mimgname varchar2(50) not null, -- 동네생활 이미지 이름
	CONSTRAINT pk_myPlaceImg PRIMARY KEY (muuid) -- pk
);




-- 상품
-- 7. 상품 테이블
create table product (
	pno number(10) not null, -- 글번호(pk)
	category varchar2(20) not null, -- 카테고리
	title varchar2(100) not null, -- 제목
	price number(10) not null, -- 가격
	content varchar2(2000) not null, -- 내용(상품설명)
	regdate date default sysdate, -- 작성날짜
	solddate date default null, -- 판매날짜
	delivery number(2) default 0, -- 택배 가능 여부
	discount number(2) default 0 , -- 네고 가능 여부
	reservation number(2) default 0, -- 예약 여부
	soldout number(2) default 0, -- 판매 여부
	userid varchar2(50) not null, -- 아이디
	CONSTRAINT Pfk_userid FOREIGN KEY(userid)
         REFERENCES member(userid) ON DELETE CASCADE,
	CONSTRAINT pk_product PRIMARY KEY (pno) -- pk
);
-- 이게 맞음(rn pno 안맞음)
select * 
	from (select /*+INDEX_DESC(product pk_product)*/ rownum rn,pno, price, title, good, puuid, puploadpath, pimgname
		  from (select  pd.pno, price, title, good, puuid, puploadpath, pimgname
			    from product pd, (select * 
			                      from PRODUCTIMG 
			                      where Rowid in (select max(rowid) from PRODUCTIMG group by pno)) pdi
				where pd.pno = pdi.pno)
		  where rownum <=8)
	where rn>0;	
	
	select count(pno) from product;
	
	
select * 
	from (select rownum rn,pno, price, title, good, puuid, puploadpath, pimgname
		  from (select  pd.pno, price, title, good, puuid, puploadpath, pimgname
			    from product pd, (select * 
			                      from PRODUCTIMG 
			                      where Rowid in (select max(rowid) from PRODUCTIMG group by pno)) pdi
				where pd.pno = pdi.pno order by pd.pno desc)
		  where rownum <=8)
	where rn>0;	
	
	
-- 이거임
	
select /*+INDEX_DESC(product pk_product)*/ rownum,pno, price from product where rownum<=8;

select rn,bno,title,replycnt
from (select /*+INDEX_DESC(spring_board pk_spring_board)*/ rownum rn,bno,title,replycnt
	  from spring_board
	  where rownum <=10)
where rn>0;



select pd.pno, price, title, good, puuid, puploadpath, pimgname
from product pd, (select * from PRODUCTIMG where Rowid in (select max(rowid) from PRODUCTIMG group by pno)) pdi
where pd.pno = pdi.pno order by pd.pno desc;

select * from PRODUCTIMG;



-- 상품 좋아요 개수 칼럼 추가
ALTER TABLE product  ADD good number(10) default 0;

-- 상품 테이블 글번호 시퀀스
CREATE SEQUENCE product_seq INCREMENT BY 1 START WITH 1;

-- 8. 상품 이미지 테이블
create table productimg (
	puuid varchar2(50) not null, -- uuid(pk)
	pno number(10) not null, -- 상품 테이블 글번호
	puploadPath varchar2(50) not null, -- 상품 파일 업로드 경로
	pimgname varchar2(50) not null, -- 상품 이미지 이름
	CONSTRAINT PIfk_pno FOREIGN KEY(pno)
         REFERENCES product(pno) ON DELETE CASCADE,
	CONSTRAINT pk_productImg PRIMARY KEY (puuid) -- pk
);

-- 9. 장바구니 (찜목록)
create table basket (
	bno number(10) not null, -- 글번호(pk)
	userid varchar2(50) not null, -- 아이디
	pno number(10) not null, -- 동네생활 글번호
	CONSTRAINT fk_userid FOREIGN KEY(userid)
         REFERENCES member(userid) ON DELETE CASCADE,
	CONSTRAINT pk_basket PRIMARY KEY (bno) -- pk
);
-- 장바구니 테이블 글번호 시퀀스
CREATE SEQUENCE basket_seq INCREMENT BY 1 START WITH 1;


-- 경매
-- 10. 경매 테이블
create table auction (
	ano number(10) not null, -- 경매 글번호(pk)
	userid varchar2(50) not null, -- 아이디
	category varchar2(30) not null, -- 카테고리
	startdate DATE not null, -- 시작 시간(날짜)
	enddate DATE not null, -- 끝나는 시간(날짜)
	startprice number(10) not null, -- 시작 가격
	soldout number(2) default 0, -- 판매(완료) 여부  / 0 : 미판매, 1 : 판매완료, 2 : 낙찰 후 합의 중?
	CONSTRAINT Afk_userid FOREIGN KEY(userid)
         REFERENCES member(userid) ON DELETE CASCADE,
	CONSTRAINT pk_Auction PRIMARY KEY (ano) -- pk
);

ALTER TABLE auction MODIFY startdate VARCHAR2(25);
ALTER TABLE auction MODIFY enddate VARCHAR2(25);


select * 
	from (select rownum rn,pno, price, title, good, puuid, puploadpath, pimgname
		  from (select  pd.pno, price, title, good, puuid, puploadpath, pimgname
			    from product pd, (select * 
			                      from PRODUCTIMG 
			                      where Rowid in (select max(rowid) from PRODUCTIMG group by pno)) pdi
				where pd.pno = pdi.pno order by pd.pno desc)
		  where rownum <=8)
	where rn>0;	


select * 
	from (select rownum rn,ano, title, startdate, enddate, startprice, category, auuid, auploadpath, aimgname
		  from (select  at.ano, title, startdate, enddate, startprice, category, auuid, auploadpath, aimgname
			    from auction at, (select * 
			                      from auctionimg
			                      where Rowid in (select max(rowid) from auctionimg group by ano)) ati
				where at.ano = ati.ano order by at.ano desc)
		  where rownum <=8)
	where rn>0;	
	
	select count(ano) from auction;

select * from auction;

-- 경매 테이블 내용 칼럼 추가
ALTER TABLE auction  ADD content varchar2(2000) not null;

-- 경매 테이블 제목 칼럼 추가
ALTER TABLE auction  ADD title varchar2(100) not null;

-- 경매 테이블 글번호 시퀀스
CREATE SEQUENCE auction_seq INCREMENT BY 1 START WITH 1;

-- 11. 경매장 댓글 테이블
CREATE TABLE auctionreply (
    arno number(10)   NOT NULL, -- 경매장 댓글 글번호(pk)
    ano number(10)   NOT NULL, -- 경매장 테이블 글번호
    userid varchar2(50)   NOT NULL, -- 아이디
    content varchar2(2000)   NOT NULL, -- 댓글 내용
    regdate date   NOT NULL, -- 작성날짜
    updatedate date   NOT NULL, -- 수정날짜
    CONSTRAINT ARfk_ano FOREIGN KEY(ano)
         REFERENCES auction(ano) ON DELETE CASCADE,
    CONSTRAINT pk_AuctionReply PRIMARY KEY (arno) -- pk
);




-- 경매장 댓글 테이블 글번호 시퀀스
CREATE SEQUENCE auctionreply_seq INCREMENT BY 1 START WITH 1;

-- 12. 경매 이미지 테이블
create table auctionimg (
	auuid varchar2(50) not null, -- uuid(pk)
	ano number(10) not null, -- 경매장 테이블 글번호
	auploadPath varchar2(50) not null, -- 경매장 파일 업로드 경로
	aimgname varchar2(50) not null, -- 경매장 이미지 이름
	CONSTRAINT AIfk_ano FOREIGN KEY(ano)
         REFERENCES auction(ano) ON DELETE CASCADE,
	CONSTRAINT pk_AuctionImg PRIMARY KEY (auuid) -- pk
);
-- 13. 채팅 방 테이블
create table chatroom(
	roomid varchar2(10) not null,
	userid varchar2(50) not null, -- 로그인 아이디(pk)
    usernickname varchar2(20) not null, -- 로그인 유저 닉네임
    userprofile varchar2(50), -- user 프로필 
    
    unReadCount number(2) default 1,
    
    masterid varchar2(50) not null,
    masternickname varchar2(20) not null,
    masterprofile varchar2(50)
);
-- 채팅방 테이블 방번 시퀀스
CREATE SEQUENCE SEQ_CHATROOM_ID;

-- 14. 채팅 메세지 
CREATE TABLE chatmessage(
	roomid varchar2(10) not null,  		-- 채팅 방번호
	messageid varchar2(10) not null , 	-- 메세지 번호 pk
	message varchar2(1000) not null,	-- 메세지 내용
	sentid varchar2(50) not null,		-- 보낸이 id
	sentnickname varchar2(50) not null,	-- 보낸이 닉네임
	
	unreadcount number(3) default 1,	-- 안 읽은 메세지 수
	sessioncount number(3) default 0,   	-- 현재 세션 수
	CONSTRAINT pk_messageid PRIMARY KEY (messageid) -- pk
);
CREATE SEQUENCE SEQ_CHATMESSAGE_ID;
-- 회원 더미 데이터 삽입 -> 시큐리티 적용 후에는 회원가입을 하셔야합니다
insert into 
    member(userid, password, nickname, email, phone, mytown)
values(
    'haha', '123', '하하', 'ha12@ccoli.com', '1234', '서울시 종로구 종로3가'
);
insert into 
    member(userid, password, nickname, email, phone, mytown)
values(
    'haha1', '123', '하하', 'ha12@ccoli.com', '1234', '서울시 종로구 종로3가'
);
insert into 
    member(userid, password, nickname, email, phone, mytown)
values(
    'haha2', '123', '하하', 'ha12@ccoli.com', '1234', '서울시 종로구 종로3가'
);
-- 회원 더미 데이터의 권한 삽입
insert into sp_member_authority(userid,authority) values ('haha','ROLE_USER');
insert into sp_member_authority(userid,authority) values ('haha1','ROLE_USER');
insert into sp_member_authority(userid,authority) values ('haha2','ROLE_USER');


-- 내 동네 더미데이터 삽입
insert into myPlace(mno, userid, nickname, mytown, mcategory, title, content)
values (myPlace_seq.nextval, 'ccoli1', '콜리', '서울시 종로구 관철동', '동네생활', '산책 친구 구합니다.', '평일 오후에 불광천 산책할 친구구해요! 일주일에 2-3번 정도 같이 산책하면 좋을 것 같아요. 편하게 연락주세요');

select * from myPlace;




-- 참고 primary key /foreign key 작성 
--alter table spring_attach add constraint pk_attach primary key(uuid);
--alter table spring_attach add constraint fk_board_attach foreign key(bno)
--references spring_board(bno);

select * from PRODUCT;


select to_char(sysdate) from dual;

select sysdate from dual;