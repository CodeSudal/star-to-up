/* Create Tables */

-- 회원
CREATE TABLE MEMBERS
(
	-- 아이디
	M_ID varchar2(20) NOT NULL,
	-- 패스워드
	M_PW varchar2(30) NOT NULL,
	-- 이름
	M_NAME varchar2(20) NOT NULL,
	-- 이메일1
	M_EMAIL1 varchar2(30) NOT NULL,
	-- 이메일2
	M_EMAIL2 varchar2(30) NOT NULL,
	-- 전화번호
	M_NUM varchar2(20) NOT NULL,
	-- 가입일자
	M_REGDATE date NOT NULL,
	PRIMARY KEY (M_ID)
);

-- 제품
CREATE TABLE PRODUCT
(
	-- 제품번호
	P_NUM number NOT NULL,
	-- 제품이름
	P_NAME varchar2(50) NOT NULL,
	-- 펀딩금액
	P_PRICE number NOT NULL,
	-- 제품설명
	P_INFO varchar2(3000) NOT NULL,
	-- 펀딩종료확인
	P_FINISH number DEFAULT 0 NOT NULL,
	-- P_IMAGE
	P_IMAGE varchar2(3000),
	-- 펀딩목표금액
	P_AMOUNT number NOT NULL,
	-- 현재펀딩금액
	P_CRNAMOUNT number DEFAULT 0 NOT NULL,
	-- 퍼센트
	P_PERCENT number DEFAULT 0 NOT NULL,
	PRIMARY KEY (P_NUM)
);

-- 크롤링
CREATE TABLE CRAWLING
(
	-- 크롤링 정보 번호
	C_NUM number NOT NULL,
	-- 제품번호
	C_PID number NOT NULL,
	-- 크롤링 대상 정보
	C_INFO varchar2(3000) NOT NULL,
	PRIMARY KEY (C_NUM)
);

-- 제품 펀딩 회원 리스트
CREATE TABLE LISTS
(
	-- 펀딩리스트번호
	L_NUM number NOT NULL,
	-- 제품번호
	L_PID number NOT NULL,
	-- 아이디
	L_MID varchar2(20) NOT NULL,
	PRIMARY KEY (L_NUM)
);

-- 내 펀딩 목록
CREATE TABLE MYFUNDING
(
	-- 내 펀딩 정보 번호
	MF_NUM number NOT NULL,
	-- 아이디
	MF_MID varchar2(20) NOT NULL,
	-- 제품번호
	MF_PID number NOT NULL,
	PRIMARY KEY (MF_NUM)
);

-- 내 찜 목록
CREATE TABLE MYLIKE
(
	-- ML_NUM
	ML_NUM number NOT NULL,
	-- 아이디
	ML_MID varchar2(20) NOT NULL,
	-- 제품번호
	ML_PID number NOT NULL,
	PRIMARY KEY (ML_NUM)
);



/* Create Foreign Keys */

ALTER TABLE LISTS
	ADD FOREIGN KEY (L_MID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE MYFUNDING
	ADD FOREIGN KEY (MF_MID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE MYLIKE
	ADD FOREIGN KEY (ML_MID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE CRAWLING
	ADD FOREIGN KEY (C_PID)
	REFERENCES PRODUCT (P_NUM)
;


ALTER TABLE LISTS
	ADD FOREIGN KEY (L_PID)
	REFERENCES PRODUCT (P_NUM)
;


ALTER TABLE MYFUNDING
	ADD FOREIGN KEY (MF_PID)
	REFERENCES PRODUCT (P_NUM)
;


ALTER TABLE MYLIKE
	ADD FOREIGN KEY (ML_PID)
	REFERENCES PRODUCT (P_NUM)
;


/* Drop Tables */

DROP TABLE CRAWLING CASCADE CONSTRAINTS;
DROP TABLE LISTS CASCADE CONSTRAINTS;
DROP TABLE MYFUNDING CASCADE CONSTRAINTS;
DROP TABLE MYLIKE CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;