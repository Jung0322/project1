-- 회원
--1.  user 테이블
create table member (
    userid varchar2(50) not null,
    password varchar2(50) not null,
    name varchar2(50) not null,
    nickname varchar2(50) not null,
    birthday DATE,
    email varchar2(50) not null,
    phone varchar2(50) not null,
    mytown varchar2(50) not null,
    CONSTRAINT pk_member PRIMARY KEY (userid)
);

-- 2. 프로필 이미지 테이블
create table profileimg (
	pfuuid varchar2(50) not null,
	userid varchar2(50) not null,
	profileloadPath varchar2(50) not null,
	profileimgname varchar2(50) not null,
	CONSTRAINT pk_profileImg PRIMARY KEY (pfuuid)
);

-- 3. 장바구니 
create table basket (
	bno number(10) not null,
	userid varchar2(50) not null,
	pno number(10) not null,
	CONSTRAINT pk_basket PRIMARY KEY (bno)
);


-- 동네생활
-- 4. 게시판(동네생활) 테이블
create table myPlace (
	mno number(10) not null,
	userid varchar2(50) not null,
	title varchar2(100) not null,
	content varchar2(2000) not null,
	regdate DATE default sysdate,
	updatedate DATE default sysdate,
	mcount number(100) default 0,
	CONSTRAINT pk_myPlace PRIMARY KEY (mno)
);

-- 5. 게시판(동네생활) 댓글 테이블
create table myPlaceReply (
	mrno number(10) not null,
	mno number(10) not null,
	userid varchar2(50) not null,
	content varchar2(2000) not null,
	regdate DATE default sysdate,
	updatedate DATE default sysdate,
	good number(10) default 0,
	CONSTRAINT pk_myPlaceReply PRIMARY KEY (mrno)
);

-- 6. 게시판(동네생활) 이미지 테이블
create table myPlaceImg (
	muuid varchar2(50) not null,
	mno number(10) not null,
	mloadPath varchar2(50) not null,
	mimgname varchar2(50) not null,
	CONSTRAINT pk_myPlaceImg PRIMARY KEY (muuid)
);


-- 상품
-- 7. 상품 테이블
create table product (
	pno number(10) not null,
	category varchar2(20) not null,
	title varchar2(100) not null,
	price number(10) not null,
	content varchar2(2000) not null,
	delivery number(2) default 0,
	discount number(2) default 0 ,
	reservation number(2) default 0,
	soldout number(2) default 0,
	userid varchar2(50) not null,
	CONSTRAINT pk_product PRIMARY KEY (pno)
);

-- 8. 상품 이미지 테이블
create table productimg (
	puuid varchar2(50) not null,
	pno number(10) not null,
	puploadPath varchar2(50) not null,
	pimgname varchar2(50) not null,
	CONSTRAINT pk_productImg PRIMARY KEY (puuid)
);




-- 경매
-- 9. 경매 테이블
create table auction (
	ano number(10) not null,
	userid varchar2(50) not null,
	category varchar2(30) not null,
	startdate DATE not null,
	enddate DATE not null,
	startprice number(10) not null,
	soldout number(2) default 0,
	CONSTRAINT pk_Auction PRIMARY KEY (ano)
);

-- 10. 경매장 댓글 테이블
CREATE TABLE auctionreply (
    arno number(10)   NOT NULL,
    ano number(10)   NOT NULL,
    userid varchar2(50)   NOT NULL,
    content varchar2(2000)   NOT NULL,
    regdate date   NOT NULL,
    updatedate date   NOT NULL,
    CONSTRAINT pk_AuctionReply PRIMARY KEY (arno)
);

-- 11. 경매 이미지 테이블
create table auctionimg (
	auuid varchar2(50) not null,
	ano number(10) not null,
	auploadPath varchar2(50) not null,
	aimgname varchar2(50) not null,
	CONSTRAINT pk_AuctionImg PRIMARY KEY (auuid)
);





 


-- 참고 primary key /foreign key 작성 
--alter table spring_attach add constraint pk_attach primary key(uuid);
--alter table spring_attach add constraint fk_board_attach foreign key(bno)
--references spring_board(bno);