use partyshare;
select * from member;

desc member;
select * from party;
desc party;
desc chat;
INSERT INTO party(pName, host, sido, sigungu, address, detailAddress, startDate, endDate, pContext, description, category, partyImage1, partyImage2, partyImage3)
SELECT pName, host, sido, sigungu, address, detailAddress, startDate, endDate, pContext, description, category, partyImage1,partyImage2,partyImage3 from party;
alter table party modify column pContext LONGTEXT;
select * from joinMember;
select * from member;
select * from party;
delete from joinMember;
delete from chat;
delete from map;
delete from party;
select * FROM chat;
alter table member modify column
INSERT INTO chat(pNum, mNum, nick, content) SELECT pNum, mNum, nick, content FROM chat;

INSERT INTO joinMember(pNum, mNum) VALUES(30, 1);
INSERT INTO member (mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES ('admin','admin','admin','관리자',30,'F','admin@Email.com','adminAddr');

INSERT INTO member (mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES ('id005','qwer','이인','이인',10,'M','admin2@Email.com','adminAddr');

INSERT INTO party (pName,host,sido,sigungu,address,startdate,enddate,maincategory)
VALUES ('testparty',1,'부산','해운대구','내주소','2023-08-06',CURDATE(),'게임');
alter table chat add column nick VARCHAR(50) not null;
alter table member drop column profileImage;
alter table member modify column profileImageName varchar(256);
alter table party modify column partyImage1 varchar(256);
alter table party modify column partyImage2 varchar(256);
alter table party modify column partyImage3 varchar(256);

delete from joinMember;
delete from party;

alter table party modify column address varchar(50) NOT NULL;

alter table party drop column address;
desc member;
desc party;
select * from party ORDER BY pNum desc;
ALTER TABLE joinpartylist -- 참여중인 파티테이블
DROP COLUMN pname,
DROP COLUMN startDate,
DROP COLUMN endDate,
DROP COLUMN finish;

ALTER TABLE friend -- 친구 테이블
DROP COLUMN msg;

-- auto_increment 속성 추가
ALTER TABLE joinpartylist
MODIFY COLUMN no INT AUTO_INCREMENT;

ALTER TABLE joinMember   
MODIFY COLUMN no INT AUTO_INCREMENT;

ALTER TABLE wishList    
MODIFY COLUMN no INT AUTO_INCREMENT;

show tables;
select * from joinpartylist;
SELECT * FROM party ORDER BY pNum DESC;
desc joinMember;
INSERT INTO joinMember(pNum, mNum) VALUES(8818, 1); 

SELECT LAST_INSERT_ID();
drop table joinpartylist;
select * from joinMember;

CREATE TABLE category (
    no INT AUTO_INCREMENT PRIMARY KEY ,
    description TEXT NOT NULL,   -- ex)광란의
    category VARCHAR(20) NOT NULL,  -- ex)캠핑
    SearchLocation VARCHAR(20) NOT NULL  -- 무시해도 됨 ( 검색 위치 구현 위해 만듦)
);
drop table category;

ALTER TABLE party
CHANGE COLUMN mainCategory description VARCHAR(20) NOT NULL,  -- ex)광란의
DROP COLUMN subCategory,
ADD COLUMN category VARCHAR(20) NOT NULL; -- ex)캠핑 

-- 파티 설명 테이블 ex)광란의
CREATE TABLE partyDescription (
    no INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(20) NOT NULL -- FK
);

-- 파티 주제 테이블 ex)캠핑
CREATE TABLE partyCategory(
    no INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(20) NOT NULL  -- FK
);

INSERT INTO partyCategory (category)
VALUES
('요리/제조'),
('아웃도어/여행'),
('운동/스포츠'),
('책/글'),
('업종/직무'),
('외국/언어'),
('문화/공연/축제'),
('음악/악기'),
('공예/만들기'),
('댄스/무용'),
('봉사활동'),
('사교/인맥'),
('차/오토바이'),
('사진/영상'),
('야구관람'),
('게임/오락'),
('반려동물'),
('가족/결혼'),
('그외');

INSERT INTO partyDescription (description)
VALUES
('기상천외한 파티'),
('초소형주택에서하는 파티'),
('캠핑장'),
('해변바로앞'),
('멋진 수영장'),
('속세를 벗어난 숙소'),
('럭셔리'),
('대저택'),
('창작파티'),
('보트'),
('서핑'),
('골프');

-- wishlist에 별칭 칼럼 추가
ALTER TABLE wishlist ADD alias VARCHAR(20) NOT NULL;

-- 파티게시판 조회수 컬럼 수정
ALTER TABLE partyBoard
CHANGE COLUMN viewcnt viewcnt INT default 0;	

desc joinMember;
desc banmember;
delete from banmember;
select * from banmember;
select * FROM member;
select * from joinMember;
select * from party;
INSERT into joinMember(pNum, mNum) VALUES(7671, 7);
INSERT into banMember(pNum, mNum) VALUES(8205, 1);


-- party table에 timestamp 추가
ALTER TABLE partyBoard
CHANGE COLUMN date date TIMESTAMP;   

-- partyBoard 테이블에 mid 컬럼 추가
ALTER TABLE partyBoard
ADD COLUMN mid VARCHAR(20);

-- mid 컬럼에 FOREIGN KEY 제약 조건 추가
ALTER TABLE partyBoard
ADD CONSTRAINT fk_member_mid
FOREIGN KEY (mid) REFERENCES member(mid) ON UPDATE CASCADE;

-- freeboard 테이블에 mid 컬럼 추가
ALTER TABLE freeboard
ADD COLUMN mid VARCHAR(20);

-- mid 컬럼에 FOREIGN KEY 제약 조건 추가
ALTER TABLE freeboard
ADD CONSTRAINT fk_freeboard_mid
FOREIGN KEY (mid) REFERENCES member(mid) ON UPDATE CASCADE;

select * from party;
select * from chat;
select * from map;
desc map;
desc party;
DROP TABLE chat;
alter table party modify column pcontext LONGTEXT;
CREATE TABLE chat(
	cNum INT PRIMARY KEY AUTO_INCREMENT,
	pNum INT,
	mNum INT,
	content TEXT NOT NULL,
	finish CHAR NOT NULL DEFAULT 'N',
	FOREIGN KEY (pNum) REFERENCES party (pNum) ON UPDATE CASCADE,
	FOREIGN KEY (mNum) REFERENCES member (mNum) ON UPDATE CASCADE
);

select * FROM party ORDER BY pNum desc;
select * FROM member ORDER BY mNum desc;
INSERT INTO chat(pNum, mNum, content) VALUES(7669, 5, 'hello');
select * from chat;
select * FROM member;
DROP TABLE friend;

CREATE TABLE friend  -- --친구 추가 --  
(
   no   INT primary key auto_increment,
    fFrom int NOT NULL,   
    fTo int NOT NULL,
    YN CHAR(1) default 'N',
    requestTime TIMESTAMP default NOW(), 
    FOREIGN KEY (fFrom) REFERENCES member(mnum) ON UPDATE CASCADE,
    FOREIGN KEY (fTo) REFERENCES member(mnum) ON UPDATE CASCADE
);
select * from chat;
insert into joinMember(pNum, mNum) values(8215, 2);
delete from chat;


-- freeBoard 컬럼 수정
ALTER TABLE freeBoard MODIFY COLUMN date DATETIME;

-- freeBoard 댓글 테이블 추가
CREATE TABLE IF NOT EXISTS freeBoardComment(
   cno INT PRIMARY KEY AUTO_INCREMENT,         -- 댓글 번호
   bno INT NOT NULL,                      -- 댓글 작성 게시글 번호
   commentText TEXT NOT NULL,               -- 댓글 내용
   mnick VARCHAR(20) NOT NULL,               -- 작성자 닉네임
   mid VARCHAR(20) NOT NULL,               -- 작성자 아이디
   regdate DATETIME NOT NULL DEFAULT now(),   -- 작성시간
   FOREIGN KEY(bno) REFERENCES freeBoard(bno) ON DELETE CASCADE,
   FOREIGN KEY(mnick) REFERENCES member(mNick) ON UPDATE CASCADE,
   FOREIGN KEY(mid) REFERENCES member(mId) ON UPDATE CASCADE
);

drop table partyboard;

CREATE TABLE partyboard(
   bno INT PRIMARY KEY auto_increment,    -- 게시글 번호
    pnum INT NOT NULL,                   -- 파티 번호
   title VARCHAR(200) NOT NULL,         -- 제목
   content LONGTEXT NOT NULL,            -- 내용
   writer VARCHAR(50) NOT NULL,         -- 작성자 이름
    category VARCHAR(20) NOT NULL,         -- 카테고리
   origin INT NULL DEFAULT 0,            -- 원본글 그룹 번호
   depth INT NULL DEFAULT 0,            -- view 깊이 번호
   seq INT NULL DEFAULT 0,               -- 답변글 정렬 순서
   regdate TIMESTAMP NULL DEFAULT NOW(),    -- 게시글 등록 시간
   updatedate TIMESTAMP NULL DEFAULT now(),-- 게시글 수정 시간
   viewcnt INT NULL DEFAULT 0,            -- 조회수
   showboard VARCHAR(10) NULL DEFAULT 'y',   -- 게시글 삭제요청 여부
   mnum INT NOT NULL,                  -- 게시글 작성자 회원번호
   reported char(1) default 'N',
   CONSTRAINT fk_partyboard_mnum
   FOREIGN KEY(mnum) REFERENCES member(mnum),
    CONSTRAINT fk_partyboard_pnum
   FOREIGN KEY(pnum) REFERENCES party(pnum)
);

-- 파티 게시판 댓글 테이블 생성

CREATE TABLE partyboard_comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,         -- 댓글 번호
   bno INT NOT NULL,                     -- 댓글 작성 게시글 번호
   pnum INT NOT NULL,                     -- 파티 번호
   commentText TEXT NOT NULL,               -- 댓글 내용
   mnick VARCHAR(20) NOT NULL,               -- 작성자 닉네임
   mid VARCHAR(20) NOT NULL,               -- 작성자 아이디
   regdate TIMESTAMP NOT NULL DEFAULT now(),   -- 작성시간
   updatedate TIMESTAMP NOT NULL DEFAULT now(),-- 수정시간
   reported char(1) default 'N',
   CONSTRAINT fk_partyboard_comment_bno FOREIGN KEY(bno) -- 참조무결성 추가
   REFERENCES partyboard(bno) ON DELETE CASCADE,
   CONSTRAINT fk_partyboard_comment_pnum      
   FOREIGN KEY(pnum) REFERENCES party(pnum)ON DELETE CASCADE,
   CONSTRAINT fk_partyboard_comment_mnick      
   FOREIGN KEY(mnick) REFERENCES member(mnick)ON DELETE CASCADE,
   CONSTRAINT fk_partyboard_comment_mid      
   FOREIGN KEY(mid) REFERENCES member(mid)ON DELETE CASCADE,
   INDEX(bno)                           -- 인덱스 추가
);

-- 파티게시판 신고내역테이블 신규 생성
CREATE TABLE partyboard_report  
(
    no          INT primary key auto_increment,  
    fromMid     VARCHAR(20)  NOT NULL,  
    toMid       VARCHAR(20)  NOT NULL,
    date         TIMESTAMP default now(),
    category   VARCHAR(20) NOT NULL,   -- 신고 카테고리 
    context    TEXT  NOT NULL,   -- 신고 내용 
    readed char(1) default 'N',
    pnum INT, -- 파티번호
    bno INT, -- 게시글 번호
    cno INT, -- 댓글 번호
   FOREIGN KEY (pnum) REFERENCES party(pnum)ON DELETE CASCADE,
   FOREIGN KEY (bno) REFERENCES partyboard(bno)ON DELETE CASCADE,
   FOREIGN KEY (cno) REFERENCES partyboard_comment(cno)ON DELETE CASCADE,
   FOREIGN KEY (fromMid) REFERENCES member(mId) ON UPDATE CASCADE,
    FOREIGN KEY (toMid) REFERENCES member(mId) ON UPDATE CASCADE
);


-- 신고 관련 수정
ALTER TABLE report
ADD COLUMN bno INT null,
ADD FOREIGN KEY (bno) REFERENCES freeboard(bno);

ALTER TABLE report
ADD COLUMN cno INT,
ADD FOREIGN KEY (cno) REFERENCES freeBoardComment(bno);

ALTER table notice modify column date TIMESTAMP default now();
ALTER table notice add column readed char(1) default 'N';

-- freeBoard 컬럼 수정
ALTER TABLE freeBoard MODIFY COLUMN date DATETIME;

-- freeBoard 댓글 테이블 추가
CREATE TABLE IF NOT EXISTS freeBoardComment(
   cno INT PRIMARY KEY AUTO_INCREMENT,         -- 댓글 번호
   bno INT NOT NULL,                      -- 댓글 작성 게시글 번호
   commentText TEXT NOT NULL,               -- 댓글 내용
   mnick VARCHAR(20) NOT NULL,               -- 작성자 닉네임
   mid VARCHAR(20) NOT NULL,               -- 작성자 아이디
   regdate DATETIME NOT NULL DEFAULT now(),   -- 작성시간
   FOREIGN KEY(bno) REFERENCES freeBoard(bno) ON DELETE CASCADE,
   FOREIGN KEY(mnick) REFERENCES member(mNick) ON UPDATE CASCADE,
   FOREIGN KEY(mid) REFERENCES member(mId) ON UPDATE CASCADE
);

alter table freeBoardComment add column reported char(1) default 'N';
alter table freeBoard add column reported char(1) default 'N'; 

-- --------------------------------------------
create database PartyShare;
use PartyShare;
show tables;
CREATE TABLE member 	  -- 회원테이블 
(
    mnum    INT primary key auto_increment,    
    mid       VARCHAR(20) NOT NULL unique, 
    mpw       VARCHAR(20) NOT NULL, 
    mmame     VARCHAR(20) NOT NULL, 
    mnick 	  VARCHAR(20) NOT NULL unique, 
    mage      INT NOT NULL, 
    mgender   CHAR(1) NOT NULL, 
    memail     VARCHAR(50) NOT NULL unique, 
    mbanCnt 	INT  default 0,
    maddr 		VARCHAR(50) NOT NULL, 
    mjoinCnt 	INT  default 0,
    mblackYN CHAR(1) default 'N',
    withdraw CHAR(1) default 'N',
    profileImage BLOB,
    profileImageName BLOB
);

CREATE TABLE party -- 파티 
(
    pnum    INT primary key auto_increment,    
    pname       VARCHAR(50) NOT NULL ,
    host       INT NOT NULL ,
    sido     	VARCHAR(20) NOT NULL ,
    sigungu 	VARCHAR(20) NOT NULL ,
    address    VARCHAR(50) NOT NULL , -- 도로명 주소
    detailAddress VARCHAR(50) , -- 상세주소
    startDate   DATE NOT NULL ,
    endDate     DATE NOT NULL ,
    pcontext 	TEXT ,
    mainCategory 	VARCHAR(20) NOT NULL , -- 대분류
    subCategory 	VARCHAR(20),		-- 소분류
    finish 		CHAR(1) default 'N',
    viewCnt  	INT,
    partyImage1 BLOB,
    partyImage2 BLOB,
    partyImage3 BLOB,
    FOREIGN KEY (host) REFERENCES member(mNum) ON UPDATE CASCADE
);
drop table wishList;
CREATE TABLE wishList 	-- 위시리스트-- 
(
	 no       INT primary key,
    mnum   		int,	
    pnum       VARCHAR(50) NOT NULL ,
    FOREIGN KEY (mnum) REFERENCES member(mnum) ON UPDATE CASCADE
);

CREATE TABLE freeBoard  -- --자유게시판--  
(
    bno    INT primary key auto_increment,    
    category    VARCHAR(20) NOT NULL ,   -- 공지/일반
    title       VARCHAR(20) NOT NULL ,
    context   	TEXT ,
    date 		DATE,
    mnick     VARCHAR(20),
    viewCnt   int ,
    FOREIGN KEY (mnick) REFERENCES member(mnick) ON UPDATE CASCADE
);

CREATE TABLE partyBoard  -- --파티 게시판--  
(
    bno    INT primary key auto_increment,   
    pnum 	INT,
    category    VARCHAR(20) NOT NULL ,   -- 공지/일반
    title       VARCHAR(20) NOT NULL ,
    context   	TEXT ,
    date 		DATE,
    mnick     VARCHAR(20),
    viewCnt   int ,
    FOREIGN KEY (mnick) REFERENCES member(mnick) ON UPDATE CASCADE,
    FOREIGN KEY (pnum) REFERENCES party(pnum) ON UPDATE CASCADE
);

CREATE TABLE chat  -- --채팅--  
(
    pnum    INT primary key auto_increment,   
    context  VARCHAR(20)  NOT NULL,
    finish    VARCHAR(20) NOT NULL ,  
    FOREIGN KEY (pnum) REFERENCES party(pnum) ON UPDATE CASCADE
);


CREATE TABLE friend  -- --친구 추가 --  
(
	no	INT primary key,
    fFrom     VARCHAR(20)  NOT NULL,   
    fTo  VARCHAR(20)  NOT NULL,
    YN    CHAR(1) NOT NULL ,  
    msg  VARCHAR(50)  ,
    FOREIGN KEY (fFrom) REFERENCES member(mnick) ON UPDATE CASCADE,
    FOREIGN KEY (fTo) REFERENCES member(mnick) ON UPDATE CASCADE
);

CREATE TABLE joinMember   -- 파티 참여 인원 --  
(
	no	INT primary key,
    pnum    INT NOT NULL,   
    mnum  	INT  NOT NULL,
    FOREIGN KEY (pnum) REFERENCES party(pnum) ON UPDATE CASCADE,
    FOREIGN KEY (mnum) REFERENCES member(mnum) ON UPDATE CASCADE
);

CREATE TABLE partyLocation   -- 파티장소 --   -- 진행 중
(	
    pnum   	INT primary key,
    lat  	double  NOT NULL,
    lng     double	NOT NULL
);

CREATE TABLE joinPartyList  -- -- 참가 중인 파티 목록 --  
(
	no	INT primary key,
    mnum     INT  NOT NULL,   
    pnum  	 INT  NOT NULL,
    pname    CHAR(20) NOT NULL ,  
    startDate  date NOT NULL ,
    endDate   date NOT NULL, 
    finish	CHAR(1),
    FOREIGN KEY (mnum) REFERENCES member(mnum) ON UPDATE CASCADE,
    FOREIGN KEY (pnum) REFERENCES party(pnum) ON UPDATE CASCADE
);

CREATE TABLE blackList  -- -- admin 블랙리스트 --  
(
    no    	INT primary key auto_increment,  
    mnum     INT  NOT NULL,   
    date  	 date NOT NULL,
	FOREIGN KEY (mnum) REFERENCES member(mnum) ON UPDATE CASCADE
);


CREATE TABLE report  -- -- 신고내역 --  
(
    no    		INT primary key auto_increment,  
    fromMid     VARCHAR(20)  NOT NULL,  
    toMid 		VARCHAR(20)  NOT NULL,
    date  		date NOT NULL,
    category   VARCHAR(20) NOT NULL,   -- 신고 카테고리 
    context    TEXT  NOT NULL,   -- 신고 내용 
	FOREIGN KEY (fromMid) REFERENCES member(mId) ON UPDATE CASCADE,
    FOREIGN KEY (toMid) REFERENCES member(mId) ON UPDATE CASCADE
);

CREATE TABLE notice  -- -- 알림 --  
(
    noticeNum    	INT primary key auto_increment,  
    date  			 date NOT NULL,
    context   		 TEXT  NOT NULL   
);

CREATE TABLE banMember -- -- 신고내역 --
(
no INT primary key auto_increment,
pnum INT NOT NULL,
mnum INT NOT NULL,
FOREIGN KEY (pnum) REFERENCES party(pnum) ON UPDATE CASCADE,
FOREIGN KEY (mnum) REFERENCES member(mnum) ON UPDATE CASCADE
);

CREATE TABLE map -- -- 지도 --
(
no INT primary key auto_increment,
pnum INT NOT NULL,
lat VARCHAR(50) NOT NULL, -- 위도 y좌표 lat
lng VARCHAR(50) NOT NULL, -- 경도 x좌표 lng
FOREIGN KEY (pnum) REFERENCES party(pnum) ON UPDATE CASCADE
);

ALTER TABLE joinpartylist -- 참여중인 파티테이블
DROP COLUMN pname,
DROP COLUMN startDate,
DROP COLUMN endDate,
DROP COLUMN finish;

ALTER TABLE friend -- 친구 테이블
DROP COLUMN msg;

-- auto_increment 속성 추가
ALTER TABLE joinMember   
MODIFY COLUMN no INT AUTO_INCREMENT;

ALTER TABLE wishList 	
MODIFY COLUMN no INT AUTO_INCREMENT;

-- joinpartylist 중복 테이블 삭제
drop table joinpartylist;

-- 아래부터 카테고리 수정분입니다.

-- 파티 설명 테이블 ex)광란의
CREATE TABLE partyDescription (
    no INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(20) NOT NULL -- FK
);

-- 파티 주제 테이블 ex)캠핑
CREATE TABLE partyCategory(
    no INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(20) NOT NULL  -- FK
);


INSERT INTO partyCategory (category)
VALUES
('요리/제조'),
('아웃도어/여행'),
('운동/스포츠'),
('책/글'),
('업종/직무'),
('외국/언어'),
('문화/공연/축제'),
('음악/악기'),
('공예/만들기'),
('댄스/무용'),
('봉사활동'),
('사교/인맥'),
('차/오토바이'),
('사진/영상'),
('야구관람'),
('게임/오락'),
('반려동물'),
('가족/결혼'),
('그외');

INSERT INTO partyDescription (description)
VALUES
('기상천외한 파티'),
('초소형주택에서하는 파티'),
('캠핑장'),
('해변바로앞'),
('멋진 수영장'),
('속세를 벗어난 숙소'),
('럭셔리'),
('대저택'),
('창작파티'),
('보트'),
('서핑'),
('골프');

-- wishlist에 별칭 칼럼 추가
ALTER TABLE wishlist ADD alias VARCHAR(20) NOT NULL;

-- 카테고리 table 컬럼명에 맞추어 party table 컬럼명 변경
ALTER TABLE party
CHANGE COLUMN mainCategory description VARCHAR(20) NOT NULL,  -- ex)광란의
DROP COLUMN subCategory,
ADD COLUMN category VARCHAR(20) NOT NULL; -- ex)캠핑 

-- 파티게시판 조회수 컬럼 수정
ALTER TABLE partyBoard
CHANGE COLUMN viewcnt viewcnt INT default 0;	

-- member 테이블 party 테이블 이미지 컬럼 수정
alter table member drop column profileImage;
alter table member modify column profileImageName varchar(256);
alter table party modify column partyImage1 varchar(256);
alter table party modify column partyImage2 varchar(256);
alter table party modify column partyImage3 varchar(256);

-- 친구 테이블 수정
DROP TABLE friend;
CREATE TABLE friend  -- --친구 추가 --  
(
	no	INT primary key auto_increment,
    fFrom int NOT NULL,   
    fTo int NOT NULL,
    YN CHAR(1) default 'N',
    requestTime TIMESTAMP default NOW(), 
    FOREIGN KEY (fFrom) REFERENCES member(mnum) ON UPDATE CASCADE,
    FOREIGN KEY (fTo) REFERENCES member(mnum) ON UPDATE CASCADE
);

-- 채팅 테이블 수정

DROP TABLE chat;

CREATE TABLE chat(
   cnum INT PRIMARY KEY AUTO_INCREMENT,
   pnum INT,
   mnum INT,
   content TEXT NOT NULL,
   finish CHAR NOT NULL DEFAULT 'N',
   FOREIGN KEY (pnum) REFERENCES party (pnum) ON UPDATE CASCADE,
   FOREIGN KEY (mnum) REFERENCES member (mnum) ON UPDATE CASCADE
);

-- notice table 수정
ALTER table notice modify column date TIMESTAMP default now();
ALTER table notice add column readed char(1) default 'N';

-- freeBoard 컬럼 수정
ALTER TABLE freeBoard MODIFY COLUMN date DATETIME;

-- freeBoard 댓글 테이블 추가
CREATE TABLE IF NOT EXISTS freeBoardComment(
   cno INT PRIMARY KEY AUTO_INCREMENT,         -- 댓글 번호
   bno INT NOT NULL,                      -- 댓글 작성 게시글 번호
   commentText TEXT NOT NULL,               -- 댓글 내용
   mnick VARCHAR(20) NOT NULL,               -- 작성자 닉네임
   mid VARCHAR(20) NOT NULL,               -- 작성자 아이디
   regdate DATETIME NOT NULL DEFAULT now(),   -- 작성시간
   FOREIGN KEY(bno) REFERENCES freeBoard(bno) ON DELETE CASCADE,
   FOREIGN KEY(mnick) REFERENCES member(mNick) ON UPDATE CASCADE,
   FOREIGN KEY(mid) REFERENCES member(mId) ON UPDATE CASCADE
);


-- 파티 게시판 수정
drop table partyboard;

CREATE TABLE partyboard(
	bno INT PRIMARY KEY auto_increment, 	-- 게시글 번호
    pnum INT NOT NULL, 						-- 파티 번호
	title VARCHAR(200) NOT NULL,			-- 제목
	content LONGTEXT NOT NULL,				-- 내용
	writer VARCHAR(50) NOT NULL,			-- 작성자 이름
    category VARCHAR(20) NOT NULL,			-- 카테고리
	origin INT NULL DEFAULT 0,				-- 원본글 그룹 번호
	depth INT NULL DEFAULT 0,				-- view 깊이 번호
	seq INT NULL DEFAULT 0,					-- 답변글 정렬 순서
	regdate TIMESTAMP NULL DEFAULT NOW(), 	-- 게시글 등록 시간
	updatedate TIMESTAMP NULL DEFAULT now(),-- 게시글 수정 시간
	viewcnt INT NULL DEFAULT 0,				-- 조회수
	showboard VARCHAR(10) NULL DEFAULT 'y',	-- 게시글 삭제요청 여부
	mnum INT NOT NULL,						-- 게시글 작성자 회원번호
	reported char(1) default 'N',
	CONSTRAINT fk_partyboard_mnum
	FOREIGN KEY(mnum) REFERENCES member(mnum),
    CONSTRAINT fk_partyboard_pnum
	FOREIGN KEY(pnum) REFERENCES party(pnum)
);

-- 파티 게시판 댓글 테이블 생성

CREATE TABLE partyboard_comment(
	cno INT PRIMARY KEY AUTO_INCREMENT,			-- 댓글 번호
	bno INT NOT NULL,							-- 댓글 작성 게시글 번호
	pnum INT NOT NULL,							-- 파티 번호
	commentText TEXT NOT NULL,					-- 댓글 내용
	mnick VARCHAR(20) NOT NULL,					-- 작성자 닉네임
	mid VARCHAR(20) NOT NULL,					-- 작성자 아이디
	regdate TIMESTAMP NOT NULL DEFAULT now(),	-- 작성시간
	updatedate TIMESTAMP NOT NULL DEFAULT now(),-- 수정시간
	reported char(1) default 'N',
	CONSTRAINT fk_partyboard_comment_bno FOREIGN KEY(bno) -- 참조무결성 추가
	REFERENCES partyboard(bno) ON DELETE CASCADE,
	CONSTRAINT fk_partyboard_comment_pnum		
	FOREIGN KEY(pnum) REFERENCES party(pnum)ON DELETE CASCADE,
	CONSTRAINT fk_partyboard_comment_mnick		
	FOREIGN KEY(mnick) REFERENCES member(mnick)ON DELETE CASCADE,
	CONSTRAINT fk_partyboard_comment_mid		
	FOREIGN KEY(mid) REFERENCES member(mid)ON DELETE CASCADE,
	INDEX(bno)									-- 인덱스 추가
);

-- 파티게시판 신고내역테이블 신규 생성
CREATE TABLE partyboard_report  
(
    no    		INT primary key auto_increment,  
    fromMid     VARCHAR(20)  NOT NULL,  
    toMid 		VARCHAR(20)  NOT NULL,
    date  		 TIMESTAMP default now(),
    category   VARCHAR(20) NOT NULL,   -- 신고 카테고리 
    context    TEXT  NOT NULL,   -- 신고 내용 
    readed char(1) default 'N',
    pnum INT, -- 파티번호
    bno INT, -- 게시글 번호
    cno INT, -- 댓글 번호
	FOREIGN KEY (pnum) REFERENCES party(pnum)ON DELETE CASCADE,
	FOREIGN KEY (bno) REFERENCES partyboard(bno)ON DELETE CASCADE,
	FOREIGN KEY (cno) REFERENCES partyboard_comment(cno)ON DELETE CASCADE,
	FOREIGN KEY (fromMid) REFERENCES member(mId) ON UPDATE CASCADE,
    FOREIGN KEY (toMid) REFERENCES member(mId) ON UPDATE CASCADE
);


-- 신고 관련 수정
ALTER TABLE report
ADD COLUMN bno INT null,
ADD FOREIGN KEY (bno) REFERENCES freeboard(bno);

ALTER TABLE report
ADD COLUMN cno INT,
ADD FOREIGN KEY (cno) REFERENCES freeBoardComment(bno);

alter table freeBoardComment add column reported char(1) default 'N';
alter table freeBoard add column reported char(1) default 'N'; 
ALTER TABLE member CHANGE COLUMN mmame mname VARCHAR(20) not null; 
show tables;
desc member;
select * FROM party;

INSERT INTO member (mid,mpw,mname,mnick,mage,mgender,memail,maddr)
VALUES ('admin','admin','admin','관리자',30,'F','admin@Email.com','adminAddr');
INSERT INTO member (mnum,mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES (2,'id001','1111','김서영','김서영',30,'F','kim@Email.com','김서영Addr');
INSERT INTO member (mnum,mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES (3,'id002','1111','이진형','이진형',30,'M','lee@Email.com','2Addr');
INSERT INTO member (mnum,mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES (4,'id003','1111','김선국','김선국',30,'M','kim2@Email.com','3Addr');
INSERT INTO member (mnum,mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES (5,'id004','1111','이인','이인',30,'M','lee2@Email.com','4Addr');
INSERT INTO member (mnum,mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES (6,'id005','1111','김진우','김진우',30,'M','lee3@Email.com','5Addr');