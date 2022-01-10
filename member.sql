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
	pfuuid varchar2(200) not null, -- uuid(pk)
	userid varchar2(50) not null, -- 아이디
	profileuploadPath varchar2(200) not null, -- 프로필 업로드 경로
 	profileimgname varchar2(200) not null, -- 프로필 이미지 이름
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

select * from profileImg;
delete from profileImg;


select * from member;