
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
select * from chatroom;
-- 채팅방 테이블 방번 시퀀스
CREATE SEQUENCE SEQ_CHATROOM_ID;
delete chatroom where userid = 'hong12';
alter table chatroom modify roomid varchar2(10);
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
alter table chatmessage drop  column sessioncount;
alter table chatmessage modify sessioncount number(2);
insert into chatmessage values(21,SEQ_CHATMESSAGE_ID.NEXTVAL,'이게 채팅이냐?','hong12','huskii',default,default);
CREATE SEQUENCE SEQ_CHATMESSAGE_ID;
select * from chatmessage;
delete from chatmessage where roomid='21';
insert into chatroom values(SEQ_CHATROOM_id.nextval,'hong12','huskiii','default.png',1,'hong2','as','default.png');
insert into chatroom values(SEQ_CHATROOM_id.nextval,'hong12','huskiii','default.png',1,'hong3','qw','default.png');
insert into chatroom values(SEQ_CHATROOM_id.nextval,'hong12','huskiii','default.png',1,'hong1','honghong','default.png');
select * from member;