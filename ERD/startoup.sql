
SELECT * FROM MEMBERS;

SELECT * FROM PRODUCT;

SELECT * FROM LISTS;

SELECT * FROM MYFUNDING;

SELECT * FROM MYLIKE;

SELECT * FROM CRAWLING;

SELECT * FROM NAMING;


DROP TABLE MEMBERS;

DROP TABLE PRODUCT;

DROP TABLE LISTS;

DROP TABLE MYFUNDING;

DROP TABLE MYLIKE;

DROP TABLE CRAWLING;

DROP TABLE NAMING;


/* 회원 */
CREATE TABLE MEMBERS(
M_ID VARCHAR2(20) PRIMARY KEY,
M_PW VARCHAR2(30) NOT NULL,
M_NAME VARCHAR2(20) NOT NULL,
M_EMAIL1 VARCHAR2(30) NOT NULL,
M_EMAIL2 VARCHAR2(30) NOT NULL,
M_NUM VARCHAR2(20) NOT NULL,
M_REGDATE DATE NOT NULL
);
/* 
 * 아이디
 * 패스워드
 * 이름
 * 이메일(앞)
 * 이메일(뒤)
 * 전화번호
 * 가입일자
 */


/* 제품 */
CREATE TABLE PRODUCT(
P_NUM NUMBER PRIMARY KEY,
P_NAME VARCHAR2(50) NOT NULL,
P_PRICE NUMBER NOT NULL,
P_INFO VARCHAR2(4000),
P_FINISH NUMBER DEFAULT 0,
P_IMAGE1 VARCHAR2(3000) NOT NULL,
P_IMAGE2 VARCHAR2(3000) NOT NULL,
P_IMAGE3 VARCHAR2(3000) NOT NULL,
P_AMOUNT NUMBER NOT NULL,
P_CRNAMOUNT NUMBER DEFAULT 0,
P_PERCENT NUMBER DEFAULT 0,
P_EN VARCHAR2(50)
);
/*
 * 제품번호
 * 제품이름
 * 펀딩금액
 * 제품설명
 * 펀딩종료확인 (0이면 진행, 1이면 종료)
 * 제품이미지
 */


/* 제품 펀딩 회원리스트 */
CREATE TABLE LISTS(
L_NUM NUMBER PRIMARY KEY,
L_PID NUMBER NOT NULL,
L_MID VARCHAR2(20) NOT NULL
);
/*
 * 펀딩리스트번호
 * 제품번호
 * 아이디
 */


/* 내 펀딩 목록 */
CREATE TABLE MYFUNDING(
MF_NUM NUMBER PRIMARY KEY,
MF_MID VARCHAR2(20) NOT NULL,
MF_PID NUMBER NOT NULL
);
/*
 * 내 펀딩 정보 번호
 * 펀딩 대상 아이디
 * 펀딩 대상 제품
 */


/* 내 찜 목록 */
CREATE TABLE MYLIKE(
ML_NUM NUMBER PRIMARY KEY,
ML_MID VARCHAR2(20) NOT NULL,
ML_PID NUMBER NOT NULL
);
/*
 * 내 찜 정보 번호
 * 찜한 대상 아이디
 * 찜한 대상 제품
 */


/* 크롤링 */

CREATE TABLE CRAWLING(
C_NUM NUMBER PRIMARY KEY,
C_NAME VARCHAR2(50) NOT NULL,
C_INFO VARCHAR2(4000) NOT NULL
);

/*
 * 크롤링 정보 번호
 * 제품번호
 * 크롤링 대상 정보
 */


/* 영어 치환 테이블 */
CREATE TABLE NAMING(
N_NUM NUMBER PRIMARY KEY,
N_NAME VARCHAR2(50) NOT NULL,
N_EN VARCHAR2(50) NOT NULL
);


-- NAMING --

	-- 네이밍 정보 추가
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), ?, ?)
	
	-- SELECTALL
	SELECT N_NUM, N_NAME, N_EN FROM NAMING;


-- MEMBERS --

SELECT * FROM MEMBERS;

	-- 회원추가
	INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE) VALUES(#{mId},#{mPw},#{mName},#{mEmail1},#{mEmail2},#{mNum},to_char(sysdate,'rr.mm.dd'));
	
	-- 카카오 가입
	INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE) VALUES(#{mId},'KAKAO',#{mName},#{mEmail1},#{mEmail2},'010-0000-0000',to_char(sysdate,'rr.mm.dd'))

	-- 탈퇴
	DELETE FROM MEMBERS WHERE M_ID=#{mId}
	
	-- SELECT_ALL_MEMBER
	SELECT M_ID, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS WHERE UPPER(M_ID) NOT LIKE 'ADMIN'
	
	-- SELECT_ONE_MEMBER
	SELECT M_ID, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS WHERE M_ID=#{mId}
	
	-- 카카오회원 하나 출력(SELECT ONE)
	SELECT M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS WHERE M_ID=#{mId}
	
	-- SELECT_ONE_EAMIL
	SELECT M_ID, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS WHERE M_EMAIL1=#{mEmail1} AND M_EMAIL2=#{mEmail2}
	
	-- 로그인
	SELECT M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS WHERE M_ID=#{mId} AND M_PW=#{mPw}
	
	-- 펀드 내역 추가
	INSERT INTO MYFUNDING(MF_NUM, MF_MID, MF_PID) VALUES((SELECT NVL(MAX(MF_NUM), 0) + 1 FROM MYFUNDING),#{mfMid},#{mfPid})
	
	-- 펀드 내역 보기
	SELECT a.M_ID, b.MF_NUM, b.MF_PID FROM MEMBERS a INNER JOIN MYFUNDING b ON a.M_ID = b.MF_MID
	
	-- 찜하기
	INSERT INTO MYLIKE(ML_NUM, ML_MID, ML_PID) VALUES((SELECT NVL(MAX(ML_NUM), 0) + 1 FROM MYLIKE),#{mlMid},#{mlPid})
	
	-- 찜 하나 삭제
	DELETE FROM MYLIKE WHERE ML_NUM=#{mlNum}
	
	-- 찜 목록에서 삭제
	DELETE FROM MYLIKE WHERE ML_MID=#{mlMid} AND ML_PID=#{mlPid}
	
	-- 찜 목록 전체 삭제
	SELECT a.M_ID, b.ML_NUM, b.ML_PID FROM MEMBERS a INNER JOIN MYLIKE b ON a.M_ID = b.ML_MID
	
	-- CHECKLIKE
	SELECT ML_NUM,ML_MID,ML_PID FROM MYLIKE WHERE ML_PID=#{mlPid} AND ML_MID=#{mlMid}
	
	-- 찜한 개수
	SELECT COUNT(ML_NUM) AS ML_NUM FROM MYLIKE ML WHERE ML_MID=#{mlMid}
	
	-- 내 찜 목록
	SELECT DISTINCT p.P_NUM, p.P_PRICE, p.P_NAME, p.P_AMOUNT, p.P_IMAGE1, p.P_EN FROM PRODUCT p, MYLIKE l, MEMBERS m WHERE p.P_NUM = l.ML_PID AND l.ML_MID = #{mlMid}
	
	-- 내 펀딩 목록
	SELECT DISTINCT p.P_NUM, p.P_PRICE, p.P_NAME, p.P_AMOUNT, p.P_IMAGE1, p.P_EN FROM PRODUCT p, MYFUNDING f, MEMBERS m WHERE p.P_NUM = f.MF_PID AND f.MF_MID = #{mfMid}
	
	
-- PRODUCT --

	-- 제품추가
	INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), ?, ?, ?, ?, ?, ?)
	
	-- 제품정보변경
	UPDATE PRODUCT SET P_NAME=?, P_PRICE=?, P_INFO=?, P_IMAGE1=?, P_IMAGE2=?, P_IMAGE3=?, WHERE P_NUM=?
	
	-- 제품삭제
	DELETE FROM PRODUCT WHERE P_NUM=?
	
	-- 전체 제품 출력(SELECT ALL)
	SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH,
	P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT, 
	P_CRNAMOUNT, P_PERCENT FROM PRODUCT
	
	-- 제품 하나 출력(SELECT ONE)
	SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT, P_CRNAMOUNT, P_PERCENT FROM PRODUCT WHERE P_NUM=?
	
	-- 제품 구매 시 펀딩 금액 상승
	UPDATE PRODUCT SET P_CRNAMOUNT=((SELECT P_CRNAMOUNT FROM PRODUCT WHERE P_NUM=?) + (SELECT P_PRICE FROM PRODUCT WHERE P_NUM=?)) WHERE P_NUM=?
	
	-- 퍼센트 업데이트
	UPDATE PRODUCT SET P_PERCENT=? WHERE P_NUM=?
	
	-- 펀딩 완료 되었는지 확인
	SELECT P_PERCENT FROM PRODUCT WHERE P_NUM=?
	
	-- 펀딩 완료 시(제품 펀딩 종료하기)
	UPDATE PRODUCT SET P_FINISH=1 WHERE P_NUM=?
	
	-- 제품 INFO 업데이트
	UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = C.C_NAME)
	
	-- 제품 NAME 영어로
	UPDATE PRODUCT P SET P.P_EN = (SELECT N.N_EN FROM NAMING N WHERE P.P_NAME = N.N_NAME)
	

	SELECT N_NAME FROM NAMING INTERSECT SELECT P_NAME FROM PRODUCT;
	

-- LISTS --

	-- 펀딩 목록 추가
	INSERT INTO LISTS(L_NUM, L_PID, L_MID) VALUES( (SELECT NVL(MAX(L_NUM), 0) + 1 FROM LISTS), ?, ?)
	
	-- 펀딩 SELECT_ALL (제품으로 검색) == 제품을 구매한 고객 리스트
	SELECT L_NUM, L_PID, L_MID FROM LISTS WHERE L_PID=?
	
	-- 펀딩 SELECT_ALL (아이디로 검색) == 회원이 구매한 제품 리스트
	SELECT L_NUM, L_PID, L_MID FROM LISTS WHERE L_MID=?
	
	-- 펀딩한 사람 인원 수
	SELECT COUNT(L_NUM) AS L_NUM FROM LISTS WHERE L_PID=?
	

-- CRAWLING --
	
	SELECT * FROM CRAWLING
	
	-- PRODUCT 조회
	SELECT P_NAME, P_INFO FROM PRODUCT
	
	-- 크롤링 정보 추가
	INSERT INTO CRAWLING( C_NUM, C_NAME, C_INFO) VALUES( (SELECT NVL(MAX(C_NUM), 0) + 1 FROM CRAWLING), ?, ?)

	-- 상품 INFO 업데이트
	UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = C.C_NAME)
	
	-- SELECTONE
	SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING WHERE C_NAME = ?
	
	-- SELECTALL
	SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING
	
	
	TRUNCATE TABLE CRAWLING

	
-- SAMPLE DATA --
	
	-- PROUDCT
	INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT) VALUES( '101', '지구', '3000', 'DEFAULT.jpg', 'DEFAULT.jpg', 'DEFAULT.jpg', '9000');
	
	INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), '화성', '5000', 'DEFAULT.jpg', 'DEFAULT.jpg', 'DEFAULT.jpg', '20000');

	INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), '혜성', '5000', 'DEFAULT.jpg', 'DEFAULT.jpg', 'DEFAULT.jpg', '20000');

	-- MEMBERS 
	INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE) VALUES('admin','1234','관리자','admin','naver.com','010-0000-0000',to_char(sysdate,'rr.mm.dd'));
	
	INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE) VALUES('leedb','1234','이재환','leedb','naver.com','010-1234-5678',to_char(sysdate,'rr.mm.dd'));

	-- LISTS
	SELECT COUNT(L_NUM) FROM LISTS WHERE L_PID=101;

	INSERT INTO LISTS(L_NUM, L_PID, L_MID) VALUES( '101', '101', 'admin');

	INSERT INTO LISTS(L_NUM, L_PID, L_MID) VALUES( (SELECT NVL(MAX(L_NUM), 0) + 1 FROM LISTS), '101', 'leedb');

	TRUNCATE TABLE LISTS ;
	
	-- CRAWLING
	INSERT INTO CRAWLING( C_NUM, C_NAME, C_INFO) VALUES( (SELECT NVL(MAX(C_NUM), 0) + 1 FROM CRAWLING), '샘플별', '샘플입니다');

	-- NAMING
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '천왕성', 'Uranus');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '수성', 'Mercury');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '지구', 'Earth');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '화성', 'Mars');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '해왕성', 'Neptuen');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '토성', 'Saturn');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '금성', 'Venus');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '태양', 'The Sun');
	INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), '목성', 'Jupiter');