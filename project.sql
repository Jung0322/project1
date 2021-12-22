--1. user ���̺�
create table member(
    userid varchar2(50) not null,
    password varchar2(50) not null,
    name varchar2(50) not null,
    nickname varchar2(50) not null,
    birthday DATE,
    email varchar2(50) not null,
    phone varchar2(50) not null,
    mytown varchar2(50) not null
);
--2. ��� ���̺�
create table reply(
	rno number(10) not null,
	mno number(10) not null,
	userid varchar2(50) not null,
	content varchar2(2000) not null,
	regdate DATE default sysdate,
	updatedate DATE,
	good number(10)
);
--3. �Խ��� ���̺�
create table myPlace(
	mno number(10) not null,
	userid varchar2(50) not null,
	title varchar2(100) not null,
	content varchar2(2000) not null,
	regdate DATE default sysdate,
	updatedate DATE,
	mcount number(100) not null
);
--4. ��ǰ ���̺�
create table product(
	pno number(10) not null,
	category varchar2(20) not null,
	title varchar2(100) not null,
	price number(10) not null,
	content varchar2(2000) not null,
	delivery number(2) default 0,
	discount number(2) default 0 ,
	reservation number(2) default 0 not null,
	soldout number(2) default 0,
	userid varchar2(50) not null
);
--5. ��� ���̺�
create table auction(
	ano number(10) not null,
	userid varchar2(50) not null,
	category varchar2(30) not null,
	startdate DATE not null,
	enddate DATE not null,
	startprice number(10) not null,
	soldout number(2) default 0
);
--6. ��� �̹��� ���̺�
create table auctionimg(
	auuid varchar2(50) not null,
	ano number(10) not null,
	auploadPath varchar2(50) not null,
	aimgname varchar2(50) not null
);
--7.��ǰ �̹��� ���̺�

create table productimg(
	puuid varchar2(50) not null,
	pno number(10) not null,
	puploadPath varchar2(50) not null,
	pimgname varchar2(50) not null
);
--8. ������ �̹��� ���̺�
create table profileimg(
	pfuuid varchar2(50) not null,
	userid varchar2(50) not null,
	profileloadPath varchar2(50) not null,
	profileimgname varchar2(50) not null
);
--9. �Խ��� �̹��� ���̺�
create table myPlaceimg(
	muuid varchar2(50) not null,
	mno number(10) not null,
	mloadPath varchar2(50) not null,
	mimgname varchar2(50) not null
);
--10. ��ٱ��� 
create table basket(
	bno number(10) not null,
	userid varchar2(50) not null,
	pno number(10) not null
);

-- ���� primary key /foreign key �ۼ� 
--alter table spring_attach add constraint pk_attach primary key(uuid);
--alter table spring_attach add constraint fk_board_attach foreign key(bno)
--references spring_board(bno);














