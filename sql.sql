use partyshare;
select * from member;
alter table member add column profileImageName BLOB;
desc member;
select * from party;
desc party;
delete from party;
INSERT INTO party(pName, host, sido, sigungu, address, startDate, endDate, pContext, mainCategory, subCategory, partyImage1)
SELECT pName, host, sido, sigungu, address, startDate, endDate, pContext, mainCategory, subCategory, partyImage1 from party;