--기존 테이블, 시퀀스 삭제
drop table myplace;
drop sequence myPlace_seq;
drop table myplacereply;
drop sequence myplacereply_seq;


-- 동네생활 테이블
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
	replycnt number default 0, -- 댓글 수 갯수
	CONSTRAINT pk_myPlace PRIMARY KEY (mno) -- pk
);

alter table myplace add(replycnt number default 0);

-- 이미 들어간 댓글 수 삽입하기
update myplace set replycnt = (select count(mno) from MYPLACEREPLY where MYPLACE.mno=myplacereply.mno);

-- 동네생활 테이블 글번호 시퀀스
CREATE SEQUENCE myPlace_seq INCREMENT BY 1 START WITH 1;

-- 5. 게시판(동네생활) 댓글 테이블
create table myPlaceReply (
	mrno number(10) not null, -- 댓글번호(pk)
	mno number(10) not null, -- 동네생활 글번호
	userid varchar2(50) not null, -- 아이디
	nickname varchar2(50) not null, --닉네임
	mytown varchar2(50) not null, -- 내동네
	content varchar2(4000) not null, -- 댓글 내용
	regdate DATE default sysdate, -- 작성날짜
	updatedate DATE default sysdate, -- 수정날짜
	good number(10) default 0, -- 좋아요 갯수
	CONSTRAINT pk_myPlaceReply PRIMARY KEY (mrno) -- pk
);

-- 동네생활 댓글 테이블 글번호 시퀀스
CREATE SEQUENCE myPlaceReply_seq INCREMENT BY 1 START WITH 1;

select *
from (select /*+INDEX_DESC(myplace pk_myplace)*/ rownum rn,mno,nickname,mytown,title,content,regdate,updatedate
		from myplace where rownum <=(1 * 10) and mytown='서울시 종로구 관철동')
where rn> (0) * 10;

select count(*) from myplace where mytown='서울시 종로구 관철동';

select * from myplace;

select * from myplace where mytown ='서울시 종로구 관철동' order by mno asc;

-- 게시글 더미 데이터 
insert into myPlace(mno, userid, nickname, mytown, mcategory, title, content)
values (myPlace_seq.nextval, 'riri', '리리', '서울시 은평구 불광동', '동네사건사고', '페이지네이션 체크용', '페이지네이션 체크용');
insert into myPlace(mno, userid, nickname, mytown, mcategory, title, content)
values (myPlace_seq.nextval, 'user1', '유저씨', '서울시 신사동 은평구', '일상', '페이지네이션 체크용', '페이지네이션 체크용');
insert into myPlace(mno, userid, nickname, mytown, mcategory, title, content)
values (myPlace_seq.nextval, 'riri', '리리', '서울시 은평구 불광동', '동네사건사고', '페이지네이션 체크용', '페이지네이션 체크용');
insert into myPlace(mno, userid, nickname, mytown, mcategory, title, content)
values (myPlace_seq.nextval, 'ccoli1', '콜리', '종로구 관철동', '동네사건사고', '페이지네이션 체크용', '페이지네이션 체크용');





