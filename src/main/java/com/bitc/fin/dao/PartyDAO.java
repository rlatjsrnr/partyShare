package com.bitc.fin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.board.util.Criteria;
import com.bitc.fin.vo.MapVO;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

public interface PartyDAO {
	@Insert("INSERT INTO party(pName, host, startDate, endDate, pContext, description, category , sido, sigungu, address, detailAddress, partyImage1,partyImage2,partyImage3) "
			+ "VALUES(#{pName}, #{host}, #{startDate},#{endDate}, #{pContext}, #{description}, #{category}, #{sido},#{sigungu}, #{address}, #{detailAddress}, #{partyImage1},#{partyImage2},#{partyImage3})")
	public int createParty(PartyVO vo) throws Exception;
	
	@Select("SELECT LAST_INSERT_ID()")
	public int lastIndex() throws Exception;
	
	@Select("SELECT * FROM party WHERE finish = 'N' ORDER BY pNum DESC limit #{startRow}, #{perPageNum}")
	public List<PartyVO> partyList(Criteria cri) throws Exception;
	
	@Select("SELECT * FROM party WHERE pNum=#{pNum}")
	public PartyVO selectParty(int pNum) throws Exception;
	
	@Select("SELECT count(*) FROM party WHERE finish = 'N'")
	public int totalCount() throws Exception;
	
	@Insert("INSERT INTO joinMember(pNum, mNum) VALUES(#{pNum}, #{mNum})")
	public int joinPartyMember(Map<String, Integer> map) throws Exception;
	
	@Select("SELECT description FROM partyDescription")
	public List<String> getDescriptionList() throws Exception;
	
	@Select("SELECT category FROM partyCategory")
	public List<String> getCategoryList() throws Exception;
	
	@Select("SELECT * FROM member WHERE mNum IN (SELECT mNum FROM joinMember WHERE pNum=#{pNum})")
	public List<MemberVO> getJoinPartyMember(int pNum) throws Exception;
	
	@Delete("Delete FROM joinMember WHERE pNum=#{pNum} AND mNum=#{mNum}")
	public int partyMemberBan(Map<String, Integer> map) throws Exception;
	
	@Update("UPDATE party SET finish='Y' WHERE pNum=#{pNum}")
	public int setPartyFinish(int pNum) throws Exception; 
	
	@Insert("INSERT INTO banmember(pNum, mNum) VALUES(#{pNum}, #{mNum})")
	public int insertBanMember(Map<String, Integer> map) throws Exception; 
	
	@Insert("INSERT INTO map VALUES(null, #{pNum}, #{lat}, #{lng})")
	public int setLocation(MapVO map);
	
	@Update("UPDATE chat SET finish='Y' WHERE pNum=#{pNum}")
	public int setPartyChatFinish(int pNum);
}
