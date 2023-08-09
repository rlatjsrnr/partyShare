use partyshare;
select * from member;
alter table member add column profileImageName BLOB;
desc member;
select * from party;
desc party;
delete from party;
INSERT INTO party(pName, host, startDate, endDate, pContext, mainCategory, subCategory, partyImage1)
SELECT pName, host, startDate, endDate, pContext, mainCategory, subCategory, partyImage1 from party;

INSERT INTO member (mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES ('admin','admin','admin','관리자',30,'F','adminEmail','adminAddr');

INSERT INTO party (pName,host,sido,sigungu,address,startdate,enddate,maincategory)
VALUES ('testparty',1,'부산','해운대구','내주소','2023-08-06',CURDATE(),'게임');

alter table member modify column profileImageName varchar(256);
alter table party modify column partyImage3 varchar(256);
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

select * from joinMember;
