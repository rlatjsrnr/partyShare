use partyshare;
select * from member;
alter table member add column profileImageName BLOB;
desc member;
select * from party;
desc party;
delete from party;
delete from joinMember;
INSERT INTO party(pName, host, sido, sigungu, address, detailAddress, startDate, endDate, pContext, description, category, partyImage1)
SELECT pName, host, sido, sigungu, address, detailAddress, startDate, endDate, pContext, description, category, partyImage1 from party;

select * from joinMember;
select * from member;
select * from party;

INSERT INTO joinMember(pNum, mNum) VALUES(7660, 8);
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