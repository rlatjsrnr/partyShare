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

INSERT INTO joinMember(pNum, mNum) VALUES(8216, 2);
INSERT INTO member (mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES ('admin','admin','admin','관리자',30,'F','admin@Email.com','adminAddr');

INSERT INTO member (mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES ('id005','qwer','이인','이인',10,'M','admin2@Email.com','adminAddr');

INSERT INTO party (pName,host,sido,sigungu,address,startdate,enddate,maincategory)
VALUES ('testparty',1,'부산','해운대구','내주소','2023-08-06',CURDATE(),'게임');

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