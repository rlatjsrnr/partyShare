use partyshare;
select * from member;
alter table member add column profileImageName BLOB;
desc member;
select * from party;
desc party;
delete from party;
INSERT INTO party(pName, host, sido, sigungu, address, startDate, endDate, pContext, mainCategory, subCategory, partyImage1)
SELECT pName, host, sido, sigungu, address, startDate, endDate, pContext, mainCategory, subCategory, partyImage1 from party;

INSERT INTO member (mId,mPw,mName,mNick,mAge,mGender,mEmail,mAddr)
VALUES ('admin','admin','admin','관리자',30,'F','adminEmail','adminAddr');

INSERT INTO party (pName,host,sido,sigungu,address,startdate,enddate,maincategory)
VALUES ('testparty',1,'부산','해운대구','내주소','2023-08-06',CURDATE(),'게임');

alter table member modify column profileImageName varchar(256);
alter table member drop column profileImage;
desc member;