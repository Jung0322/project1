-- 회원
select *from basket;
--1.  user 테이블
create table member (
    userid varchar2(50) not null, -- 아이디(pk)
    password varchar2(50) not null, -- 비밀번호
    nickname varchar2(50) not null, -- 닉네임
    email varchar2(50) not null, -- 이메일
    phone varchar2(50) not null, -- 휴대전화
    mytown varchar2(50) not null, -- 내 동네
    CONSTRAINT pk_member PRIMARY KEY (userid) -- pk
);

-- 2. 프로필 이미지 테이블
create table profileimg (
	pfuuid varchar2(50) not null, -- uuid(pk)
	userid varchar2(50) not null, -- 아이디
	profileloadPath varchar2(50) not null, -- 프로필 업로드 경로
 	profileimgname varchar2(50) not null, -- 프로필 이미지 이름
	CONSTRAINT pk_profileImg PRIMARY KEY (pfuuid) -- pk
);

-- 3. 장바구니 (찜목록)
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




-- 동네생활
-- 4. 게시판(동네생활) 테이블
create table myPlace (
	mno number(10) not null, -- 글번호(pk)
	mcategory varchar2(20) not null, -- 카테고리
	userid varchar2(50) not null, -- 아이디
	title varchar2(100) not null, -- 제목
	content varchar2(2000) not null, -- 내용
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
	content varchar2(2000) not null, -- 댓글 내용
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




-- 경매
-- 9. 경매 테이블
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
-- 경매 테이블 글번호 시퀀스
CREATE SEQUENCE auction_seq INCREMENT BY 1 START WITH 1;

-- 10. 경매장 댓글 테이블
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

-- 11. 경매 이미지 테이블
create table auctionimg (
	auuid varchar2(50) not null, -- uuid(pk)
	ano number(10) not null, -- 경매장 테이블 글번호
	auploadPath varchar2(50) not null, -- 경매장 파일 업로드 경로
	aimgname varchar2(50) not null, -- 경매장 이미지 이름
	CONSTRAINT AIfk_ano FOREIGN KEY(ano)
         REFERENCES auction(ano) ON DELETE CASCADE,
	CONSTRAINT pk_AuctionImg PRIMARY KEY (auuid) -- pk
);

select* from  member;

-- 회원 더미 데이터 삽입
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


-- 내 동네 더미데이터 삽입
insert into myPlace(mno, userid, mcategory, title, content)
values (myPlace_seq.nextval, '콜리', '동네생활', '산책 친구 구합니다.', '평일 오후에 불광천 산책할 친구구해요! 일주일에 2-3번 정도 같이 산책하면 좋을 것 같아요. 편하게 연락주세요');

insert into myPlace(mno, userid, mcategory, title, content)
values (myPlace_seq.nextval, '안경', '동네사건사고', '안경찾습니다.', '종각역 1번출구에서 떨어뜨린 것 같은데 아무리 찾아봐도 안보여요 ㅠㅠ 혹시 보신 분 연락부탁드립니다. 사례할께요!');

insert into myPlace(mno, userid, mcategory, title, content)
values (myPlace_seq.nextval, '지갑', '동네생활', '산책 친구 구합니다.', '평일 오후에 불광천 산책할 친구구해요! 일주일에 2-3번 정도 같이 산책하면 좋을 것 같아요. 편하게 연락주세요');

insert into myPlace(mno, userid, mcategory, title, content)
values (myPlace_seq.nextval, '마테차', '동네사건사고', '안경찾습니다.', '종각역 1번출구에서 떨어뜨린 것 같은데 아무리 찾아봐도 안보여요 ㅠㅠ 혹시 보신 분 연락부탁드립니다. 사례할께요!');

-- 참고 primary key /foreign key 작성 
--alter table spring_attach add constraint pk_attach primary key(uuid);
--alter table spring_attach add constraint fk_board_attach foreign key(bno)
--references spring_board(bno);