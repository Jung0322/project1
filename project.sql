--1. user ���̺�
create table member(
    userid varchar2(50),
    password varchar2(50),
    name varchar2(50),
    nickname varchar2(50),
    birthday DATE,
    email varchar2(50),
    phone varchar2(50),
    mytown varchar2(50)
);
--2. ��� ���̺�
create table reply(
	rno number(10),
	mno number(10),
	userid varchar2(50),
	content varchar2(2000),
	regdate DATE default sysdate,
	updatedate DATE,
	good number
);
--3. �Խ��� ���̺�
create table myPlace(
	mno number(10),
	userid varchar2(50),
	title varchar2(100),
	content varchar2(2000),
	regdate DATE default sysdate,
	updatedate DATE,
	mcount number(100)
);
--4. ��ǰ ���̺�
create table product(
	pno number(10),
	category varchar2(20),
	title varchar2(100),
	price number(10),
	content varchar2(2000),
	delivery number(2) default 0,
	discount number(2) default 0,
	reservation number(2) default 0,
	soldout number(2) default 0,
	userid varchar2(50)
);
--5. ��� ���̺�
create table auction(
	ano number(10),
	userid varchar2(50),
	category varchar2(30),
	startdate DATE,
	enddate DATE,
	startprice number(10),
	soldout number(2) default 0
);
--6. ��� �̹��� ���̺�
create table auctionimg(
	auuid varchar2(50),
	ano number(10),
	auploadPath varchar2(50),
	aimgname varchar2(50)
);
--7.��ǰ �̹��� ���̺�

create table productimg(
	puuid varchar2(50),
	pno number(10),
	puploadPath varchar2(50),
	pimgname varchar2(50)
);
--8. ������ �̹��� ���̺�
create table profileimg(
	pfuuid varchar2(50),
	userid varchar2(50),
	profileloadPath varchar2(50),
	profileimgname varchar2(50)
);
--9. �Խ��� �̹��� ���̺�
create table myPlaceimg(
	muuid varchar2(50),
	mno number(10),
	mloadPath varchar2(50),
	mimgname varchar2(50)
);
--10. ��ٱ��� 
create table basket(
	bno number(10),
	userid varchar2(50),
	pno number(10)
);
















