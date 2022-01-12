-- 7. 상품 테이블
drop table product;
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
	good number(10) default 0, -- 좋아요(찜하기)
	mytown varchar2(50) not null, -- 동네
	
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

-- 9. 장바구니 (찜목록)
create table basket (
	userid varchar2(50) not null, -- 아이디
	pno number(10) not null, -- 동네생활 글번호
	CONSTRAINT fk_userid FOREIGN KEY(userid)
         REFERENCES member(userid) ON DELETE CASCADE,
    CONSTRAINT fk_pno FOREIGN KEY(pno)
         REFERENCES product(pno) ON DELETE CASCADE,
	CONSTRAINT pk_basket PRIMARY KEY (pno,userid) -- pk
);
